Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f53.google.com ([74.125.83.53]:34253 "EHLO
        mail-pg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751260AbdATFzR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 00:55:17 -0500
Received: by mail-pg0-f53.google.com with SMTP id 14so20701608pgg.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jan 2017 21:54:55 -0800 (PST)
From: Kazunori Kobayashi <kkobayas@igel.co.jp>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, dhobsong@igel.co.jp,
        Kazunori Kobayashi <kkobayas@igel.co.jp>
Subject: [RFC PATCH 1/2] drm: rcar-du: Don't create a new sg table for dma-mapping when importing other driver's dma-buf
Date: Fri, 20 Jan 2017 14:54:42 +0900
Message-Id: <1484891683-27304-2-git-send-email-kkobayas@igel.co.jp>
In-Reply-To: <1484891683-27304-1-git-send-email-kkobayas@igel.co.jp>
References: <1484891683-27304-1-git-send-email-kkobayas@igel.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

CMA GEM object imported from other devices already contain a
valid sg-table, so there is no need to try to recreate it.
Also, dma_get_sgtable() should be given a valid virtual address,
(which is used for example when an IOMMU is present) but the cma
import helper does not set this field.

Signed-off-by: Kazunori Kobayashi <kkobayas@igel.co.jp>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 37f0bb5..20c5e27 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -221,14 +221,22 @@ static int rcar_du_vsp_plane_prepare_fb(struct drm_plane *plane,
 			drm_fb_cma_get_gem_obj(state->fb, i);
 		struct sg_table *sgt = &rstate->sg_tables[i];
 
-		ret = dma_get_sgtable(rcdu->dev, sgt, gem->vaddr, gem->paddr,
-				      gem->base.size);
-		if (ret)
-			goto fail;
+		if (gem->sgt) {
+			/* sg table has already been obtained by dma-buf
+			 * importing.
+			 */
+			memcpy(sgt, gem->sgt, sizeof(*gem->sgt));
+		} else {
+			ret = dma_get_sgtable(rcdu->dev, sgt, gem->vaddr,
+					      gem->paddr, gem->base.size);
+			if (ret)
+				goto fail;
+		}
 
 		ret = vsp1_du_map_sg(vsp->vsp, sgt);
 		if (!ret) {
-			sg_free_table(sgt);
+			if (!gem->sgt)
+				sg_free_table(sgt);
 			ret = -ENOMEM;
 			goto fail;
 		}
@@ -238,10 +246,13 @@ static int rcar_du_vsp_plane_prepare_fb(struct drm_plane *plane,
 
 fail:
 	for (i--; i >= 0; i--) {
+		struct drm_gem_cma_object *gem =
+			drm_fb_cma_get_gem_obj(state->fb, i);
 		struct sg_table *sgt = &rstate->sg_tables[i];
 
 		vsp1_du_unmap_sg(vsp->vsp, sgt);
-		sg_free_table(sgt);
+		if (!gem->sgt)
+			sg_free_table(sgt);
 	}
 
 	return ret;
@@ -258,10 +269,13 @@ static void rcar_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
 		return;
 
 	for (i = 0; i < rstate->format->planes; ++i) {
+		struct drm_gem_cma_object *gem =
+			drm_fb_cma_get_gem_obj(state->fb, i);
 		struct sg_table *sgt = &rstate->sg_tables[i];
 
 		vsp1_du_unmap_sg(vsp->vsp, sgt);
-		sg_free_table(sgt);
+		if (!gem->sgt)
+			sg_free_table(sgt);
 	}
 }
 
-- 
1.9.1
