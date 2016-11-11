Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34119 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934472AbcKKRII (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Nov 2016 12:08:08 -0500
Received: by mail-wm0-f68.google.com with SMTP id g23so10795561wme.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Nov 2016 09:08:07 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org
Cc: kuninori.morimoto.gx@renesas.com, geert@linux-m68k.org,
        airlied@linux.ie, koji.matsuoka.xm@renesas.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 04/10] drm: rcar-du: Add dw_hdmi driver startup
Date: Fri, 11 Nov 2016 18:07:40 +0100
Message-Id: <1478884066-1090-5-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1478884066-1090-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1478884066-1090-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

The HDMI driver in the R-Car Gen3 uses dw_hdmi driver.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
[geert: Select DRM_DW_HDMI on non-r8a7795 to fix shmobile_defconfig build]
[uli: assume encoder hardware is described in the encoder node]
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 drivers/gpu/drm/rcar-du/Kconfig           |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c |   9 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h |   6 +-
 drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c | 215 +++++++++++++++++++++++++++---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     |   6 +-
 5 files changed, 218 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 4c2fd05..5ee9011 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -14,6 +14,8 @@ config DRM_RCAR_DU
 config DRM_RCAR_HDMI
 	bool "R-Car DU HDMI Encoder Support"
 	depends on DRM_RCAR_DU
+	depends on OF
+	select DRM_DW_HDMI
 	help
 	  Enable support for external HDMI encoders.
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index ab8645c..b374695 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -1,7 +1,7 @@
 /*
  * rcar_du_encoder.c  --  R-Car Display Unit Encoder
  *
- * Copyright (C) 2013-2014 Renesas Electronics Corporation
+ * Copyright (C) 2013-2015 Renesas Electronics Corporation
  *
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  *
@@ -106,7 +106,8 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 			 enum rcar_du_encoder_type type,
 			 enum rcar_du_output output,
 			 struct device_node *enc_node,
-			 struct device_node *con_node)
+			 struct device_node *con_node,
+			 const char *device_name)
 {
 	struct rcar_du_encoder *renc;
 	struct drm_encoder *encoder;
@@ -150,8 +151,12 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 		break;
 	}
 
+	renc->device_name = device_name;
+
 	if (type == RCAR_DU_ENCODER_HDMI) {
 		ret = rcar_du_hdmienc_init(rcdu, renc, enc_node);
+		if (of_device_is_compatible(enc_node, "renesas,rcar-dw-hdmi"))
+			goto done;
 		if (ret < 0)
 			goto done;
 	} else {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
index 7fc10a9..5d769d8 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
@@ -1,7 +1,7 @@
 /*
  * rcar_du_encoder.h  --  R-Car Display Unit Encoder
  *
- * Copyright (C) 2013-2014 Renesas Electronics Corporation
+ * Copyright (C) 2013-2015 Renesas Electronics Corporation
  *
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  *
@@ -33,6 +33,7 @@ struct rcar_du_encoder {
 	enum rcar_du_output output;
 	struct rcar_du_hdmienc *hdmi;
 	struct rcar_du_lvdsenc *lvds;
+	const char *device_name;
 };
 
 #define to_rcar_encoder(e) \
@@ -52,6 +53,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 			 enum rcar_du_encoder_type type,
 			 enum rcar_du_output output,
 			 struct device_node *enc_node,
-			 struct device_node *con_node);
+			 struct device_node *con_node,
+			 const char *device_name);
 
 #endif /* __RCAR_DU_ENCODER_H__ */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c b/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
