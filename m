Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37570 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751865AbdKMKce (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2017 05:32:34 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Liviu Dudau <Liviu.Dudau@arm.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH/RFC 2/2] drm: rcar-du: Allow importing non-contiguous dma-buf with VSP
Date: Mon, 13 Nov 2017 12:32:28 +0200
Message-Id: <20171113103228.23312-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20171113103228.23312-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20171113103228.23312-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When the DU sources its frames from a VSP, it performs no memory access
and thus has no requirements on imported dma-buf memory types. In
particular the DU could import a physically non-contiguous buffer that
would later be mapped contiguously through the VSP IOMMU.

This use case isn't supported at the moment as the GEM CMA helpers will
reject any non-contiguous buffer, and the DU isn't connected to an IOMMU
that can make the buffer contiguous for DMA. Fix this by implementing a
custom .gem_prime_import_sg_table() operation that accepts all imported
dma-buf regardless of the number of scatterlist entries.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 39 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms.h |  7 +++++++
 3 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 48c166f925a3..d999231f98c7 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -289,7 +289,7 @@ static struct drm_driver rcar_du_driver = {
 	.gem_prime_import	= drm_gem_prime_import,
 	.gem_prime_export	= drm_gem_prime_export,
 	.gem_prime_get_sg_table	= drm_gem_cma_prime_get_sg_table,
-	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
+	.gem_prime_import_sg_table = rcar_du_gem_prime_import_sg_table,
 	.gem_prime_vmap		= drm_gem_cma_prime_vmap,
 	.gem_prime_vunmap	= drm_gem_cma_prime_vunmap,
 	.gem_prime_mmap		= drm_gem_cma_prime_mmap,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 566d1a948c8f..2dd0c2ba047d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -20,6 +20,7 @@
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 
+#include <linux/dma-buf.h>
 #include <linux/of_graph.h>
 #include <linux/wait.h>
 
@@ -148,6 +149,44 @@ const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc)
  * Frame buffer
  */
 
+struct drm_gem_object *rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
+				struct dma_buf_attachment *attach,
+				struct sg_table *sgt)
+{
+	struct rcar_du_device *rcdu = dev->dev_private;
+	struct drm_gem_cma_object *cma_obj;
+	struct drm_gem_object *gem_obj;
+	int ret;
+
+	if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE))
+		return drm_gem_cma_prime_import_sg_table(dev, attach, sgt);
+
+	/* Create a CMA GEM buffer. */
+	cma_obj = kzalloc(sizeof(*cma_obj), GFP_KERNEL);
+	if (!cma_obj)
+		return ERR_PTR(-ENOMEM);
+	gem_obj = &cma_obj->base;
+
+	ret = drm_gem_object_init(dev, gem_obj, attach->dmabuf->size);
+	if (ret)
+		goto error;
+
+	ret = drm_gem_create_mmap_offset(gem_obj);
+	if (ret) {
+		drm_gem_object_release(gem_obj);
+		goto error;
+	}
+
+	cma_obj->paddr = 0;
+	cma_obj->sgt = sgt;
+
+	return gem_obj;
+
+error:
+	kfree(cma_obj);
+	return ERR_PTR(ret);
+}
+
 int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
 			struct drm_mode_create_dumb *args)
 {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.h b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
index 07951d5fe38b..10b2bb0f0df9 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
@@ -16,10 +16,13 @@
 
 #include <linux/types.h>
 
+struct dma_buf_attachment;
 struct drm_file;
 struct drm_device;
+struct drm_gem_object;
 struct drm_mode_create_dumb;
 struct rcar_du_device;
+struct sg_table;
 
 struct rcar_du_format_info {
 	u32 fourcc;
@@ -36,4 +39,8 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu);
 int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
 			struct drm_mode_create_dumb *args);
 
+struct drm_gem_object *rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
+				struct dma_buf_attachment *attach,
+				struct sg_table *sgt);
+
 #endif /* __RCAR_DU_KMS_H__ */
-- 
Regards,

Laurent Pinchart
