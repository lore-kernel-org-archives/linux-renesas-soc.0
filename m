Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:35279 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752013AbcL1VTw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Dec 2016 16:19:52 -0500
Received: by mail-lf0-f49.google.com with SMTP id b14so210900666lfg.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Dec 2016 13:19:51 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] drm: rcar-du: support less VSPs than CRTCs
Date: Thu, 29 Dec 2016 00:19:47 +0300
Message-ID: <1844861.8doEdlf3qj@wasted.cogentembedded.com>
In-Reply-To: <18781159.4YChoBxRU5@wasted.cogentembedded.com>
References: <18781159.4YChoBxRU5@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Renesas R-Car E2 (R8A7791) SoC only has  1 VSPD but still  2 DU ports.
Since we  are going to use the R-Car  gen2 VSPDs as the DU compositors,
we'll have to also support this case. Now that  the number of VSPDs can be
less  than the number of the DU ports, 'struct rcar_du_device_info' needs
a new field which we'll have to set for the SoCs where we've already used
the VSPD compositor...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c |   17 ++++++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c  |    2 
 drivers/gpu/drm/rcar-du/rcar_du_drv.h  |    2 
 drivers/gpu/drm/rcar-du/rcar_du_kms.c  |    2 
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c  |   76 ++++++++++++++++++++++-----------
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h  |    2 
 6 files changed, 75 insertions(+), 26 deletions(-)

Index: linux/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -255,8 +255,21 @@ static void rcar_du_crtc_update_planes(s
 	/* If VSP+DU integration is enabled the plane assignment is fixed. */
 	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE)) {
 		if (rcdu->info->gen < 3) {
-			dspr = (rcrtc->index % 2) + 1;
-			hwplanes = 1 << (rcrtc->index % 2);
+			if (rcrtc->vsp->vsp) {
+				dspr = (rcrtc->index % 2) + 1;
+				hwplanes = 1 << (rcrtc->index % 2);
+			} else	{
+				for (i = 0; i < rcrtc->vsp->num_planes; ++i) {
+					struct rcar_du_vsp_plane *plane =
+						&rcrtc->vsp->planes[i];
+
+					if (plane->plane.state->crtc !=
+					    &rcrtc->crtc)
+						continue;
+					dspr |= (plane->index + 5) << 4 * i;
+					hwplanes |= 1 << (plane->index + 4);
+				}
+			}
 		} else {
 			dspr = (rcrtc->index % 2) ? 3 : 1;
 			hwplanes = 1 << ((rcrtc->index % 2) ? 2 : 0);
Index: linux/drivers/gpu/drm/rcar-du/rcar_du_drv.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -109,6 +109,7 @@ static const struct rcar_du_device_info
 		},
 	},
 	.num_lvds = 1,
+	.num_vspds = 2,
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7792_info = {
@@ -201,6 +202,7 @@ static const struct rcar_du_device_info
 		},
 	},
 	.num_lvds = 1,
