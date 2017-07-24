Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:16923 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753311AbdGXMdU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jul 2017 08:33:20 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/3] usb: host: xhci: rcar: Add firmware_name selection by soc_device_match()
Date: Mon, 24 Jul 2017 21:30:11 +0900
Message-ID: <1500899413-28565-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1500899413-28565-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1500899413-28565-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds firmware_name selection by soc_device_match() to
use other firmware name in the future. (For now, using the firmware
is the same as before.)

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/host/xhci-rcar.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index 0727822..8f78d04 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/usb/phy.h>
+#include <linux/sys_soc.h>
 
 #include "xhci.h"
 #include "xhci-plat.h"
@@ -67,6 +68,22 @@
 #define RCAR_USB3_RX_POL_VAL	BIT(21)
 #define RCAR_USB3_TX_POL_VAL	BIT(4)
 
+/* For soc_device_attribute */
+#define RCAR_XHCI_FIRMWARE_V2   BIT(0) /* FIRMWARE V2 */
+#define RCAR_XHCI_FIRMWARE_V3   BIT(1) /* FIRMWARE V3 */
+
+static const struct soc_device_attribute rcar_quirks_match[]  = {
+	{
+		.soc_id = "r8a7795", .revision = "ES1.*",
+		.data = (void *)RCAR_XHCI_FIRMWARE_V2,
+	},
+	{
+		.soc_id = "r8a7796",
+		.data = (void *)RCAR_XHCI_FIRMWARE_V3,
+	},
+	{ /* sentinel */ },
+};
+
 static void xhci_rcar_start_gen2(struct usb_hcd *hcd)
 {
 	/* LCLK Select */
@@ -122,9 +139,23 @@ static int xhci_rcar_download_firmware(struct usb_hcd *hcd)
 	int retval, index, j, time;
 	int timeout = 10000;
 	u32 data, val, temp;
+	u32 quirks = 0;
+	const struct soc_device_attribute *attr;
+	const char *firmware_name;
+
+	attr = soc_device_match(rcar_quirks_match);
+	if (attr)
+		quirks = (uintptr_t)attr->data;
+
+	if (quirks & RCAR_XHCI_FIRMWARE_V2)
+		firmware_name = XHCI_RCAR_FIRMWARE_NAME_V2;
+	else if (quirks & RCAR_XHCI_FIRMWARE_V3)
+		firmware_name = XHCI_RCAR_FIRMWARE_NAME_V3;
+	else
+		firmware_name = priv->firmware_name;
 
 	/* request R-Car USB3.0 firmware */
-	retval = request_firmware(&fw, priv->firmware_name, dev);
+	retval = request_firmware(&fw, firmware_name, dev);
 	if (retval)
 		return retval;
 
-- 
1.9.1
