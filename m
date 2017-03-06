Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60007 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752526AbdCFAOn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Mar 2017 19:14:43 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 4/9] drm: rcar-du: Hardcode encoders types to DRM_MODE_ENCODER_NONE
Date: Mon,  6 Mar 2017 02:02:57 +0200
Message-Id: <20170306000302.14149-5-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170306000302.14149-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170306000302.14149-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Unlike the connector type, the encoder type is unused by userspace. As
it is equally unused in the driver, except in a single location where
the connector type can be used instead, hardcode it to
DRM_MODE_ENCODER_NONE. This allow removing all code that tries to
determine (unsuccessfully in case a bridge is used) the encoder type.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v3:

- New patch, replaces "drm: rcar-du: Initialize encoder's type based on
  the bridge's type"
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c     | 15 -------------
 drivers/gpu/drm/rcar-du/rcar_du_drv.h     |  2 --
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 30 ++++++++-----------------
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h |  9 --------
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 37 ++-----------------------------
 5 files changed, 11 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index eb905e6b5f4c..327adb7a25c4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -44,12 +44,10 @@ static const struct rcar_du_device_info rcar_du_r8a7779_info = {
 		 */
 		[RCAR_DU_OUTPUT_DPAD0] = {
 			.possible_crtcs = BIT(0),
-			.encoder_type = DRM_MODE_ENCODER_NONE,
 			.port = 0,
 		},
 		[RCAR_DU_OUTPUT_DPAD1] = {
 			.possible_crtcs = BIT(1) | BIT(0),
-			.encoder_type = DRM_MODE_ENCODER_NONE,
 			.port = 1,
 		},
 	},
@@ -68,17 +66,14 @@ static const struct rcar_du_device_info rcar_du_r8a7790_info = {
 		 */
 		[RCAR_DU_OUTPUT_DPAD0] = {
 			.possible_crtcs = BIT(2) | BIT(1) | BIT(0),
-			.encoder_type = DRM_MODE_ENCODER_NONE,
 			.port = 0,
 		},
 		[RCAR_DU_OUTPUT_LVDS0] = {
 			.possible_crtcs = BIT(0),
-			.encoder_type = DRM_MODE_ENCODER_LVDS,
 			.port = 1,
 		},
 		[RCAR_DU_OUTPUT_LVDS1] = {
 			.possible_crtcs = BIT(2) | BIT(1),
-			.encoder_type = DRM_MODE_ENCODER_LVDS,
 			.port = 2,
 		},
 	},
@@ -97,12 +92,10 @@ static const struct rcar_du_device_info rcar_du_r8a7791_info = {
 		 */
 		[RCAR_DU_OUTPUT_DPAD0] = {
 			.possible_crtcs = BIT(1) | BIT(0),
-			.encoder_type = DRM_MODE_ENCODER_NONE,
 			.port = 0,
 		},
 		[RCAR_DU_OUTPUT_LVDS0] = {
 			.possible_crtcs = BIT(0),
-			.encoder_type = DRM_MODE_ENCODER_LVDS,
 			.port = 1,
 		},
 	},
@@ -118,12 +111,10 @@ static const struct rcar_du_device_info rcar_du_r8a7792_info = {
 		/* R8A7792 has two RGB outputs. */
 		[RCAR_DU_OUTPUT_DPAD0] = {
 			.possible_crtcs = BIT(0),
-			.encoder_type = DRM_MODE_ENCODER_NONE,
 			.port = 0,
 		},
 		[RCAR_DU_OUTPUT_DPAD1] = {
 			.possible_crtcs = BIT(1),
-			.encoder_type = DRM_MODE_ENCODER_NONE,
 			.port = 1,
 		},
 	},