+	.num_vspds = 4,
 };
 
 static const struct of_device_id rcar_du_of_table[] = {
Index: linux/drivers/gpu/drm/rcar-du/rcar_du_drv.h
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -59,6 +59,7 @@ struct rcar_du_output_routing {
  * @num_crtcs: total number of CRTCs
  * @routes: array of CRTC to output routes, indexed by output (RCAR_DU_OUTPUT_*)
  * @num_lvds: number of internal LVDS encoders
+ * @num_vspds: number of VSPDs
  */
 struct rcar_du_device_info {
 	unsigned int gen;
@@ -67,6 +68,7 @@ struct rcar_du_device_info {
 	unsigned int num_crtcs;
 	struct rcar_du_output_routing routes[RCAR_DU_OUTPUT_MAX];
 	unsigned int num_lvds;
+	unsigned int num_vspds;
 };
 
 #define RCAR_DU_MAX_CRTCS		4
Index: linux/drivers/gpu/drm/rcar-du/rcar_du_kms.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -611,6 +611,8 @@ int rcar_du_modeset_init(struct rcar_du_
 
 			vsp->index = i;
 			vsp->dev = rcdu;
+			vsp->group = &rcdu->groups[i / 2];
+
 			rcdu->crtcs[i].vsp = vsp;
 
 			ret = rcar_du_vsp_init(vsp);
Index: linux/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -51,6 +51,9 @@ void rcar_du_vsp_enable(struct rcar_du_c
 		.colorkey = 0,
 	};
 
+	if (!crtc->vsp->vsp)
+		return;
+
 	if (rcdu->info->gen >= 3)
 		state.hwindex = (crtc->index % 2) ? 2 : 0;
 	else
@@ -71,17 +74,20 @@ void rcar_du_vsp_enable(struct rcar_du_c
 
 void rcar_du_vsp_disable(struct rcar_du_crtc *crtc)
 {
-	vsp1_du_setup_lif(crtc->vsp->vsp, 0, 0);
+	if (crtc->vsp->vsp)
+		vsp1_du_setup_lif(crtc->vsp->vsp, 0, 0);
 }
 
 void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc)
 {
-	vsp1_du_atomic_begin(crtc->vsp->vsp);
+	if (crtc->vsp->vsp)
+		vsp1_du_atomic_begin(crtc->vsp->vsp);
 }
 
 void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc)
 {
-	vsp1_du_atomic_flush(crtc->vsp->vsp);
+	if (crtc->vsp->vsp)
+		vsp1_du_atomic_flush(crtc->vsp->vsp);
 }
 
 /* Keep the two tables in sync. */
@@ -180,7 +186,8 @@ static void rcar_du_vsp_plane_setup(stru
 		}
 	}
 
-	vsp1_du_atomic_update(plane->vsp->vsp, plane->index, &cfg);
+	if (plane->vsp->vsp)
+		vsp1_du_atomic_update(plane->vsp->vsp, plane->index, &cfg);
 }
 
 static int rcar_du_vsp_plane_atomic_check(struct drm_plane *plane,
@@ -216,10 +223,29 @@ static void rcar_du_vsp_plane_atomic_upd
 {
 	struct rcar_du_vsp_plane *rplane = to_rcar_vsp_plane(plane);
 
-	if (plane->state->crtc)
-		rcar_du_vsp_plane_setup(rplane);
-	else
-		vsp1_du_atomic_update(rplane->vsp->vsp, rplane->index, NULL);
+	if (rplane->vsp->vsp) {
+		if (plane->state->crtc)
+			rcar_du_vsp_plane_setup(rplane);
+		else
+			vsp1_du_atomic_update(rplane->vsp->vsp, rplane->index,
+					      NULL);
+	} else {
+		struct rcar_du_plane_state state = {
+			.format = rcar_du_format_info(DRM_FORMAT_ARGB8888),
+			.source = RCAR_DU_PLANE_MEMORY,
+			.alpha = 255,
+			.colorkey = 0,
+		};
+
+		state.state = *(plane->state);
+
+		if (!plane->state->crtc)
+			return;
+
+		state.hwindex = rplane->index + 4;
+
+		__rcar_du_plane_setup(rplane->vsp->group, &state);
+	}
 }
 
 static const struct drm_plane_helper_funcs rcar_du_vsp_plane_helper_funcs = {
@@ -324,23 +350,25 @@ int rcar_du_vsp_init(struct rcar_du_vsp
 	unsigned int i;
 	int ret;
 
-	/* Find the VSP device and initialize it. */
-	np = of_parse_phandle(rcdu->dev->of_node, "vsps", vsp->index);
-	if (!np) {
-		dev_err(rcdu->dev, "vsps node not found\n");
-		return -ENXIO;
-	}
+	if (vsp->index < rcdu->info->num_vspds) {
+		/* Find the VSP device and initialize it. */
+		np = of_parse_phandle(rcdu->dev->of_node, "vsps", vsp->index);
+		if (!np) {
+			dev_err(rcdu->dev, "vsps node not found\n");
+			return -ENXIO;
+		}
 
-	pdev = of_find_device_by_node(np);
-	of_node_put(np);
-	if (!pdev)
-		return -ENXIO;
-
-	vsp->vsp = &pdev->dev;
-
-	ret = vsp1_du_init(vsp->vsp);
-	if (ret < 0)
-		return ret;
+		pdev = of_find_device_by_node(np);
+		of_node_put(np);
+		if (!pdev)
+			return -ENXIO;
+
+		vsp->vsp = &pdev->dev;
+
+		ret = vsp1_du_init(vsp->vsp);
+		if (ret < 0)
+			return ret;
+	}
 
 	 /* The VSP2D (Gen3) has 5 RPFs, but the VSP1D (Gen2) is limited to
 	  * 4 RPFs.
Index: linux/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
@@ -19,6 +19,7 @@
 
 struct rcar_du_format_info;
 struct rcar_du_vsp;
+struct rcar_du_group;
 
 struct rcar_du_vsp_plane {
 	struct drm_plane plane;
@@ -31,6 +32,7 @@ struct rcar_du_vsp {
 	struct device *vsp;
 	struct rcar_du_device *dev;
 	struct rcar_du_vsp_plane *planes;
+	struct rcar_du_group* group;
 	unsigned int num_planes;
 };
 
