Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f52.google.com ([74.125.83.52]:36179 "EHLO
        mail-pg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751268AbdATFzS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 00:55:18 -0500
Received: by mail-pg0-f52.google.com with SMTP id t6so20677749pgt.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jan 2017 21:55:00 -0800 (PST)
From: Kazunori Kobayashi <kkobayas@igel.co.jp>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, dhobsong@igel.co.jp,
        Kazunori Kobayashi <kkobayas@igel.co.jp>
Subject: [RFC PATCH 2/2] drm: rcar-du: Allow for handling multiple sg table entries by IOMMU mapping
Date: Fri, 20 Jan 2017 14:54:43 +0900
Message-Id: <1484891683-27304-3-git-send-email-kkobayas@igel.co.jp>
In-Reply-To: <1484891683-27304-1-git-send-email-kkobayas@igel.co.jp>
References: <1484891683-27304-1-git-send-email-kkobayas@igel.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

By having implemented dma-mapping through the VSP1 device,
non physical contiguous memory can be handled by mapping it
to the IOVA space with IOMMU, so we can use not only CMA objects
but can import multiple sg table entries as dma-buf.

This patch allows multiple sg table entries to be imported by
overriding drm_gem_cma_helper's dma-buf importing, but all the APIs
for CMA objects have not finished being replaced with
the implementation for that. The unsupported functions just return
errors for now.

Signed-off-by: Kazunori Kobayashi <kkobayas@igel.co.jp>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 102 ++++++++++++++++++++++++++++++++--
 1 file changed, 98 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 4909ccb..1aaa9cd 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -20,6 +20,8 @@
 #include <linux/pm.h>
 #include <linux/slab.h>
 #include <linux/wait.h>
+#include <linux/iommu.h>
+#include <linux/dma-buf.h>
 
 #include <drm/drmP.h>
 #include <drm/drm_crtc_helper.h>
@@ -247,6 +249,98 @@ static void rcar_du_disable_vblank(struct drm_device *dev, unsigned int pipe)
 	rcar_du_crtc_enable_vblank(&rcdu->crtcs[pipe], false);
 }
 
+static struct drm_gem_object *
+rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
+				  struct dma_buf_attachment *attach,
+				  struct sg_table *sgt)
+{
+	struct drm_gem_object *gem_obj;
+	struct drm_gem_cma_object *cma_obj;
+	size_t size;
+	int ret;
+
+	if (sgt->nents == 1)
+		return drm_gem_cma_prime_import_sg_table(dev, attach, sgt);
+
+	size = round_up(attach->dmabuf->size, PAGE_SIZE);
+
+	gem_obj = kzalloc(sizeof(*cma_obj), GFP_KERNEL);
+	if (!gem_obj)
+		return ERR_PTR(-ENOMEM);
+
+	cma_obj = container_of(gem_obj, struct drm_gem_cma_object, base);
+
+	ret = drm_gem_object_init(dev, gem_obj, size);
+	if (ret) {
+		kfree(cma_obj);
+		return ERR_PTR(ret);
+	}
+
+	ret = drm_gem_create_mmap_offset(gem_obj);
+	if (ret) {
+		drm_gem_object_release(gem_obj);
+		kfree(cma_obj);
+		return ERR_PTR(ret);
+	}
+
+	cma_obj->sgt = sgt;
+
+	return &cma_obj->base;
+}
+
+static struct sg_table *
+rcar_du_gem_prime_get_sg_table(struct drm_gem_object *obj)
+{
+	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
+
+	if (cma_obj->sgt && cma_obj->sgt->nents != 1)
+		return ERR_PTR(-EINVAL);
+
+	return drm_gem_cma_prime_get_sg_table(obj);
+}
+
+static int rcar_du_gem_prime_mmap(struct drm_gem_object *obj,
+				  struct vm_area_struct *vma)
+{
+	struct drm_gem_cma_object *cma_obj;
+
+	cma_obj = to_drm_gem_cma_obj(obj);
+
+	if (cma_obj->sgt && cma_obj->sgt->nents != 1)
+		return -EINVAL;
+
+	return drm_gem_cma_prime_mmap(obj, vma);
+}
+
+static int rcar_du_gem_cma_mmap(struct file *filp, struct vm_area_struct *vma)
+{
+	struct drm_gem_cma_object *cma_obj;
+	struct drm_gem_object *gem_obj;
+	int ret;
+
+	ret = drm_gem_mmap(filp, vma);
+	if (ret)
+		return ret;
+
+	gem_obj = vma->vm_private_data;
+	cma_obj = to_drm_gem_cma_obj(gem_obj);
+
+	if (cma_obj->sgt && cma_obj->sgt->nents != 1) {
+		drm_gem_vm_close(vma);
+		return -EINVAL;
+	}
+
+	vma->vm_flags &= ~VM_PFNMAP;
+	vma->vm_pgoff = 0;
+
+	ret = dma_mmap_wc(cma_obj->base.dev->dev, vma, cma_obj->vaddr,
+			  cma_obj->paddr, vma->vm_end - vma->vm_start);
+	if (ret)
+		drm_gem_vm_close(vma);
+
+	return ret;
+}
+
 static const struct file_operations rcar_du_fops = {
 	.owner		= THIS_MODULE,
 	.open		= drm_open,
@@ -258,7 +352,7 @@ static const struct file_operations rcar_du_fops = {
 	.poll		= drm_poll,
 	.read		= drm_read,
 	.llseek		= no_llseek,
-	.mmap		= drm_gem_cma_mmap,
+	.mmap		= rcar_du_gem_cma_mmap,
 };
 
 static struct drm_driver rcar_du_driver = {
@@ -274,11 +368,11 @@ static struct drm_driver rcar_du_driver = {
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
 	.gem_prime_import	= drm_gem_prime_import,
 	.gem_prime_export	= drm_gem_prime_export,
-	.gem_prime_get_sg_table	= drm_gem_cma_prime_get_sg_table,
-	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
+	.gem_prime_get_sg_table	= rcar_du_gem_prime_get_sg_table,
+	.gem_prime_import_sg_table = rcar_du_gem_prime_import_sg_table,
 	.gem_prime_vmap		= drm_gem_cma_prime_vmap,
 	.gem_prime_vunmap	= drm_gem_cma_prime_vunmap,
-	.gem_prime_mmap		= drm_gem_cma_prime_mmap,
+	.gem_prime_mmap		= rcar_du_gem_prime_mmap,
 	.dumb_create		= rcar_du_dumb_create,
 	.dumb_map_offset	= drm_gem_cma_dumb_map_offset,
 	.dumb_destroy		= drm_gem_dumb_destroy,
-- 
1.9.1
