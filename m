Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:45827 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753170AbdC3CSX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Mar 2017 22:18:23 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 1/3] usb: gadget: udc: add USB ID signal monitoring
Date: Thu, 30 Mar 2017 11:16:04 +0900
Message-ID: <1490840166-18449-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1490840166-18449-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1490840166-18449-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This usb 3.0 peripheral controller has a register (USB_OTG_STA) to monitor
the USB ID signal. So, this patch adds the ID signal monitoring to change
the mode to host (A-Host) or peripheral (B-Peripheral).
This patch also removes hardcoded setting as B-Peripheral mode.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 67 ++++++++++++++++++++++++++++++++---
 1 file changed, 63 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 2218f91..3e96c56 100644
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
 
@@ -362,10 +368,6 @@ static void usb3_init_axi_bridge(struct renesas_usb3 *usb3)
 
 static void usb3_init_epc_registers(struct renesas_usb3 *usb3)
 {
-	/* FIXME: How to change host / peripheral mode as well? */
-	usb3_set_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON);
-	usb3_clear_bit(usb3, DRD_CON_VBOUT, USB3_DRD_CON);
-
 	usb3_write(usb3, ~0, USB3_USB_INT_STA_1);
 	usb3_enable_irq_1(usb3, USB_INT_1_VBUS_CNG);
 }
@@ -538,11 +540,49 @@ static void usb3_check_vbus(struct renesas_usb3 *usb3)
 	}
 }
 
+static void usb3_set_mode(struct renesas_usb3 *usb3, bool host)
+{
+	if (host)
+		usb3_clear_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON);
+	else
+		usb3_set_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON);
+}
+
+static void usb3_vbus_out(struct renesas_usb3 *usb3, bool enable)
+{
+	if (enable)
+		usb3_set_bit(usb3, DRD_CON_VBOUT, USB3_DRD_CON);
+	else
+		usb3_clear_bit(usb3, DRD_CON_VBOUT, USB3_DRD_CON);
+}
+
+static void usb3_mode_config(struct renesas_usb3 *usb3, bool host, bool a_dev)
+{
+	usb3_set_mode(usb3, host);
+	usb3_vbus_out(usb3, a_dev);
+}
+
+static bool usb3_is_a_device(struct renesas_usb3 *usb3)
+{
+	return !(usb3_read(usb3, USB3_USB_OTG_STA) & USB_OTG_IDMON);
+}
+
+static void usb3_check_id(struct renesas_usb3 *usb3)
+{
+	if (usb3_is_a_device(usb3))
+		usb3_mode_config(usb3, true, true);
+	else
+		usb3_mode_config(usb3, false, false);
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
 
@@ -551,6 +591,7 @@ static void renesas_usb3_stop_controller(struct renesas_usb3 *usb3)
 	usb3_disconnect(usb3);
 	usb3_write(usb3, 0, USB3_P0_INT_ENA);
 	usb3_write(usb3, 0, USB3_PN_INT_ENA);
+	usb3_write(usb3, 0, USB3_USB_OTG_INT_ENA);
 	usb3_write(usb3, 0, USB3_USB_INT_ENA_1);
 	usb3_write(usb3, 0, USB3_USB_INT_ENA_2);
 	usb3_write(usb3, 0, USB3_AXI_INT_ENA);
@@ -1474,10 +1515,22 @@ static void usb3_irq_epc_int_2(struct renesas_usb3 *usb3, u32 int_sta_2)
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
@@ -1488,6 +1541,12 @@ static void usb3_irq_epc(struct renesas_usb3 *usb3)
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
