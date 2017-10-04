Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:46290 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751699AbdJDM04 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 08:26:56 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Felipe Balbi <felipe.balbi@linux.intel.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] usb: renesas_usbhs: Use of_device_get_match_data() helper
Date: Wed,  4 Oct 2017 14:26:48 +0200
Message-Id: <1507120008-13238-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use the of_device_get_match_data() helper instead of open coding.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/usb/renesas_usbhs/common.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index f0ce304c5aaf54f1..32f86935d59f6b09 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -501,7 +501,6 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
 {
 	struct renesas_usbhs_platform_info *info;
 	struct renesas_usbhs_driver_param *dparam;
-	const struct of_device_id *of_id = of_match_device(usbhs_of_match, dev);
 	u32 tmp;
 	int gpio;
 
@@ -510,7 +509,7 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
 		return NULL;
 
 	dparam = &info->driver_param;
-	dparam->type = of_id ? (uintptr_t)of_id->data : 0;
+	dparam->type = (uintptr_t)of_device_get_match_data(dev);
 	if (!of_property_read_u32(dev->of_node, "renesas,buswait", &tmp))
 		dparam->buswait_bwait = tmp;
 	gpio = of_get_named_gpio_flags(dev->of_node, "renesas,enable-gpio", 0,
-- 
2.7.4
