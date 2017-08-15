Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:36474 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750827AbdHONF0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Aug 2017 09:05:26 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] drm: rcar-du: Don't set connector DPMS property
Date: Tue, 15 Aug 2017 16:05:45 +0300
Message-Id: <20170815130545.2225-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170815130545.2225-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170815130545.2225-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Since commit 4a97a3da420b ("drm: Don't update property values for atomic
drivers") atomic drivers must not update property values as properties
are read from the state instead. To catch remaining users, the
drm_object_property_set_value() function now throws a warning when
called by atomic drivers on non-immutable properties, and we hit that
warning when creating connectors.

The easy fix is to just remove the drm_object_property_set_value() as it
is used here to set the initial value of the connector's DPMS property
to OFF. The DPMS property applies on top of the connector's state crtc
pointer (initialized to NULL) that is the main connector on/off control,
and should thus default to ON.

Fixes: 4a97a3da420b ("drm: Don't update property values for atomic drivers")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c | 4 ----
 1 file changed, 4 deletions(-)

This patch fixes a regression in drm-next and should be merged in v4.14-rc1.

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c b/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
index b373ad48ef5f..e96f2df0c305 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
@@ -79,10 +79,6 @@ int rcar_du_lvds_connector_init(struct rcar_du_device *rcdu,
 
 	drm_connector_helper_add(connector, &connector_helper_funcs);
 
-	connector->dpms = DRM_MODE_DPMS_OFF;
-	drm_object_property_set_value(&connector->base,
-		rcdu->ddev->mode_config.dpms_property, DRM_MODE_DPMS_OFF);
-
 	ret = drm_mode_connector_attach_encoder(connector, encoder);
 	if (ret < 0)
 		return ret;
-- 
Regards,

Laurent Pinchart
