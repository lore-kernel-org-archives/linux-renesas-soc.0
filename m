Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:35221 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753468AbdGXMdW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jul 2017 08:33:22 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/3] usb: host: xhci: rcar: Add support for R-Car H3 ES2.0
Date: Mon, 24 Jul 2017 21:30:13 +0900
Message-ID: <1500899413-28565-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1500899413-28565-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1500899413-28565-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds support for R-Car H3 ES2.0. Since this SoC revision
(or later) should use the V3 firmware, the driver needs to check
the revision via soc_device_match().

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/host/xhci-rcar.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index 8f78d04..198bc18 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -20,7 +20,8 @@
 #include "xhci-rcar.h"
 
 /*
-* - The V3 firmware is for r8a7796 (with good performance).
+* - The V3 firmware is for r8a7796 (with good performance) and r8a7795 es2.0
+*   or later.
 * - The V2 firmware can be used on both r8a7795 (es1.x) and r8a7796.
 * - The V2 firmware is possible to use on R-Car Gen2. However, the V2 causes
 *   performance degradation. So, this driver continues to use the V1 if R-Car
@@ -78,6 +79,10 @@
 		.data = (void *)RCAR_XHCI_FIRMWARE_V2,
 	},
 	{
+		.soc_id = "r8a7795",
+		.data = (void *)RCAR_XHCI_FIRMWARE_V3,
+	},
+	{
 		.soc_id = "r8a7796",
 		.data = (void *)RCAR_XHCI_FIRMWARE_V3,
 	},
-- 
1.9.1
