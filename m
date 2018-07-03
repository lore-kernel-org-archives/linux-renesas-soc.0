Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:62732 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752552AbeGCKsA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jul 2018 06:48:00 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/3] usb: host: xhci-plat: add firmware_name for R-Car Gen3
Date: Tue,  3 Jul 2018 19:46:56 +0900
Message-Id: <1530614818-7634-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1530614818-7634-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1530614818-7634-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

To clean up the xhci-rcar.c code later, this patch adds firmware_name
"V3" for R-Car Gen3.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/host/xhci-plat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index c1b22fc..8dc77e3 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -105,6 +105,7 @@ static int xhci_plat_start(struct usb_hcd *hcd)
 };
 
 static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen3 = {
+	.firmware_name = XHCI_RCAR_FIRMWARE_NAME_V3,
 	.init_quirk = xhci_rcar_init_quirk,
 	.plat_start = xhci_rcar_start,
 	.resume_quirk = xhci_rcar_resume_quirk,
-- 
1.9.1
