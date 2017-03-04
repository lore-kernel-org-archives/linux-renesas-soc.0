Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:52359 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752186AbdCDXuJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Mar 2017 18:50:09 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] drm: rcar-du: Remove wait field from rcar_du_device structure
Date: Sun,  5 Mar 2017 01:50:38 +0200
Message-Id: <20170304235038.7586-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The field is a left-over from the switch to the atomic commit helper.
It's unused, remove it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 2 --
 drivers/gpu/drm/rcar-du/rcar_du_drv.h | 5 -----
 2 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index decad036b031..eb905e6b5f4c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -328,8 +328,6 @@ static int rcar_du_probe(struct platform_device *pdev)
 	if (rcdu == NULL)
 		return -ENOMEM;
 
-	init_waitqueue_head(&rcdu->commit.wait);
-
 	rcdu->dev = &pdev->dev;
 	rcdu->info = of_device_get_match_data(rcdu->dev);
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index c843c3134498..574b3c1c21df 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -98,11 +98,6 @@ struct rcar_du_device {
 	unsigned int vspd1_sink;
 
 	struct rcar_du_lvdsenc *lvds[RCAR_DU_MAX_LVDS];
-
-	struct {
-		wait_queue_head_t wait;
-		u32 pending;
-	} commit;
 };
 
 static inline bool rcar_du_has(struct rcar_du_device *rcdu,
-- 
Regards,

Laurent Pinchart
