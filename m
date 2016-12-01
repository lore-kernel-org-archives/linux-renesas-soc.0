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
Subject: [PATCH 12/22] drm: bridge: dw-hdmi: Abstract the platform PHY configuration
Date: Fri,  2 Dec 2016 01:43:27 +0200
Message-Id: <1480635817-1258-13-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Platforms implement the dw-hdmi with a separate PHY entity. It is
configured over it's own I2C bus. To allow for different PHY's to be
configured from the dw-hdmi driver, abstract the actual programming of
the PHY to its own functions, as configured by the platform.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c            | 79 ++++++++++++++++++-----------
 drivers/gpu/drm/imx/dw_hdmi-imx.c           |  2 +
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c |  1 +
 include/drm/bridge/dw_hdmi.h                | 12 +++++
 4 files changed, 63 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index 074ceb1e4897..06a44a2cdf3b 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -867,8 +867,8 @@ static bool hdmi_phy_wait_i2c_done(struct dw_hdmi *hdmi, int msec)
 	return true;
 }
 
-static void hdmi_phy_i2c_write(struct dw_hdmi *hdmi, unsigned short data,
-				 unsigned char addr)
+void dw_hdmi_phy_i2c_write(struct dw_hdmi *hdmi, unsigned short data,
+			   unsigned char addr)
 {
 	hdmi_writeb(hdmi, 0xFF, HDMI_IH_I2CMPHY_STAT0);
 	hdmi_writeb(hdmi, addr, HDMI_PHY_I2CM_ADDRESS_ADDR);
@@ -880,6 +880,7 @@ static void hdmi_phy_i2c_write(struct dw_hdmi *hdmi, unsigned short data,
 		    HDMI_PHY_I2CM_OPERATION_ADDR);
 	hdmi_phy_wait_i2c_done(hdmi, 1000);
 }
+EXPORT_SYMBOL_GPL(dw_hdmi_phy_i2c_write);
 
 static void dw_hdmi_phy_enable_powerdown(struct dw_hdmi *hdmi, bool enable)
 {
@@ -930,38 +931,61 @@ static void dw_hdmi_phy_sel_interface_control(struct dw_hdmi *hdmi, u8 enable)
 			 HDMI_PHY_CONF0_SELDIPIF_MASK);
 }
 
-static int hdmi_phy_configure(struct dw_hdmi *hdmi,
-			      enum dw_hdmi_resolution res_idx, int cscon)
+int dw_hdmi_phy_configure_synopsys(struct dw_hdmi *hdmi,
+				   const struct dw_hdmi_plat_data *pdata,
+				   unsigned long mpixelclock,
+				   enum dw_hdmi_resolution resolution)
+
 {
-	u8 val, msec;
-	const struct dw_hdmi_plat_data *pdata = hdmi->plat_data;
 	const struct dw_hdmi_mpll_config *mpll_config = pdata->mpll_cfg;
 	const struct dw_hdmi_curr_ctrl *curr_ctrl = pdata->cur_ctr;
 	const struct dw_hdmi_phy_config *phy_config = pdata->phy_config;
 
 	/* PLL/MPLL Cfg - always match on final entry */
 	for (; mpll_config->mpixelclock != ~0UL; mpll_config++)
-		if (hdmi->hdmi_data.video_mode.mpixelclock <=
-		    mpll_config->mpixelclock)
+		if (mpixelclock <= mpll_config->mpixelclock)
 			break;
 
 	for (; curr_ctrl->mpixelclock != ~0UL; curr_ctrl++)
-		if (hdmi->hdmi_data.video_mode.mpixelclock <=
-		    curr_ctrl->mpixelclock)
+		if (mpixelclock <= curr_ctrl->mpixelclock)
 			break;
 
 	for (; phy_config->mpixelclock != ~0UL; phy_config++)
-		if (hdmi->hdmi_data.video_mode.mpixelclock <=
-		    phy_config->mpixelclock)
+		if (mpixelclock <= phy_config->mpixelclock)
 			break;
 
 	if (mpll_config->mpixelclock == ~0UL ||
 	    curr_ctrl->mpixelclock == ~0UL ||
-	    phy_config->mpixelclock == ~0UL) {
-		dev_err(hdmi->dev, "Pixel clock %d - unsupported by HDMI\n",
-			hdmi->hdmi_data.video_mode.mpixelclock);
+	    phy_config->mpixelclock == ~0UL)
 		return -EINVAL;
-	}
+
+	dw_hdmi_phy_i2c_write(hdmi, mpll_config->res[resolution].cpce, 0x06);
+	dw_hdmi_phy_i2c_write(hdmi, mpll_config->res[resolution].gmp, 0x15);
+
+	/* CURRCTRL */
+	dw_hdmi_phy_i2c_write(hdmi, curr_ctrl->curr[resolution], 0x10);
+
+	dw_hdmi_phy_i2c_write(hdmi, 0x0000, 0x13); /* PLLPHBYCTRL */
+	dw_hdmi_phy_i2c_write(hdmi, 0x0006, 0x17);
+
+	dw_hdmi_phy_i2c_write(hdmi, phy_config->term, 0x19); /* TXTERM */
+	dw_hdmi_phy_i2c_write(hdmi, phy_config->sym_ctr, 0x09); /* CKSYMTXCTRL */
+	dw_hdmi_phy_i2c_write(hdmi, phy_config->vlev_ctr, 0x0E); /* VLEVCTRL */
+
+	/* REMOVE CLK TERM */
+	dw_hdmi_phy_i2c_write(hdmi, 0x8000, 0x05); /* CKCALCTRL */
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_phy_configure_synopsys);
+
+static int hdmi_phy_configure(struct dw_hdmi *hdmi,
+			      enum dw_hdmi_resolution resolution, int cscon)
+{
+	const struct dw_hdmi_plat_data *pdata = hdmi->plat_data;
+	unsigned long mpixelclock = hdmi->hdmi_data.video_mode.mpixelclock;
+	u8 val, msec;
+	int ret;
 
 	/* Enable csc path */
 	if (cscon)
@@ -988,21 +1012,14 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi,
 		    HDMI_PHY_I2CM_SLAVE_ADDR);
 	hdmi_phy_test_clear(hdmi, 0);
 
