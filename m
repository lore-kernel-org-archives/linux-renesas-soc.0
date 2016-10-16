Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:39007 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750861AbcJPICN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Oct 2016 04:02:13 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH RESEND] gpu: drm: rcar-du: rcar_du_drv: don't open code of_device_get_match_data()
Date: Sun, 16 Oct 2016 10:01:47 +0200
Message-Id: <20161016080147.2215-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This change will also make Coverity happy by avoiding a theoretical NULL
pointer dereference; yet another reason is to use the above helper function
to tighten the code and make it more readable.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Found this in one of my old branches. Plain resend, only ack from Geert added.

 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 73c971e39b1c72..50755f2f2bd3e4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -313,7 +313,7 @@ static int rcar_du_probe(struct platform_device *pdev)
 	init_waitqueue_head(&rcdu->commit.wait);
 
 	rcdu->dev = &pdev->dev;
-	rcdu->info = of_match_device(rcar_du_of_table, rcdu->dev)->data;
+	rcdu->info = of_device_get_match_data(rcdu->dev);
 
 	ddev = drm_dev_alloc(&rcar_du_driver, &pdev->dev);
 	if (IS_ERR(ddev))
-- 
2.9.3
