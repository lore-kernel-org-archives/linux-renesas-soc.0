Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart+renesas@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Andy Yan <andy.yan@rock-chips.com>,
	Archit Taneja <architt@codeaurora.org>,
	Fabio Estevam <fabio.estevam@freescale.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mark Yao <mark.yao@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	Ulrich Hecht <ulrich.hecht@gmail.com>,
	Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 04/22] drm: bridge: dw-hdmi: Embed drm_bridge in struct dw_hdmi
Date: Fri,  2 Dec 2016 01:43:19 +0200
Message-Id: <1480635817-1258-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

The drm_bridge instance is always needed, there's no point in allocating
it separately.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index 5f8044a7d602..2c85b6c07a80 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -116,7 +116,7 @@ struct dw_hdmi_i2c {
 struct dw_hdmi {
 	struct drm_connector connector;
 	struct drm_encoder *encoder;
-	struct drm_bridge *bridge;
+	struct drm_bridge bridge;
 
 	struct platform_device *audio;
 	enum dw_hdmi_devtype dev_type;
@@ -1806,7 +1806,7 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
 		dev_dbg(hdmi->dev, "EVENT=%s\n",
 			phy_int_pol & HDMI_PHY_HPD ? "plugin" : "plugout");
-		drm_helper_hpd_irq_event(hdmi->bridge->dev);
+		drm_helper_hpd_irq_event(hdmi->bridge.dev);
 	}
 
 	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
@@ -1819,16 +1819,9 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 static int dw_hdmi_register(struct drm_device *drm, struct dw_hdmi *hdmi)
 {
 	struct drm_encoder *encoder = hdmi->encoder;
-	struct drm_bridge *bridge;
+	struct drm_bridge *bridge = &hdmi->bridge;
 	int ret;
 
-	bridge = devm_kzalloc(drm->dev, sizeof(*bridge), GFP_KERNEL);
-	if (!bridge) {
-		DRM_ERROR("Failed to allocate drm bridge\n");
-		return -ENOMEM;
-	}
-
-	hdmi->bridge = bridge;
 	bridge->driver_private = hdmi;
 	bridge->funcs = &dw_hdmi_bridge_funcs;
 	ret = drm_bridge_attach(encoder, bridge, NULL);
-- 
Regards,

Laurent Pinchart
