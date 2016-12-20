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
Subject: [PATCH v2 02/29] drm: bridge: dw-hdmi: Remove unneeded arguments to bind/unbind functions
Date: Tue, 20 Dec 2016 03:33:33 +0200
Message-Id: <20161220013400.28317-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

The master argument isn't used. The data argument, a void pointer, is
used by the bind function only where it's cast to a drm_device pointer,
which can easily be obtained from the encoder argument instead. Remove
them.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jose Abreu <joabreu@synopsys.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c            | 8 +++-----
 drivers/gpu/drm/imx/dw_hdmi-imx.c           | 4 ++--
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 4 ++--
 include/drm/bridge/dw_hdmi.h                | 5 ++---
 4 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index a6685502571e..f86894622070 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -1854,12 +1854,10 @@ static int dw_hdmi_register(struct drm_device *drm, struct dw_hdmi *hdmi)
 	return 0;
 }
 
-int dw_hdmi_bind(struct device *dev, struct device *master,
-		 void *data, struct drm_encoder *encoder,
+int dw_hdmi_bind(struct device *dev, struct drm_encoder *encoder,
 		 struct resource *iores, int irq,
 		 const struct dw_hdmi_plat_data *plat_data)
 {
-	struct drm_device *drm = data;
 	struct device_node *np = dev->of_node;
 	struct platform_device_info pdevinfo;
 	struct device_node *ddc_node;
@@ -1992,7 +1990,7 @@ int dw_hdmi_bind(struct device *dev, struct device *master,
 	if (ret)
 		goto err_iahb;
 
-	ret = dw_hdmi_register(drm, hdmi);
+	ret = dw_hdmi_register(encoder->dev, hdmi);
 	if (ret)
 		goto err_iahb;
 
@@ -2059,7 +2057,7 @@ int dw_hdmi_bind(struct device *dev, struct device *master,
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_bind);
 
-void dw_hdmi_unbind(struct device *dev, struct device *master, void *data)
+void dw_hdmi_unbind(struct device *dev)
 {
 	struct dw_hdmi *hdmi = dev_get_drvdata(dev);
 
diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
index 359cd2765552..f79665801543 100644
--- a/drivers/gpu/drm/imx/dw_hdmi-imx.c
+++ b/drivers/gpu/drm/imx/dw_hdmi-imx.c
@@ -249,7 +249,7 @@ static int dw_hdmi_imx_bind(struct device *dev, struct device *master,
 	drm_encoder_init(drm, encoder, &dw_hdmi_imx_encoder_funcs,
 			 DRM_MODE_ENCODER_TMDS, NULL);
 
-	ret = dw_hdmi_bind(dev, master, data, encoder, iores, irq, plat_data);
+	ret = dw_hdmi_bind(dev, encoder, iores, irq, plat_data);
 
 	/*
 	 * If dw_hdmi_bind() fails we'll never call dw_hdmi_unbind(),
@@ -264,7 +264,7 @@ static int dw_hdmi_imx_bind(struct device *dev, struct device *master,
 static void dw_hdmi_imx_unbind(struct device *dev, struct device *master,
 			       void *data)
 {
-	return dw_hdmi_unbind(dev, master, data);
+	return dw_hdmi_unbind(dev);
 }
 
 static const struct component_ops dw_hdmi_imx_ops = {
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 0665fb915579..e8fb5c56b224 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -301,7 +301,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 	drm_encoder_init(drm, encoder, &dw_hdmi_rockchip_encoder_funcs,
 			 DRM_MODE_ENCODER_TMDS, NULL);
 
-	ret = dw_hdmi_bind(dev, master, data, encoder, iores, irq, plat_data);
+	ret = dw_hdmi_bind(dev, encoder, iores, irq, plat_data);
 
 	/*
 	 * If dw_hdmi_bind() fails we'll never call dw_hdmi_unbind(),
@@ -316,7 +316,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 static void dw_hdmi_rockchip_unbind(struct device *dev, struct device *master,
 				    void *data)
 {
-	return dw_hdmi_unbind(dev, master, data);
+	return dw_hdmi_unbind(dev);
 }
 
 static const struct component_ops dw_hdmi_rockchip_ops = {
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index bae79f3c4d28..11edda631a9d 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -56,9 +56,8 @@ struct dw_hdmi_plat_data {
 					   struct drm_display_mode *mode);
 };
 
-void dw_hdmi_unbind(struct device *dev, struct device *master, void *data);
-int dw_hdmi_bind(struct device *dev, struct device *master,
-		 void *data, struct drm_encoder *encoder,
+void dw_hdmi_unbind(struct device *dev);
+int dw_hdmi_bind(struct device *dev, struct drm_encoder *encoder,
 		 struct resource *iores, int irq,
 		 const struct dw_hdmi_plat_data *plat_data);
 
-- 
Regards,

Laurent Pinchart
