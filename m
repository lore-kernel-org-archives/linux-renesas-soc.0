Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:12031 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751446AbdC1Lzu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Mar 2017 07:55:50 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 4/4] usb: gadget: udc: renesas_usb3: add support for usb role swap
Date: Tue, 28 Mar 2017 20:53:24 +0900
Message-ID: <1490702004-8167-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1490702004-8167-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1490702004-8167-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds support for usb role swap via sysfs "role".

For example:
 1) Connect a usb cable using 2 Salvator-X boards.
  - For A-Device, the cable is connected to CN11 (USB3.0 ch0).
  - For B-Device, the cable is connected to CN9 (USB2.0 ch0).
 2) On A-Device, you input the following command:
  # echo peripheral > /sys/devices/platform/soc/ee020000.usb/role
 3) On B-Device, you input the following command:
  # echo host > /sys/devices/platform/soc/ee080200.usb-phy/role

Then, the A-Device acts as a peripheral and the B-Device acts as
a host. Please note that A-Device must input the following command
if you want the board to act as a host again.
 # echo host > /sys/devices/platform/soc/ee020000.usb/role

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 .../ABI/testing/sysfs-platform-renesas_usb3        |  2 ++
 drivers/usb/gadget/udc/renesas_usb3.c              | 41 +++++++++++++++++++++-
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-platform-renesas_usb3 b/Documentation/ABI/testing/sysfs-platform-renesas_usb3
index f5dace7..1ab919c 100644
--- a/Documentation/ABI/testing/sysfs-platform-renesas_usb3
+++ b/Documentation/ABI/testing/sysfs-platform-renesas_usb3
@@ -7,6 +7,8 @@ Description:
 		The file can show/change the drd mode of usb.
 
 		Write the following string to change the mode:
+		 "host" - switching mode from peripheral to host.
+		 "peripheral" - switching mode from host to peripheral.
 		 "b-device" - switching mode as forced b-device mode.
 
 		Read the file, then it shows the following strings:
diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 34ac03c..b552243 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -570,12 +570,29 @@ static void usb3_mode_a_host(struct renesas_usb3 *usb3)
 	usb3_set_bit(usb3, DRD_CON_VBOUT, USB3_DRD_CON);
 }
 
+static void usb3_mode_a_peri(struct renesas_usb3 *usb3)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&usb3->lock, flags);
+	usb3_set_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON);
+	usb3_set_bit(usb3, DRD_CON_VBOUT, USB3_DRD_CON);
+	usb3_check_vbus(usb3);
+	spin_unlock_irqrestore(&usb3->lock, flags);
+}
+
 static void usb3_mode_b_peri(struct renesas_usb3 *usb3)
 {
 	usb3_set_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON);
 	usb3_clear_bit(usb3, DRD_CON_VBOUT, USB3_DRD_CON);
 }
 
+static void usb3_mode_b_host(struct renesas_usb3 *usb3)
+{
+	usb3_clear_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON);
+	usb3_clear_bit(usb3, DRD_CON_VBOUT, USB3_DRD_CON);
+}
+
 static bool usb3_is_a_device(struct renesas_usb3 *usb3)
 {
 	return !(usb3_read(usb3, USB3_USB_OTG_STA) & USB_OTG_IDMON);
@@ -1865,8 +1882,30 @@ static ssize_t role_store(struct device *dev, struct device_attribute *attr,
 		usb3->forced_b_device = true;
 		renesas_usb3_init_forced_b_device(usb3);
 	} else {
+		bool new_mode_is_host;
+
 		usb3->forced_b_device = false;
-		return -EINVAL;
+		if (!strncmp(buf, "host", strlen("host")))
+			new_mode_is_host = true;
+		else if (!strncmp(buf, "peripheral", strlen("peripheral")))
+			new_mode_is_host = false;
+		else
+			return -EINVAL;
+
+		if (new_mode_is_host == usb3_is_host(usb3))
+			return -EINVAL;
+
+		if (new_mode_is_host) {
+			if (usb3_is_a_device(usb3))
+				usb3_mode_a_host(usb3);
+			else
+				usb3_mode_b_host(usb3);
+		} else {
+			if (usb3_is_a_device(usb3))
+				usb3_mode_a_peri(usb3);
+			else
+				usb3_mode_b_peri(usb3);
+		}
 	}
 
 	return count;
-- 
1.9.1
