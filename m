Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:48765 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752220AbcJDMbt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2016 08:31:49 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/6] drm: rcar-du: Remove test for impossible error condition
Date: Tue,  4 Oct 2016 15:31:37 +0300
Message-Id: <1475584299-21236-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1475584299-21236-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1475584299-21236-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The driver has lost platform data support a long time ago. R-Car DU
devices can only be instantiated through DT now, making it impossible to
have a NULL DT node pointer. Remove the error check.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 73c971e39b1c..b619a8024ec9 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -294,17 +294,11 @@ static int rcar_du_remove(struct platform_device *pdev)
 
 static int rcar_du_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	struct rcar_du_device *rcdu;
 	struct drm_device *ddev;
 	struct resource *mem;
 	int ret;
 
-	if (np == NULL) {
-		dev_err(&pdev->dev, "no device tree node\n");
-		return -ENODEV;
-	}
-
 	/* Allocate and initialize the DRM and R-Car device structures. */
 	rcdu = devm_kzalloc(&pdev->dev, sizeof(*rcdu), GFP_KERNEL);
 	if (rcdu == NULL)
-- 
Regards,

Laurent Pinchart
