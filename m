Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart+renesas@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	Andy Yan <andy.yan@rock-chips.com>,
	Archit Taneja <architt@codeaurora.org>,
	Fabio Estevam <fabio.estevam@freescale.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Nickey Yang <nickey.yang@rock-chips.com>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: [PATCH v3 09/20] drm: bridge: dw-hdmi: Create connector in the bridge attach operation
Date: Tue, 17 Jan 2017 10:28:59 +0200
Message-Id: <20170117082910.27023-10-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170117082910.27023-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170117082910.27023-1-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

The DRM device is not guaranteed by the bridge API to be available
before the attach callback. The driver performs properly at the moment
as it doesn't use the drm_bridge_add() registration method. As this will
be changed later, move connector creation to attach time to ensure
compatibility with the API.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jose Abreu <joabreu@synopsys.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index 92ce9e532603..88cd40adb977 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -1667,6 +1667,25 @@ static const struct drm_connector_helper_funcs dw_hdmi_connector_helper_funcs =
 	.best_encoder = drm_atomic_helper_best_encoder,
 };
 
+static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
+{
+	struct dw_hdmi *hdmi = bridge->driver_private;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_connector *connector = &hdmi->connector;
+
+	connector->interlace_allowed = 1;
+	connector->polled = DRM_CONNECTOR_POLL_HPD;
+
+	drm_connector_helper_add(connector, &dw_hdmi_connector_helper_funcs);
+
+	drm_connector_init(bridge->dev, connector, &dw_hdmi_connector_funcs,
+			   DRM_MODE_CONNECTOR_HDMIA);
+
+	drm_mode_connector_attach_encoder(connector, encoder);
+
+	return 0;
+}
+
 static void dw_hdmi_bridge_mode_set(struct drm_bridge *bridge,
 				    struct drm_display_mode *orig_mode,
 				    struct drm_display_mode *mode)
@@ -1704,6 +1723,7 @@ static void dw_hdmi_bridge_enable(struct drm_bridge *bridge)
 }
 
 static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
+	.attach = dw_hdmi_bridge_attach,
 	.enable = dw_hdmi_bridge_enable,
 	.disable = dw_hdmi_bridge_disable,
 	.mode_set = dw_hdmi_bridge_mode_set,
@@ -1829,17 +1849,6 @@ static int dw_hdmi_register(struct drm_encoder *encoder, struct dw_hdmi *hdmi)
 		return -EINVAL;
 	}
 
-	hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;
-
-	drm_connector_helper_add(&hdmi->connector,
-				 &dw_hdmi_connector_helper_funcs);
-
-	drm_connector_init(encoder->dev, &hdmi->connector,
-			   &dw_hdmi_connector_funcs,
-			   DRM_MODE_CONNECTOR_HDMIA);
-
-	drm_mode_connector_attach_encoder(&hdmi->connector, encoder);
-
 	return 0;
 }
 
@@ -1862,8 +1871,6 @@ int dw_hdmi_bind(struct platform_device *pdev, struct drm_encoder *encoder,
 	if (!hdmi)
 		return -ENOMEM;
 
-	hdmi->connector.interlace_allowed = 1;
-
 	hdmi->plat_data = plat_data;
 	hdmi->dev = dev;
 	hdmi->dev_type = plat_data->dev_type;
-- 
Regards,

Laurent Pinchart
