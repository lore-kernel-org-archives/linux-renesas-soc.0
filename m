Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:12031 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751494AbdC1Lzs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Mar 2017 07:55:48 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/4] usb: gadget: udc: renesas_usb3: add sysfs "role" to set "b-device" mode
Date: Tue, 28 Mar 2017 20:53:21 +0900
Message-ID: <1490702004-8167-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1490702004-8167-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1490702004-8167-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Sadly, to change the role ("host" and "peripheral") of USB3.0 DRD
controller on R-Car Gen3, software has to set the DRD_CON register
which is included in a usb3.0 peripheral controler's register.
To simply implementation, the previous code always set peripheral mode
as hardcoded. However, to support usb role swap in the future,
the hardcoded is not good. So, this patch adds sysfs "role" to set
the mode by a user.
After applied this patch, since the DRD controller will act as host
mode after probed, a user needs to change the mode via the sysfs.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 .../ABI/testing/sysfs-platform-renesas_usb3        | 15 +++++
 drivers/usb/gadget/udc/renesas_usb3.c              | 74 ++++++++++++++++++++--
 2 files changed, 85 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-renesas_usb3

diff --git a/Documentation/ABI/testing/sysfs-platform-renesas_usb3 b/Documentation/ABI/testing/sysfs-platform-renesas_usb3
new file mode 100644
index 0000000..f5dace7
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-renesas_usb3
@@ -0,0 +1,15 @@
+What:		/sys/devices/platform/<udc-name>/role
+Date:		March 2017
+KernelVersion:	4.13
+Contact:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
+Description:
+		This file can be read and write.
+		The file can show/change the drd mode of usb.
+
+		Write the following string to change the mode:
+		 "b-device" - switching mode as forced b-device mode.
+
+		Read the file, then it shows the following strings:
+		 "host" - The mode is host now.
+		 "peripheral" - The mode is peripheral now.
+		 "b-device" - The mode is forced b-device (b-peripheral) now.
diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 2218f91..4029593 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -269,6 +269,7 @@ struct renesas_usb3 {
 	u8 ep0_buf[USB3_EP0_BUF_SIZE];
 	bool softconnect;
 	bool workaround_for_vbus;
+	bool forced_b_device;
 };
 
 #define gadget_to_renesas_usb3(_gadget)	\
@@ -352,6 +353,11 @@ static void usb3_disable_pipe_irq(struct renesas_usb3 *usb3, int num)
 	usb3_clear_bit(usb3, USB_INT_2_PIPE(num), USB3_USB_INT_ENA_2);
 }
 
+static bool usb3_is_host(struct renesas_usb3 *usb3)
+{
+	return !(usb3_read(usb3, USB3_DRD_CON) & DRD_CON_PERI_CON);
+}
+
 static void usb3_init_axi_bridge(struct renesas_usb3 *usb3)
 {
 	/* Set AXI_INT */
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
@@ -538,6 +540,12 @@ static void usb3_check_vbus(struct renesas_usb3 *usb3)
 	}
 }
 
+static void usb3_mode_b_peri(struct renesas_usb3 *usb3)
+{
+	usb3_set_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON);
+	usb3_clear_bit(usb3, DRD_CON_VBOUT, USB3_DRD_CON);
+}
+
 static void renesas_usb3_init_controller(struct renesas_usb3 *usb3)
 {
 	usb3_init_axi_bridge(usb3);
@@ -556,6 +564,16 @@ static void renesas_usb3_stop_controller(struct renesas_usb3 *usb3)
 	usb3_write(usb3, 0, USB3_AXI_INT_ENA);
 }
 
+static void renesas_usb3_init_forced_b_device(struct renesas_usb3 *usb3)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&usb3->lock, flags);
+	usb3_mode_b_peri(usb3);
+	renesas_usb3_init_controller(usb3);
+	spin_unlock_irqrestore(&usb3->lock, flags);
+}
+
 static void usb3_irq_epc_int_1_pll_wakeup(struct renesas_usb3 *usb3)
 {
 	usb3_disable_irq_1(usb3, USB_INT_1_B3_PLLWKUP);
@@ -1756,6 +1774,47 @@ static int renesas_usb3_set_selfpowered(struct usb_gadget *gadget, int is_self)
 	.set_selfpowered	= renesas_usb3_set_selfpowered,
 };
 
+static const char *usb3_get_role_string(struct renesas_usb3 *usb3)
+{
+	if (usb3->forced_b_device)
+		return "b-device";
+	else if (usb3_is_host(usb3))
+		return "host";
+	else
+		return "peripheral";
+}
+
+static ssize_t role_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	struct renesas_usb3 *usb3 = dev_get_drvdata(dev);
+
+	if (!usb3->driver)
+		return -ENODEV;
+
+	if (!strncmp(buf, "b-device", strlen("b-device"))) {
+		usb3->forced_b_device = true;
+		renesas_usb3_init_forced_b_device(usb3);
+	} else {
+		usb3->forced_b_device = false;
+		return -EINVAL;
+	}
+
+	return count;
+}
+
+static ssize_t role_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	struct renesas_usb3 *usb3 = dev_get_drvdata(dev);
+
+	if (!usb3->driver)
+		return -ENODEV;
+
+	return sprintf(buf, "%s\n", usb3_get_role_string(usb3));
+}
+static DEVICE_ATTR_RW(role);
+
 /*------- platform_driver ------------------------------------------------*/
 static int renesas_usb3_remove(struct platform_device *pdev)
 {
@@ -1946,6 +2005,10 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_add_udc;
 
+	ret = device_create_file(&pdev->dev, &dev_attr_role);
+	if (ret < 0)
+		goto err_dev_create;
+
 	usb3->workaround_for_vbus = priv->workaround_for_vbus;
 
 	pm_runtime_enable(&pdev->dev);
@@ -1955,6 +2018,9 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_dev_create:
+	usb_del_gadget_udc(&usb3->gadget);
+
 err_add_udc:
 	__renesas_usb3_ep_free_request(usb3->ep0_req);
 
-- 
1.9.1
