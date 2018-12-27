Return-Path: <SRS0=84+3=PE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF82C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 27 Dec 2018 10:11:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E0563214C6
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 27 Dec 2018 10:11:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lkpcy1jA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730241AbeL0KLP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 27 Dec 2018 05:11:15 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45028 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730171AbeL0KLP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Dec 2018 05:11:15 -0500
Received: from avalon.pinchart.local (unknown [91.182.109.47])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42A93553;
        Thu, 27 Dec 2018 11:11:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1545905473;
        bh=/q7piWqHLQcOYys8mSff2Gb90QU5zvvZO0LOTElaxwg=;
        h=From:To:Cc:Subject:Date:From;
        b=lkpcy1jA4R4hNwSkOhqHcktcnq1GxqTv48eqHHMq9cEw5ZvqgW67yD+pxuuaWw96o
         vKGTKkliO3XSj6wlKceQjUObO6QiZm2BrYmC6v/5gqBTg+jx/8zVul9cPbBb/gS6RX
         X9ZHcoe7myBKfSQdZBslToUT9YKI9GuuWl9XJvQg=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: [PATCH] drm: rcar-du: Remove inclusion of drmP.h
Date:   Thu, 27 Dec 2018 12:12:06 +0200
Message-Id: <20181227101206.1143-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The DRM kernel API used to be defined in a handful of headers, pulled in
through drmP.h. It has since been split in multiple headers for the
different DRM components, and drmP.h turned into a legacy header that
just pulls in most of the DRM kernel API (and a large number of other
miscellaneous kernel headers).

In order to speed up compilation, replace inclusion of drmP.h with only
the required headers. It turns out that the rcar-du-drm driver already
includes most of the necessary headers, so the change is simple.

While at it, remove unneeder inclusion of other headers, and unneeded
forward declarations of structures.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c    | 1 -
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h    | 1 -
 drivers/gpu/drm/rcar-du/rcar_du_drv.c     | 1 -
 drivers/gpu/drm/rcar-du/rcar_du_drv.h     | 1 +
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 1 -
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h | 2 --
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 1 -
 drivers/gpu/drm/rcar-du/rcar_du_plane.c   | 1 -
 drivers/gpu/drm/rcar-du/rcar_du_plane.h   | 3 +--
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     | 1 -
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h     | 3 +--
 11 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 40b7f17159b0..771b460c7216 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -11,7 +11,6 @@
 #include <linux/mutex.h>
 #include <linux/sys_soc.h>
 
-#include <drm/drmP.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index ec47f164e69b..bcb35b0b7612 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -14,7 +14,6 @@
 #include <linux/spinlock.h>
 #include <linux/wait.h>
 
-#include <drm/drmP.h>
 #include <drm/drm_crtc.h>
 
 #include <media/vsp1.h>
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index eef86c48edad..d1f305694367 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -17,7 +17,6 @@
 #include <linux/slab.h>
 #include <linux/wait.h>
 
-#include <drm/drmP.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_cma_helper.h>
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 752617c73c73..6c187d0bf7c2 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -20,6 +20,7 @@
 struct clk;
 struct device;
 struct drm_device;
+struct drm_property;
 struct rcar_du_device;
 
 #define RCAR_DU_FEATURE_CRTC_IRQ_CLOCK	BIT(0)	/* Per-CRTC IRQ and clock */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index a123c28ea6ed..f16209499117 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -9,7 +9,6 @@
 
 #include <linux/export.h>
 
-#include <drm/drmP.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_panel.h>
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
index ce3cbc85695e..552f2a02e5b5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
@@ -10,10 +10,8 @@
 #ifndef __RCAR_DU_ENCODER_H__
 #define __RCAR_DU_ENCODER_H__
 
-#include <drm/drm_crtc.h>
 #include <drm/drm_encoder.h>
 
-struct drm_panel;
 struct rcar_du_device;
 
 struct rcar_du_encoder {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index d8ef3a86b0b2..e4b248e368d6 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -7,7 +7,6 @@
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
-#include <drm/drmP.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 39d5ae3fdf72..fa6b9aabc832 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -7,7 +7,6 @@
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
-#include <drm/drmP.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.h b/drivers/gpu/drm/rcar-du/rcar_du_plane.h
index 2f223a4c1d33..81bbf207ad0e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.h
@@ -10,8 +10,7 @@
 #ifndef __RCAR_DU_PLANE_H__
 #define __RCAR_DU_PLANE_H__
 
-#include <drm/drmP.h>
-#include <drm/drm_crtc.h>
+#include <drm/drm_plane.h>
 
 struct rcar_du_format_info;
 struct rcar_du_group;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 4576119e7777..dec314a687e0 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -7,7 +7,6 @@
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
-#include <drm/drmP.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
index e8c14dc5cb93..db232037f24a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
@@ -10,8 +10,7 @@
 #ifndef __RCAR_DU_VSP_H__
 #define __RCAR_DU_VSP_H__
 
-#include <drm/drmP.h>
-#include <drm/drm_crtc.h>
+#include <drm/drm_plane.h>
 
 struct rcar_du_format_info;
 struct rcar_du_vsp;
-- 
Regards,

Laurent Pinchart

