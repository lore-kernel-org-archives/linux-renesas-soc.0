Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:36881 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751441AbcJTEUl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Oct 2016 00:20:41 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <stable@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: renesas_usbhs: add wait after initialization for R-Car Gen3
Date: Thu, 20 Oct 2016 13:19:19 +0900
Message-ID: <1476937159-5079-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Since the controller on R-Car Gen3 doesn't have any status registers
to detect initialization (LPSTS.SUSPM = 1) and the initialization needs
up to 45 usec, this patch adds wait after the initialization. Otherwise,
writing other registers (e.g. INTENB0) will fail.

Fixes: de18757e272d ("usb: renesas_usbhs: add R-Car Gen3 power control")
Cc: <stable@vger.kernel.org> # v4.6+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 This patch is based on the latest Felipe's usb.git / testing/fixes branch
 (commit id = a1aa8cf6471b17c0fa7132ea5eeef0ae07ca07cd).

 drivers/usb/renesas_usbhs/rcar3.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/rcar3.c b/drivers/usb/renesas_usbhs/rcar3.c
index 1d70add..d544b33 100644
--- a/drivers/usb/renesas_usbhs/rcar3.c
+++ b/drivers/usb/renesas_usbhs/rcar3.c
@@ -9,6 +9,7 @@
  *
  */
 
+#include <linux/delay.h>
 #include <linux/io.h>
 #include "common.h"
 #include "rcar3.h"
@@ -35,10 +36,13 @@ static int usbhs_rcar3_power_ctrl(struct platform_device *pdev,
 
 	usbhs_write32(priv, UGCTRL2, UGCTRL2_RESERVED_3 | UGCTRL2_USB0SEL_OTG);
 
-	if (enable)
+	if (enable) {
 		usbhs_bset(priv, LPSTS, LPSTS_SUSPM, LPSTS_SUSPM);
-	else
+		/* The controller on R-Car Gen3 needs to wait up to 45 usec */
+		udelay(45);
+	} else {
 		usbhs_bset(priv, LPSTS, LPSTS_SUSPM, 0);
+	}
 
 	return 0;
 }
-- 
1.9.1
