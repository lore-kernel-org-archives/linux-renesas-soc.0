Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60488 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756494AbcK2JFN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 04:05:13 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v3 13/13] drm: rcar-du: Initialize encoder's type based on the bridge's type
Date: Tue, 29 Nov 2016 11:04:43 +0200
Message-Id: <1480410283-28698-14-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Set the type of the DRM encoder that models the hardware encoders
(bridges) chain based on the type of the last bridge in the chain
instead of hardcoding encoder compatible strings in the display driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 17 ++------------
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h |  1 -
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 37 ++-----------------------------
 3 files changed, 4 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index d412dc622bfa..1adf4a77904e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -156,7 +156,6 @@ static const struct drm_encoder_funcs encoder_funcs = {
 };
 
 int rcar_du_encoder_init(struct rcar_du_device *rcdu,
-			 enum rcar_du_encoder_type type,
 			 enum rcar_du_output output,
 			 struct device_node *enc_node,
 			 struct device_node *con_node)
@@ -194,23 +193,11 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 			ret = -EPROBE_DEFER;
 			goto done;
 		}
-	}
 
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
+		encoder_type = bridge->encoder_type;
+	} else {
 		/* No external encoder, use the internal encoder type. */
 		encoder_type = rcdu->info->routes[output].encoder_type;
-		break;
 	}
 
 	ret = drm_encoder_init(rcdu->ddev, encoder, &encoder_funcs,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
index c1cfbe0d54ce..2b9036e7f6fe 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
@@ -51,7 +51,6 @@ struct rcar_du_connector {
 	container_of(c, struct rcar_du_connector, connector)
 
 int rcar_du_encoder_init(struct rcar_du_device *rcdu,
-			 enum rcar_du_encoder_type type,
 			 enum rcar_du_output output,
 			 struct device_node *enc_node,
 			 struct device_node *con_node);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index b5d3f16cfa12..aa84689043ae 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -366,16 +366,6 @@ static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
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
@@ -422,30 +412,7 @@ static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
 
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
@@ -453,7 +420,7 @@ static int rcar_du_encoders_init_one(struct rcar_du_device *rcdu,
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