@@ -141,12 +132,10 @@ static const struct rcar_du_device_info rcar_du_r8a7794_info = {
 		 */
 		[RCAR_DU_OUTPUT_DPAD0] = {
 			.possible_crtcs = BIT(0),
-			.encoder_type = DRM_MODE_ENCODER_NONE,
 			.port = 0,
 		},
 		[RCAR_DU_OUTPUT_DPAD1] = {
 			.possible_crtcs = BIT(1),
-			.encoder_type = DRM_MODE_ENCODER_NONE,
 			.port = 1,
 		},
 	},
@@ -165,12 +154,10 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 		 */
 		[RCAR_DU_OUTPUT_DPAD0] = {
 			.possible_crtcs = BIT(3),
-			.encoder_type = DRM_MODE_ENCODER_NONE,
 			.port = 0,
 		},
 		[RCAR_DU_OUTPUT_LVDS0] = {
 			.possible_crtcs = BIT(0),
-			.encoder_type = DRM_MODE_ENCODER_LVDS,
 			.port = 3,
 		},
 	},
@@ -189,12 +176,10 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
 		 */
 		[RCAR_DU_OUTPUT_DPAD0] = {
 			.possible_crtcs = BIT(2),
-			.encoder_type = DRM_MODE_ENCODER_NONE,
 			.port = 0,
 		},
 		[RCAR_DU_OUTPUT_LVDS0] = {
 			.possible_crtcs = BIT(0),
-			.encoder_type = DRM_MODE_ENCODER_LVDS,
 			.port = 2,
 		},
 	},
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 574b3c1c21df..90eb209c244e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -38,7 +38,6 @@ struct rcar_du_lvdsenc;
 /*
  * struct rcar_du_output_routing - Output routing specification
  * @possible_crtcs: bitmask of possible CRTCs for the output
- * @encoder_type: DRM type of the internal encoder associated with the output
  * @port: device tree port number corresponding to this output route
  *
  * The DU has 5 possible outputs (DPAD0/1, LVDS0/1, TCON). Output routing data
@@ -47,7 +46,6 @@ struct rcar_du_lvdsenc;
  */
 struct rcar_du_output_routing {
 	unsigned int possible_crtcs;
-	unsigned int encoder_type;
 	unsigned int port;
 };
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index 92a0405c2fb2..3e048dd98b64 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -68,7 +68,7 @@ static int rcar_du_encoder_atomic_check(struct drm_encoder *encoder,
 	 * Only panel-related encoder types require validation here, everything
 	 * else is handled by the bridge drivers.
 	 */
-	if (encoder->encoder_type == DRM_MODE_ENCODER_LVDS) {
+	if (connector->connector_type == DRM_MODE_CONNECTOR_LVDS) {
 		const struct drm_display_mode *panel_mode;
 
 		if (list_empty(&connector->modes)) {
@@ -156,7 +156,6 @@ static const struct drm_encoder_funcs encoder_funcs = {
 };
 
 int rcar_du_encoder_init(struct rcar_du_device *rcdu,
-			 enum rcar_du_encoder_type type,
 			 enum rcar_du_output output,
 			 struct device_node *enc_node,
 			 struct device_node *con_node)
@@ -164,7 +163,6 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	struct rcar_du_encoder *renc;
 	struct drm_encoder *encoder;
 	struct drm_bridge *bridge = NULL;
-	unsigned int encoder_type;
 	int ret;
 
 	renc = devm_kzalloc(rcdu->dev, sizeof(*renc), GFP_KERNEL);
@@ -188,33 +186,23 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	}
 
 	if (enc_node) {
+		dev_dbg(rcdu->dev, "initializing encoder %s for output %u\n",
+			of_node_full_name(enc_node), output);
+
 		/* Locate the DRM bridge from the encoder DT node. */
 		bridge = of_drm_find_bridge(enc_node);
 		if (!bridge) {
 			ret = -EPROBE_DEFER;
 			goto done;
 		}
-	}
-
-	switch (type) {
-	case RCAR_DU_ENCODER_VGA:
-		encoder_type = DRM_MODE_ENCODER_DAC;
-		break;
-	case RCAR_DU_ENCODER_LVDS:
-		encoder_type = DRM_MODE_ENCODER_LVDS;
-		break;
-	case RCAR_DU_ENCODER_HDMI:
-		encoder_type = DRM_MODE_ENCODER_TMDS;
-		break;
-	case RCAR_DU_ENCODER_NONE:
-	default:
-		/* No external encoder, use the internal encoder type. */
-		encoder_type = rcdu->info->routes[output].encoder_type;
-		break;
+	} else {
+		dev_dbg(rcdu->dev,
+			"initializing internal encoder for output %u\n",
+			output);
 	}
 
 	ret = drm_encoder_init(rcdu->ddev, encoder, &encoder_funcs,
-			       encoder_type, NULL);
+			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret < 0)
 		goto done;
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
index c1cfbe0d54ce..5422fa4df272 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
@@ -21,14 +21,6 @@ struct drm_panel;
 struct rcar_du_device;
 struct rcar_du_lvdsenc;
 
-enum rcar_du_encoder_type {
-	RCAR_DU_ENCODER_UNUSED = 0,
-	RCAR_DU_ENCODER_NONE,
-	RCAR_DU_ENCODER_VGA,
-	RCAR_DU_ENCODER_LVDS,
-	RCAR_DU_ENCODER_HDMI,
-};
-
 struct rcar_du_encoder {
 	struct drm_encoder base;
 	enum rcar_du_output output;
@@ -51,7 +43,6 @@ struct rcar_du_connector {
 	container_of(c, struct rcar_du_connector, connector)
 
 int rcar_du_encoder_init(struct rcar_du_device *rcdu,
-			 enum rcar_du_encoder_type type,
 			 enum rcar_du_output output,
 			 struct device_node *enc_node,
 			 struct device_node *con_node);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 2e0b35afa69f..f38fc2f3f93d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -284,16 +284,6 @@ static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
 				     enum rcar_du_output output,
 				     struct of_endpoint *ep)
 {
-	static const struct {
-		const char *compatible;
-		enum rcar_du_encoder_type type;
-	} encoders[] = {
-		{ "adi,adv7123", RCAR_DU_ENCODER_VGA },
-		{ "adi,adv7511w", RCAR_DU_ENCODER_HDMI },
-		{ "thine,thc63lvdm83d", RCAR_DU_ENCODER_LVDS },
-	};
-
-	enum rcar_du_encoder_type enc_type = RCAR_DU_ENCODER_NONE;
 	struct device_node *connector = NULL;
 	struct device_node *encoder = NULL;
 	struct device_node *ep_node = NULL;
@@ -340,30 +330,7 @@ static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
 
 	of_node_put(entity_ep_node);
 
-	if (encoder) {
-		/*
-		 * If an encoder has been found, get its type based on its
-		 * compatible string.
-		 */
-		unsigned int i;
-
-		for (i = 0; i < ARRAY_SIZE(encoders); ++i) {
-			if (of_device_is_compatible(encoder,
-						    encoders[i].compatible)) {
-				enc_type = encoders[i].type;
-				break;
-			}
-		}
-
-		if (i == ARRAY_SIZE(encoders)) {
-			dev_warn(rcdu->dev,
-				 "unknown encoder type for %s, skipping\n",
-				 encoder->full_name);
-			of_node_put(encoder);
-			of_node_put(connector);
-			return -EINVAL;
-		}
-	} else {
+	if (!encoder) {
 		/*
 		 * If no encoder has been found the entity must be the
 		 * connector.
@@ -371,7 +338,7 @@ static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
 		connector = entity;
 	}
 
-	ret = rcar_du_encoder_init(rcdu, enc_type, output, encoder, connector);
+	ret = rcar_du_encoder_init(rcdu, output, encoder, connector);
 	if (ret && ret != -EPROBE_DEFER)
 		dev_warn(rcdu->dev,
 			 "failed to initialize encoder %s on output %u (%d), skipping\n",
-- 
Regards,

Laurent Pinchart
