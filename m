Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:48767 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753873AbcJDMbt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2016 08:31:49 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 5/6] drm: rcar-du: Remove memory allocation error message
Date: Tue,  4 Oct 2016 15:31:38 +0300
Message-Id: <1475584299-21236-6-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1475584299-21236-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1475584299-21236-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Memory allocation failures print messages to the kernel log, there's no
need to print an extra one. Remove the duplicate message.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c b/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
index ef3a50321ecc..b74105a80a6e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
@@ -241,10 +241,8 @@ int rcar_du_lvdsenc_init(struct rcar_du_device *rcdu)
 
 	for (i = 0; i < rcdu->info->num_lvds; ++i) {
 		lvds = devm_kzalloc(&pdev->dev, sizeof(*lvds), GFP_KERNEL);
-		if (lvds == NULL) {
-			dev_err(&pdev->dev, "failed to allocate private data\n");
+		if (lvds == NULL)
 			return -ENOMEM;
-		}
 
 		lvds->dev = rcdu;
 		lvds->index = i;
-- 
Regards,

Laurent Pinchart
