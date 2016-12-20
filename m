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
Subject: [PATCH v2 05/29] drm: bridge: dw-hdmi: Remove encoder field from struct dw_hdmi
Date: Tue, 20 Dec 2016 03:33:36 +0200
Message-Id: <20161220013400.28317-6-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

The field isn't needed, remove it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jose Abreu <joabreu@synopsys.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index 2c85b6c07a80..ef10bb866b2f 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -115,7 +115,6 @@ struct dw_hdmi_i2c {
 
 struct dw_hdmi {
 	struct drm_connector connector;
-	struct drm_encoder *encoder;
 	struct drm_bridge bridge;
 
 	struct platform_device *audio;
@@ -1816,9 +1815,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int dw_hdmi_register(struct drm_device *drm, struct dw_hdmi *hdmi)
+static int dw_hdmi_register(struct drm_encoder *encoder, struct dw_hdmi *hdmi)
 {
-	struct drm_encoder *encoder = hdmi->encoder;
 	struct drm_bridge *bridge = &hdmi->bridge;
 	int ret;
 
@@ -1835,7 +1833,7 @@ static int dw_hdmi_register(struct drm_device *drm, struct dw_hdmi *hdmi)
 	drm_connector_helper_add(&hdmi->connector,
 				 &dw_hdmi_connector_helper_funcs);
 
-	drm_connector_init(drm, &hdmi->connector,
+	drm_connector_init(encoder->dev, &hdmi->connector,
 			   &dw_hdmi_connector_funcs,
 			   DRM_MODE_CONNECTOR_HDMIA);
 
@@ -1867,7 +1865,6 @@ int dw_hdmi_bind(struct device *dev, struct drm_encoder *encoder,
 	hdmi->dev = dev;
 	hdmi->dev_type = plat_data->dev_type;
 	hdmi->sample_rate = 48000;
-	hdmi->encoder = encoder;
 	hdmi->disabled = true;
 	hdmi->rxsense = true;
 	hdmi->phy_mask = (u8)~(HDMI_PHY_HPD | HDMI_PHY_RX_SENSE);
@@ -1980,7 +1977,7 @@ int dw_hdmi_bind(struct device *dev, struct drm_encoder *encoder,
 	if (ret)
 		goto err_iahb;
 
-	ret = dw_hdmi_register(encoder->dev, hdmi);
+	ret = dw_hdmi_register(encoder, hdmi);
 	if (ret)
 		goto err_iahb;
 
-- 
Regards,

Laurent Pinchart
