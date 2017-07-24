Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:60437 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752988AbdGXMdU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jul 2017 08:33:20 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/3] usb: host: xhci: plat: re-fact xhci_plat_priv for R-Car Gen3
Date: Mon, 24 Jul 2017 21:30:12 +0900
Message-ID: <1500899413-28565-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1500899413-28565-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1500899413-28565-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Since the firmware_name is decided by xhci-rcar.c on R-Car Gen3 now,
this patch removes 2 things:
 - Remove struct xhci_plat_priv xhci_plat_renesas_rcar_r8a7796.
 - Remoce .firmware_name from xhci_plat_renesas_rcar_gen3.

The bahavior is the same as before.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/host/xhci-plat.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index c04144b..163bafd 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -107,14 +107,6 @@ static int xhci_plat_start(struct usb_hcd *hcd)
 };
 
 static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen3 = {
-	.firmware_name = XHCI_RCAR_FIRMWARE_NAME_V2,
-	.init_quirk = xhci_rcar_init_quirk,
-	.plat_start = xhci_rcar_start,
-	.resume_quirk = xhci_rcar_resume_quirk,
-};
-
-static const struct xhci_plat_priv xhci_plat_renesas_rcar_r8a7796 = {
-	.firmware_name = XHCI_RCAR_FIRMWARE_NAME_V3,
 	.init_quirk = xhci_rcar_init_quirk,
 	.plat_start = xhci_rcar_start,
 	.resume_quirk = xhci_rcar_resume_quirk,
@@ -145,7 +137,7 @@ static int xhci_plat_start(struct usb_hcd *hcd)
 		.data = &xhci_plat_renesas_rcar_gen3,
 	}, {
 		.compatible = "renesas,xhci-r8a7796",
-		.data = &xhci_plat_renesas_rcar_r8a7796,
+		.data = &xhci_plat_renesas_rcar_gen3,
 	}, {
 		.compatible = "renesas,rcar-gen2-xhci",
 		.data = &xhci_plat_renesas_rcar_gen2,
-- 
1.9.1
