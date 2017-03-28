Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:35178 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751364AbdC1L4I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Mar 2017 07:56:08 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/4] usb: gadget: udc: add USB ID signal monitoring
Date: Tue, 28 Mar 2017 20:53:22 +0900
Message-ID: <1490702004-8167-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1490702004-8167-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1490702004-8167-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This usb 3.0 peripheral controller has a register (USB_OTG_STA) to monitor
the USB ID signal. So, this patch adds the ID signal monitoring to change
the mode to host (A-Device) or peripheral (B-Device).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 47 +++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 4029593..d81953b 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -37,6 +37,9 @@
 #define USB3_USB_INT_ENA_2	0x22c
 #define USB3_STUP_DAT_0		0x230
 #define USB3_STUP_DAT_1		0x234
+#define USB3_USB_OTG_STA	0x268
+#define USB3_USB_OTG_INT_STA	0x26c
+#define USB3_USB_OTG_INT_ENA	0x270
 #define USB3_P0_MOD		0x280
 #define USB3_P0_CON		0x288
 #define USB3_P0_STA		0x28c
@@ -124,6 +127,9 @@
 /* USB_INT_ENA_2 and USB_INT_STA_2 */
 #define USB_INT_2_PIPE(n)	BIT(n)
 
+/* USB_OTG_STA, USB_OTG_INT_STA and USB_OTG_INT_ENA */
+#define USB_OTG_IDMON		BIT(4)
+
 /* P0_MOD */
 #define P0_MOD_DIR		BIT(6)
 
@@ -540,17 +546,39 @@ static void usb3_check_vbus(struct renesas_usb3 *usb3)
 	}
 }
 
+static void usb3_mode_a_host(struct renesas_usb3 *usb3)
+{
+	usb3_clear_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON);
+	usb3_set_bit(usb3, DRD_CON_VBOUT, USB3_DRD_CON);
+}
+
 static void usb3_mode_b_peri(struct renesas_usb3 *usb3)
 {
 	usb3_set_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON);
 	usb3_clear_bit(usb3, DRD_CON_VBOUT, USB3_DRD_CON);
 }
 
+static bool usb3_is_a_device(struct renesas_usb3 *usb3)
+{
+	return !(usb3_read(usb3, USB3_USB_OTG_STA) & USB_OTG_IDMON);
+}
+
+static void usb3_check_id(struct renesas_usb3 *usb3)
+{
+	if (usb3_is_a_device(usb3) && !usb3->forced_b_device)
+		usb3_mode_a_host(usb3);
+	else
+		usb3_mode_b_peri(usb3);
+}
+
 static void renesas_usb3_init_controller(struct renesas_usb3 *usb3)
 {
 	usb3_init_axi_bridge(usb3);
 	usb3_init_epc_registers(usb3);
+	usb3_write(usb3, USB_OTG_IDMON, USB3_USB_OTG_INT_STA);
+	usb3_write(usb3, USB_OTG_IDMON, USB3_USB_OTG_INT_ENA);
 
+	usb3_check_id(usb3);
 	usb3_check_vbus(usb3);
 }
 
@@ -559,6 +587,7 @@ static void renesas_usb3_stop_controller(struct renesas_usb3 *usb3)
 	usb3_disconnect(usb3);
 	usb3_write(usb3, 0, USB3_P0_INT_ENA);
 	usb3_write(usb3, 0, USB3_PN_INT_ENA);
+	usb3_write(usb3, 0, USB3_USB_OTG_INT_ENA);
 	usb3_write(usb3, 0, USB3_USB_INT_ENA_1);
 	usb3_write(usb3, 0, USB3_USB_INT_ENA_2);
 	usb3_write(usb3, 0, USB3_AXI_INT_ENA);
@@ -1492,10 +1521,22 @@ static void usb3_irq_epc_int_2(struct renesas_usb3 *usb3, u32 int_sta_2)
 	}
 }
 
+static void usb3_irq_idmon_change(struct renesas_usb3 *usb3)
+{
+	usb3_check_id(usb3);
+}
+
+static void usb3_irq_otg_int(struct renesas_usb3 *usb3, u32 otg_int_sta)
+{
+	if (otg_int_sta & USB_OTG_IDMON)
+		usb3_irq_idmon_change(usb3);
+}
+
 static void usb3_irq_epc(struct renesas_usb3 *usb3)
 {
 	u32 int_sta_1 = usb3_read(usb3, USB3_USB_INT_STA_1);
 	u32 int_sta_2 = usb3_read(usb3, USB3_USB_INT_STA_2);
+	u32 otg_int_sta = usb3_read(usb3, USB3_USB_OTG_INT_STA);
 
 	int_sta_1 &= usb3_read(usb3, USB3_USB_INT_ENA_1);
 	if (int_sta_1) {
@@ -1506,6 +1547,12 @@ static void usb3_irq_epc(struct renesas_usb3 *usb3)
 	int_sta_2 &= usb3_read(usb3, USB3_USB_INT_ENA_2);
 	if (int_sta_2)
 		usb3_irq_epc_int_2(usb3, int_sta_2);
+
+	otg_int_sta &= usb3_read(usb3, USB3_USB_OTG_INT_ENA);
+	if (otg_int_sta) {
+		usb3_write(usb3, otg_int_sta, USB3_USB_OTG_INT_STA);
+		usb3_irq_otg_int(usb3, otg_int_sta);
+	}
 }
 
 static irqreturn_t renesas_usb3_irq(int irq, void *_usb3)
-- 
1.9.1
