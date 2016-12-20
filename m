Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart+renesas@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Andy Yan <andy.yan@rock-chips.com>,
	Fabio Estevam <fabio.estevam@freescale.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	Ulrich Hecht <ulrich.hecht@gmail.com>,
	Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 08/29] drm: bridge: dw-hdmi: Reorder functions to prepare for next commit
Date: Tue, 20 Dec 2016 03:33:39 +0200
Message-Id: <20161220013400.28317-9-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

The next commit will reference structures and functions in a way that
currently requires forward declarations. Reorder the functions to avoid
that. No functional change to the code is performed.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jose Abreu <joabreu@synopsys.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c | 72 ++++++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index 563cbec47da6..92ce9e532603 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -1575,42 +1575,6 @@ static void dw_hdmi_update_phy_mask(struct dw_hdmi *hdmi)
 		hdmi_writeb(hdmi, hdmi->phy_mask, HDMI_PHY_MASK0);
 }
 
-static void dw_hdmi_bridge_mode_set(struct drm_bridge *bridge,
-				    struct drm_display_mode *orig_mode,
-				    struct drm_display_mode *mode)
-{
-	struct dw_hdmi *hdmi = bridge->driver_private;
-
-	mutex_lock(&hdmi->mutex);
-
-	/* Store the display mode for plugin/DKMS poweron events */
-	memcpy(&hdmi->previous_mode, mode, sizeof(hdmi->previous_mode));
-
-	mutex_unlock(&hdmi->mutex);
-}
-
-static void dw_hdmi_bridge_disable(struct drm_bridge *bridge)
-{
-	struct dw_hdmi *hdmi = bridge->driver_private;
-
-	mutex_lock(&hdmi->mutex);
-	hdmi->disabled = true;
-	dw_hdmi_update_power(hdmi);
-	dw_hdmi_update_phy_mask(hdmi);
-	mutex_unlock(&hdmi->mutex);
-}
-
-static void dw_hdmi_bridge_enable(struct drm_bridge *bridge)
-{
-	struct dw_hdmi *hdmi = bridge->driver_private;
-
-	mutex_lock(&hdmi->mutex);
-	hdmi->disabled = false;
-	dw_hdmi_update_power(hdmi);
-	dw_hdmi_update_phy_mask(hdmi);
-	mutex_unlock(&hdmi->mutex);
-}
-
 static enum drm_connector_status
 dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
@@ -1703,6 +1667,42 @@ static const struct drm_connector_helper_funcs dw_hdmi_connector_helper_funcs =
 	.best_encoder = drm_atomic_helper_best_encoder,
 };
 
+static void dw_hdmi_bridge_mode_set(struct drm_bridge *bridge,
+				    struct drm_display_mode *orig_mode,
+				    struct drm_display_mode *mode)
+{
+	struct dw_hdmi *hdmi = bridge->driver_private;
+
+	mutex_lock(&hdmi->mutex);
+
+	/* Store the display mode for plugin/DKMS poweron events */
+	memcpy(&hdmi->previous_mode, mode, sizeof(hdmi->previous_mode));
+
+	mutex_unlock(&hdmi->mutex);
+}
+
+static void dw_hdmi_bridge_disable(struct drm_bridge *bridge)
+{
+	struct dw_hdmi *hdmi = bridge->driver_private;
+
+	mutex_lock(&hdmi->mutex);
+	hdmi->disabled = true;
+	dw_hdmi_update_power(hdmi);
+	dw_hdmi_update_phy_mask(hdmi);
+	mutex_unlock(&hdmi->mutex);
+}
+
+static void dw_hdmi_bridge_enable(struct drm_bridge *bridge)
+{
+	struct dw_hdmi *hdmi = bridge->driver_private;
+
+	mutex_lock(&hdmi->mutex);
+	hdmi->disabled = false;
+	dw_hdmi_update_power(hdmi);
+	dw_hdmi_update_phy_mask(hdmi);
+	mutex_unlock(&hdmi->mutex);
+}
+
 static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
 	.enable = dw_hdmi_bridge_enable,
 	.disable = dw_hdmi_bridge_disable,
-- 
Regards,

Laurent Pinchart
