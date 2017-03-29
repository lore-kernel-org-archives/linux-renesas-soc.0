Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:26248 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1755940AbdC2LpM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Mar 2017 07:45:12 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/3] usb: gadget: udc: renesas_usb3: add extcon support
Date: Wed, 29 Mar 2017 20:42:53 +0900
Message-ID: <1490787774-5796-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1490787774-5796-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1490787774-5796-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds extcon support to see VBUS/ID signal states.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/gadget/udc/Kconfig        |  1 +
 drivers/usb/gadget/udc/renesas_usb3.c | 43 +++++++++++++++++++++++++++++++++--
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 4b69f28..66cb00b 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -191,6 +191,7 @@ config USB_RENESAS_USBHS_UDC
 config USB_RENESAS_USB3
 	tristate 'Renesas USB3.0 Peripheral controller'
 	depends on ARCH_RENESAS || COMPILE_TEST
+	depends on EXTCON
 	help
 	   Renesas USB3.0 Peripheral controller is a USB peripheral controller
 	   that supports super, high, and full speed USB 3.0 data transfers.
diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index dbef4b8..3f04e57 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -10,6 +10,7 @@
 
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/extcon.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -263,6 +264,8 @@ struct renesas_usb3 {
 
 	struct usb_gadget gadget;
 	struct usb_gadget_driver *driver;
+	struct extcon_dev *extcon;
+	struct work_struct extcon_work;
 
 	struct renesas_usb3_ep *usb3_ep;
 	int num_usb3_eps;
@@ -275,6 +278,8 @@ struct renesas_usb3 {
 	u8 ep0_buf[USB3_EP0_BUF_SIZE];
 	bool softconnect;
 	bool workaround_for_vbus;
+	bool extcon_host;		/* check id and set EXTCON_USB_HOST */
+	bool extcon_usb;		/* check vbus and set EXTCON_USB */
 };
 
 #define gadget_to_renesas_usb3(_gadget)	\
@@ -338,6 +343,15 @@ static int usb3_wait(struct renesas_usb3 *usb3, u32 reg, u32 mask,
 	return -EBUSY;
 }
 
+static void renesas_usb3_extcon_work(struct work_struct *work)
+{
+	struct renesas_usb3 *usb3 = container_of(work, struct renesas_usb3,
+						 extcon_work);
+
+	extcon_set_state_sync(usb3->extcon, EXTCON_USB_HOST, usb3->extcon_host);
+	extcon_set_state_sync(usb3->extcon, EXTCON_USB, usb3->extcon_usb);
+}
+
 static void usb3_enable_irq_1(struct renesas_usb3 *usb3, u32 bits)
 {
 	usb3_set_bit(usb3, bits, USB3_USB_INT_ENA_1);
@@ -537,10 +551,14 @@ static void usb3_check_vbus(struct renesas_usb3 *usb3)
 	if (usb3->workaround_for_vbus) {
 		usb3_connect(usb3);
 	} else {
-		if (usb3_read(usb3, USB3_USB_STA) & USB_STA_VBUS_STA)
+		usb3->extcon_usb = !!(usb3_read(usb3, USB3_USB_STA) &
+							USB_STA_VBUS_STA);
+		if (usb3->extcon_usb)
 			usb3_connect(usb3);
 		else
 			usb3_disconnect(usb3);
+
+		schedule_work(&usb3->extcon_work);
 	}
 }
 
@@ -563,10 +581,14 @@ static bool usb3_is_a_device(struct renesas_usb3 *usb3)
 
 static void usb3_check_id(struct renesas_usb3 *usb3)
 {
-	if (usb3_is_a_device(usb3))
+	usb3->extcon_host = usb3_is_a_device(usb3);
+
+	if (usb3->extcon_host)
 		usb3_mode_a_host(usb3);
 	else
 		usb3_mode_b_peri(usb3);
+
+	schedule_work(&usb3->extcon_work);
 }
 
 static void renesas_usb3_init_controller(struct renesas_usb3 *usb3)
@@ -1947,6 +1969,12 @@ static void renesas_usb3_init_ram(struct renesas_usb3 *usb3, struct device *dev,
 };
 MODULE_DEVICE_TABLE(of, usb3_of_match);
 
+static const unsigned int renesas_usb3_cable[] = {
+	EXTCON_USB,
+	EXTCON_USB_HOST,
+	EXTCON_NONE,
+};
+
 static int renesas_usb3_probe(struct platform_device *pdev)
 {
 	struct renesas_usb3 *usb3;
@@ -1990,6 +2018,17 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	INIT_WORK(&usb3->extcon_work, renesas_usb3_extcon_work);
+	usb3->extcon = devm_extcon_dev_allocate(&pdev->dev, renesas_usb3_cable);
+	if (IS_ERR(usb3->extcon))
+		return PTR_ERR(usb3->extcon);
+
+	ret = devm_extcon_dev_register(&pdev->dev, usb3->extcon);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to register extcon\n");
+		return ret;
+	}
+
 	/* for ep0 handling */
 	usb3->ep0_req = __renesas_usb3_ep_alloc_request(GFP_KERNEL);
 	if (!usb3->ep0_req)
-- 
1.9.1