-	hdmi_phy_i2c_write(hdmi, mpll_config->res[res_idx].cpce, 0x06);
-	hdmi_phy_i2c_write(hdmi, mpll_config->res[res_idx].gmp, 0x15);
-
-	/* CURRCTRL */
-	hdmi_phy_i2c_write(hdmi, curr_ctrl->curr[res_idx], 0x10);
-
-	hdmi_phy_i2c_write(hdmi, 0x0000, 0x13);  /* PLLPHBYCTRL */
-	hdmi_phy_i2c_write(hdmi, 0x0006, 0x17);
-
-	hdmi_phy_i2c_write(hdmi, phy_config->term, 0x19);  /* TXTERM */
-	hdmi_phy_i2c_write(hdmi, phy_config->sym_ctr, 0x09); /* CKSYMTXCTRL */
-	hdmi_phy_i2c_write(hdmi, phy_config->vlev_ctr, 0x0E); /* VLEVCTRL */
-
-	/* REMOVE CLK TERM */
-	hdmi_phy_i2c_write(hdmi, 0x8000, 0x05);  /* CKCALCTRL */
+	/* Write to the PHY as configured by the platform */
+	ret = pdata->configure_phy(hdmi, pdata, mpixelclock, resolution);
+	if (ret) {
+		dev_err(hdmi->dev,
+			"PHY configuration failed (clock %lu resolution %u)\n",
+			mpixelclock, resolution);
+		return ret;
+	}
 
 	dw_hdmi_phy_enable_powerdown(hdmi, false);
 
diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
index f645275e6e63..f1cb25c429cf 100644
--- a/drivers/gpu/drm/imx/dw_hdmi-imx.c
+++ b/drivers/gpu/drm/imx/dw_hdmi-imx.c
@@ -177,6 +177,7 @@ static struct dw_hdmi_plat_data imx6q_hdmi_drv_data = {
 	.phy_config = imx_phy_config,
 	.dev_type   = IMX6Q_HDMI,
 	.mode_valid = imx6q_hdmi_mode_valid,
+	.configure_phy = dw_hdmi_phy_configure_synopsys,
 };
 
 static struct dw_hdmi_plat_data imx6dl_hdmi_drv_data = {
@@ -185,6 +186,7 @@ static struct dw_hdmi_plat_data imx6dl_hdmi_drv_data = {
 	.phy_config = imx_phy_config,
 	.dev_type = IMX6DL_HDMI,
 	.mode_valid = imx6dl_hdmi_mode_valid,
+	.configure_phy = dw_hdmi_phy_configure_synopsys,
 };
 
 static const struct of_device_id dw_hdmi_imx_dt_ids[] = {
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index a6d4a0236e8f..55b1f2f27d6e 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -237,6 +237,7 @@ static const struct dw_hdmi_plat_data rockchip_hdmi_drv_data = {
 	.mpll_cfg   = rockchip_mpll_cfg,
 	.cur_ctr    = rockchip_cur_ctr,
 	.phy_config = rockchip_phy_config,
+	.configure_phy = dw_hdmi_phy_configure_synopsys,
 	.dev_type   = RK3288_HDMI,
 };
 
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index e551b457c100..fa7655836c81 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -52,6 +52,10 @@ struct dw_hdmi_plat_data {
 	const struct dw_hdmi_mpll_config *mpll_cfg;
 	const struct dw_hdmi_curr_ctrl *cur_ctr;
 	const struct dw_hdmi_phy_config *phy_config;
+	int (*configure_phy)(struct dw_hdmi *hdmi,
+			     const struct dw_hdmi_plat_data *pdata,
+			     unsigned long mpixelclock,
+			     enum dw_hdmi_resolution resolution);
 	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
 					   struct drm_display_mode *mode);
 };
@@ -67,4 +71,12 @@ void dw_hdmi_set_sample_rate(struct dw_hdmi *hdmi, unsigned int rate);
 void dw_hdmi_audio_enable(struct dw_hdmi *hdmi);
 void dw_hdmi_audio_disable(struct dw_hdmi *hdmi);
 
+/* PHY configuration */
+void dw_hdmi_phy_i2c_write(struct dw_hdmi *hdmi, unsigned short data,
+			   unsigned char addr);
+int dw_hdmi_phy_configure_synopsys(struct dw_hdmi *hdmi,
+				   const struct dw_hdmi_plat_data *pdata,
+				   unsigned long mpixelclock,
+				   enum dw_hdmi_resolution resolution);
+
 #endif /* __IMX_HDMI_H__ */
-- 
Regards,

Laurent Pinchart
