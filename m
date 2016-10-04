Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:48765 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752220AbcJDMbs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2016 08:31:48 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 2/6] drm: rcar-du: Constify node argument to rcar_du_lvds_connector_init()
Date: Tue,  4 Oct 2016 15:31:35 +0300
Message-Id: <1475584299-21236-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1475584299-21236-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1475584299-21236-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The node passed as a pointer to the rcar_du_lvds_connector_init()
function is never modified, make it const.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c | 2 +-
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

Cc: David Airlie <airlied@linux.ie>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c b/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
index 6afd0af312ba..64e9f0b86e58 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
@@ -79,7 +79,7 @@ static const struct drm_connector_funcs connector_funcs = {
 
 int rcar_du_lvds_connector_init(struct rcar_du_device *rcdu,
 				struct rcar_du_encoder *renc,
-				/* TODO const */ struct device_node *np)
+				const struct device_node *np)
 {
 	struct drm_encoder *encoder = rcar_encoder_to_drm_encoder(renc);
 	struct rcar_du_lvds_connector *lvdscon;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.h b/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.h
index d4881ee0be7e..639071dd235c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.h
@@ -19,6 +19,6 @@ struct rcar_du_encoder;
 
 int rcar_du_lvds_connector_init(struct rcar_du_device *rcdu,
 				struct rcar_du_encoder *renc,
-				struct device_node *np);
+				const struct device_node *np);
 
 #endif /* __RCAR_DU_LVDSCON_H__ */
-- 
Regards,

Laurent Pinchart