index e03004f..47bd7bc 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c
@@ -1,7 +1,7 @@
 /*
  * R-Car Display Unit HDMI Encoder
  *
- * Copyright (C) 2014 Renesas Electronics Corporation
+ * Copyright (C) 2014-2015 Renesas Electronics Corporation
  *
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  *
@@ -13,10 +13,13 @@
 
 #include <linux/slab.h>
 
+#include <drm/bridge/dw_hdmi.h>
 #include <drm/drmP.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 
+#include <linux/of_platform.h>
+
 #include "rcar_du_drv.h"
 #include "rcar_du_encoder.h"
 #include "rcar_du_hdmienc.h"
@@ -24,7 +27,9 @@
 
 struct rcar_du_hdmienc {
 	struct rcar_du_encoder *renc;
+	struct device *dev;
 	bool enabled;
+	unsigned int index;
 };
 
 #define to_rcar_hdmienc(e)	(to_rcar_encoder(e)->hdmi)
@@ -32,6 +37,10 @@ struct rcar_du_hdmienc {
 static void rcar_du_hdmienc_disable(struct drm_encoder *encoder)
 {
 	struct rcar_du_hdmienc *hdmienc = to_rcar_hdmienc(encoder);
+	const struct drm_bridge_funcs *bfuncs = encoder->bridge->funcs;
+
+	if ((bfuncs) && (bfuncs->post_disable))
+		bfuncs->post_disable(encoder->bridge);
 
 	if (hdmienc->renc->lvds)
 		rcar_du_lvdsenc_enable(hdmienc->renc->lvds, encoder->crtc,
@@ -43,10 +52,13 @@ static void rcar_du_hdmienc_disable(struct drm_encoder *encoder)
 static void rcar_du_hdmienc_enable(struct drm_encoder *encoder)
 {
 	struct rcar_du_hdmienc *hdmienc = to_rcar_hdmienc(encoder);
+	const struct drm_bridge_funcs *bfuncs = encoder->bridge->funcs;
 
 	if (hdmienc->renc->lvds)
 		rcar_du_lvdsenc_enable(hdmienc->renc->lvds, encoder->crtc,
 				       true);
+	if ((bfuncs) && (bfuncs->enable))
+		bfuncs->enable(encoder->bridge);
 
 	hdmienc->enabled = true;
 }
@@ -56,13 +68,19 @@ static int rcar_du_hdmienc_atomic_check(struct drm_encoder *encoder,
 					struct drm_connector_state *conn_state)
 {
 	struct rcar_du_hdmienc *hdmienc = to_rcar_hdmienc(encoder);
+	const struct drm_bridge_funcs *bfuncs = encoder->bridge->funcs;
 	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+	const struct drm_display_mode *mode = &crtc_state->mode;
+	int ret = 0;
 
 	if (hdmienc->renc->lvds)
 		rcar_du_lvdsenc_atomic_check(hdmienc->renc->lvds,
 					     adjusted_mode);
 
-	return 0;
+	if ((bfuncs) && (bfuncs->mode_fixup))
+		ret = bfuncs->mode_fixup(encoder->bridge, mode,
+				 adjusted_mode) ? 0 : -EINVAL;
+	return ret;
 }
 
 
@@ -71,6 +89,10 @@ static void rcar_du_hdmienc_mode_set(struct drm_encoder *encoder,
 				     struct drm_display_mode *adjusted_mode)
 {
 	struct rcar_du_hdmienc *hdmienc = to_rcar_hdmienc(encoder);
+	const struct drm_bridge_funcs *bfuncs = encoder->bridge->funcs;
+
+	if ((bfuncs) && (bfuncs->mode_set))
+		bfuncs->mode_set(encoder->bridge, mode, adjusted_mode);
 
 	rcar_du_crtc_route_output(encoder->crtc, hdmienc->renc->output);
 }
@@ -96,22 +118,177 @@ static const struct drm_encoder_funcs encoder_funcs = {
 	.destroy = rcar_du_hdmienc_cleanup,
 };
 
+static const struct dw_hdmi_mpll_config rcar_du_hdmienc_mpll_cfg[] = {
+	{
+		44900000, {
+			{ 0x0003, 0x0000},
+			{ 0x0003, 0x0000},
+			{ 0x0003, 0x0000}
+		},
+	}, {
+		90000000, {
+			{ 0x0002, 0x0000},
+			{ 0x0002, 0x0000},
+			{ 0x0002, 0x0000}
+		},
+	}, {
+		182750000, {
+			{ 0x0001, 0x0000},
+			{ 0x0001, 0x0000},
+			{ 0x0001, 0x0000}
+		},
+	}, {
+		297000000, {
+			{ 0x0000, 0x0000},
+			{ 0x0000, 0x0000},
+			{ 0x0000, 0x0000}
+		},
+	}, {
+		~0UL, {
+			{ 0xFFFF, 0xFFFF },
+			{ 0xFFFF, 0xFFFF },
+			{ 0xFFFF, 0xFFFF },
+		},
+	}
+};
+static const struct dw_hdmi_curr_ctrl rcar_du_hdmienc_cur_ctr[] = {
+	/*      pixelclk    bpp8    bpp10   bpp12 */
+	{
+		35500000,  { 0x0344, 0x0000, 0x0000 },
+	}, {
+		44900000,  { 0x0285, 0x0000, 0x0000 },
+	}, {
+		71000000,  { 0x1184, 0x0000, 0x0000 },
+	}, {
+		90000000,  { 0x1144, 0x0000, 0x0000 },
+	}, {
+		140250000, { 0x20c4, 0x0000, 0x0000 },
+	}, {
+		182750000, { 0x2084, 0x0000, 0x0000 },
+	}, {
+		297000000, { 0x0084, 0x0000, 0x0000 },
+	}, {
+		~0UL,      { 0x0000, 0x0000, 0x0000 },
+	}
+};
+
+static const struct dw_hdmi_multi_div rcar_du_hdmienc_multi_div[] = {
+	/*      pixelclk    bpp8    bpp10   bpp12 */
+	{
+		35500000,  { 0x0328, 0x0000, 0x0000 },
+	}, {
+		44900000,  { 0x0128, 0x0000, 0x0000 },
+	}, {
+		71000000,  { 0x0314, 0x0000, 0x0000 },
+	}, {
+		90000000,  { 0x0114, 0x0000, 0x0000 },
+	}, {
+		140250000, { 0x030a, 0x0000, 0x0000 },
+	}, {
+		182750000, { 0x010a, 0x0000, 0x0000 },
+	}, {
+		281250000, { 0x0305, 0x0000, 0x0000 },
+	}, {
+		297000000, { 0x0105, 0x0000, 0x0000 },
+	}, {
+		~0UL,      { 0x0000, 0x0000, 0x0000 },
+	}
+};
+
+static const struct dw_hdmi_phy_config rcar_du_hdmienc_phy_config[] = {
+	/*pixelclk   symbol   term   vlev*/
+	{ 74250000,  0x8009, 0x0004, 0x0272},
+	{ 148500000, 0x802b, 0x0004, 0x028d},
+	{ 297000000, 0x8039, 0x0005, 0x028d},
+	{ ~0UL,	     0x0000, 0x0000, 0x0000}
+};
+
+static enum drm_mode_status
+rcar_du_hdmienc_mode_valid(struct drm_connector *connector,
+			    struct drm_display_mode *mode)
+{
+	return MODE_OK;
+}
+
+static const struct dw_hdmi_plat_data rcar_du_hdmienc_hdmi0_drv_data = {
+	.mode_valid = rcar_du_hdmienc_mode_valid,
+	.mpll_cfg   = rcar_du_hdmienc_mpll_cfg,
+	.cur_ctr    = rcar_du_hdmienc_cur_ctr,
+	.multi_div  = rcar_du_hdmienc_multi_div,
+	.phy_config = rcar_du_hdmienc_phy_config,
+	.dev_type   = RCAR_HDMI,
+	.index      = 0,
+};
+
+static const struct dw_hdmi_plat_data rcar_du_hdmienc_hdmi1_drv_data = {
+	.mode_valid = rcar_du_hdmienc_mode_valid,
+	.mpll_cfg   = rcar_du_hdmienc_mpll_cfg,
+	.cur_ctr    = rcar_du_hdmienc_cur_ctr,
+	.multi_div  = rcar_du_hdmienc_multi_div,
+	.phy_config = rcar_du_hdmienc_phy_config,
+	.dev_type   = RCAR_HDMI,
+	.index      = 1,
+};
+
+static const struct of_device_id rcar_du_hdmienc_dt_ids[] = {
+	{
+		.data = &rcar_du_hdmienc_hdmi0_drv_data
+	},
+	{
+		.data = &rcar_du_hdmienc_hdmi1_drv_data
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, rcar_du_hdmienc_dt_ids);
+
 int rcar_du_hdmienc_init(struct rcar_du_device *rcdu,
 			 struct rcar_du_encoder *renc, struct device_node *np)
 {
 	struct drm_encoder *encoder = rcar_encoder_to_drm_encoder(renc);
-	struct drm_bridge *bridge;
 	struct rcar_du_hdmienc *hdmienc;
-	int ret;
+	struct resource *iores;
+	struct platform_device *pdev;
+	const struct dw_hdmi_plat_data *plat_data;
+	int ret, irq;
+	bool dw_hdmi_use = false;
+	struct drm_bridge *bridge = NULL;
 
 	hdmienc = devm_kzalloc(rcdu->dev, sizeof(*hdmienc), GFP_KERNEL);
 	if (hdmienc == NULL)
 		return -ENOMEM;
 
-	/* Locate drm bridge from the hdmi encoder DT node */
-	bridge = of_drm_find_bridge(np);
-	if (!bridge)
-		return -EPROBE_DEFER;
+	if (strcmp(renc->device_name, "renesas,rcar-dw-hdmi") == 0) {
+		dw_hdmi_use = true;
+
+		if (renc->output == RCAR_DU_OUTPUT_HDMI0)
+			hdmienc->index = 0;
+		else if (renc->output == RCAR_DU_OUTPUT_HDMI1)
+			hdmienc->index = 1;
+		else
+			return -EINVAL;
+
+		pdev = of_find_device_by_node(np);
+		of_node_put(np);
+		if (!pdev)
+			return -ENXIO;
+
+		plat_data = rcar_du_hdmienc_dt_ids[hdmienc->index].data;
+		hdmienc->dev = &pdev->dev;
+
+		irq = platform_get_irq(pdev, 0);
+		if (irq < 0)
+			return irq;
+
+		iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		if (!iores)
+			return -ENXIO;
+
+	} else {
+		/* Locate the DRM bridge from the HDMI encoder DT node. */
+		bridge = of_drm_find_bridge(np);
+		if (!bridge)
+			return -EPROBE_DEFER;
+	}
 
 	ret = drm_encoder_init(rcdu->ddev, encoder, &encoder_funcs,
 			       DRM_MODE_ENCODER_TMDS, NULL);
@@ -123,14 +300,22 @@ int rcar_du_hdmienc_init(struct rcar_du_device *rcdu,
 	renc->hdmi = hdmienc;
 	hdmienc->renc = renc;
 
-	/* Link drm_bridge to encoder */
-	bridge->encoder = encoder;
-	encoder->bridge = bridge;
+	/* Link drm_bridge to encoder. */
+	if (bridge) {
+		bridge->encoder = encoder;
+		encoder->bridge = bridge;
+	}
+
+	if (dw_hdmi_use)
+		ret = dw_hdmi_bind(hdmienc->dev, NULL, rcdu->ddev, encoder,
+				iores, irq, plat_data);
 
-	ret = drm_bridge_attach(rcdu->ddev, bridge);
-	if (ret) {
-		drm_encoder_cleanup(encoder);
-		return ret;
+	if (bridge) {
+		ret = drm_bridge_attach(rcdu->ddev, bridge);
+		if (ret) {
+			drm_encoder_cleanup(encoder);
+			return ret;
+		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 392c7e6..09edab2 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -371,6 +371,7 @@ static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
 	} encoders[] = {
 		{ "adi,adv7123", RCAR_DU_ENCODER_VGA },
 		{ "adi,adv7511w", RCAR_DU_ENCODER_HDMI },
+		{ "renesas,rcar-dw-hdmi", RCAR_DU_ENCODER_HDMI },
 		{ "thine,thc63lvdm83d", RCAR_DU_ENCODER_LVDS },
 	};
 
@@ -381,6 +382,7 @@ static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
 	struct device_node *entity_ep_node;
 	struct device_node *entity;
 	int ret;
+	const char *enc_name = NULL;
 
 	/*
 	 * Locate the connected entity and infer its type from the number of
@@ -432,6 +434,7 @@ static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
 			if (of_device_is_compatible(encoder,
 						    encoders[i].compatible)) {
 				enc_type = encoders[i].type;
+				enc_name = encoders[i].compatible;
 				break;
 			}
 		}
@@ -452,7 +455,8 @@ static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
 		connector = entity;
 	}
 
-	ret = rcar_du_encoder_init(rcdu, enc_type, output, encoder, connector);
+	ret = rcar_du_encoder_init(rcdu, enc_type, output, encoder, connector,
+					enc_name);
 	of_node_put(encoder);
 	of_node_put(connector);
 
-- 
2.7.4
