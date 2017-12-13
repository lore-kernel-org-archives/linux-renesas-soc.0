Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:15874 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750880AbdLMGvc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 01:51:32 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/4] usb: renesas_usbhs: add a new callback for extcon notifier
Date: Wed, 13 Dec 2017 15:46:58 +0900
Message-Id: <1513147620-20925-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1513147620-20925-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1513147620-20925-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

To set host/peripheral mode by using extcon notifier, this patch
adds a new callback as "notifier" in renesas_usbhs_platform_callback.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 include/linux/usb/renesas_usbhs.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/usb/renesas_usbhs.h b/include/linux/usb/renesas_usbhs.h
index 67102f3..9482735 100644
--- a/include/linux/usb/renesas_usbhs.h
+++ b/include/linux/usb/renesas_usbhs.h
@@ -17,6 +17,7 @@
  */
 #ifndef RENESAS_USB_H
 #define RENESAS_USB_H
+#include <linux/notifier.h>
 #include <linux/platform_device.h>
 #include <linux/usb/ch9.h>
 
@@ -98,6 +99,13 @@ struct renesas_usbhs_platform_callback {
 	 * VBUS control is needed for Host
 	 */
 	int (*set_vbus)(struct platform_device *pdev, int enable);
+
+	/*
+	 * option:
+	 * extcon notifier to set host/peripheral mode.
+	 */
+	int (*notifier)(struct notifier_block *nb, unsigned long event,
+			void *data);
 };
 
 /*
-- 
1.9.1
