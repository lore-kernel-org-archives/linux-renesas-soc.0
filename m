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
	linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2 19/29] drm: bridge: dw-hdmi: Add support for custom PHY configuration
Date: Tue, 20 Dec 2016 03:33:50 +0200
Message-Id: <20161220013400.28317-20-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The DWC HDMI TX controller interfaces with a companion PHY. While
Synopsys provides multiple standard PHYs, SoC vendors can also integrate
a custom PHY.

Modularize PHY configuration to support vendor PHYs through platform
data. The existing PHY configuration code was originally written to
support the DWC HDMI 3D TX PHY, and seems to be compatible with the DWC
MLP PHY. The HDMI 2.0 PHY will require a separate configuration
function.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Check pdata->phy_configure in hdmi_phy_configure() to avoid
  dereferencing NULL pointer.
---
 drivers/gpu/drm/bridge/dw-hdmi.c | 107 ++++++++++++++++++++++++++-------------
 include/drm/bridge/dw_hdmi.h     |   7 +++
 2 files changed, 79 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index 7c69c8c0285e..ebea96ad5dd0 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -118,6 +118,9 @@ struct dw_hdmi_phy_data {
 	const char *name;
 	unsigned int gen;
 	bool has_svsret;
+	int (*configure)(struct dw_hdmi *hdmi,
+			 const struct dw_hdmi_plat_data *pdata,
+			 unsigned long mpixelclock);
 };
 
 struct dw_hdmi {
@@ -878,8 +881,8 @@ static bool hdmi_phy_wait_i2c_done(struct dw_hdmi *hdmi, int msec)
 	return true;
 }
 
-static void hdmi_phy_i2c_write(struct dw_hdmi *hdmi, unsigned short data,
-				 unsigned char addr)
+void dw_hdmi_phy_i2c_write(struct dw_hdmi *hdmi, unsigned short data,
+			   unsigned char addr)
 {
 	hdmi_writeb(hdmi, 0xFF, HDMI_IH_I2CMPHY_STAT0);
 	hdmi_writeb(hdmi, addr, HDMI_PHY_I2CM_ADDRESS_ADDR);
@@ -891,6 +894,7 @@ static void hdmi_phy_i2c_write(struct dw_hdmi *hdmi, unsigned short data,
 		    HDMI_PHY_I2CM_OPERATION_ADDR);
 	hdmi_phy_wait_i2c_done(hdmi, 1000);
 }
+EXPORT_SYMBOL_GPL(dw_hdmi_phy_i2c_write);
 
 static void dw_hdmi_phy_enable_powerdown(struct dw_hdmi *hdmi, bool enable)
 {
@@ -966,37 +970,62 @@ static void dw_hdmi_phy_power_on(struct dw_hdmi *hdmi)
 	}
 }
 
-static int hdmi_phy_configure(struct dw_hdmi *hdmi)
+/*
+ * PHY configuration function for the DWC HDMI 3D TX PHY. Based on the available
+ * information the DWC MHL PHY has the same register layout and is thus also
+ * supported by this function.
+ */
+static int hdmi_phy_configure_dwc_hdmi_3d_tx(struct dw_hdmi *hdmi,
+		const struct dw_hdmi_plat_data *pdata,
+		unsigned long mpixelclock)
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
+	dw_hdmi_phy_i2c_write(hdmi, mpll_config->res[0].cpce, 0x06);
+	dw_hdmi_phy_i2c_write(hdmi, mpll_config->res[0].gmp, 0x15);
+
+	/* CURRCTRL */
+	dw_hdmi_phy_i2c_write(hdmi, curr_ctrl->curr[0], 0x10);
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
+
+static int hdmi_phy_configure(struct dw_hdmi *hdmi)
+{
+	const struct dw_hdmi_plat_data *pdata = hdmi->plat_data;
+	unsigned long mpixelclock = hdmi->hdmi_data.video_mode.mpixelclock;
+	u8 val, msec;
+	int ret;
 
 	dw_hdmi_phy_power_off(hdmi);
 
@@ -1011,21 +1040,16 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi)
 		    HDMI_PHY_I2CM_SLAVE_ADDR);
 	hdmi_phy_test_clear(hdmi, 0);
 
-	hdmi_phy_i2c_write(hdmi, mpll_config->res[0].cpce, 0x06);
-	hdmi_phy_i2c_write(hdmi, mpll_config->res[0].gmp, 0x15);
-
-	/* CURRCTRL */
-	hdmi_phy_i2c_write(hdmi, curr_ctrl->curr[0], 0x10);
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
+	if (pdata->configure_phy)
+		ret = pdata->configure_phy(hdmi, pdata, mpixelclock);
+	else
+		ret = hdmi->phy->configure(hdmi, pdata, mpixelclock);
+	if (ret) {
+		dev_err(hdmi->dev, "PHY configuration failed (clock %lu)\n",
+			mpixelclock);
+		return ret;
+	}
 
 	dw_hdmi_phy_power_on(hdmi);
 
@@ -1864,24 +1888,31 @@ static const struct dw_hdmi_phy_data dw_hdmi_phys[] = {
 		.name = "DWC MHL PHY + HEAC PHY",
 		.gen = 2,
 		.has_svsret = true,
+		.configure = hdmi_phy_configure_dwc_hdmi_3d_tx,
 	}, {
 		.type = DW_HDMI_PHY_DWC_MHL_PHY,
 		.name = "DWC MHL PHY",
 		.gen = 2,
 		.has_svsret = true,
+		.configure = hdmi_phy_configure_dwc_hdmi_3d_tx,
 	}, {
 		.type = DW_HDMI_PHY_DWC_HDMI_3D_TX_PHY_HEAC,
 		.name = "DWC HDMI 3D TX PHY + HEAC PHY",
 		.gen = 2,
+		.configure = hdmi_phy_configure_dwc_hdmi_3d_tx,
 	}, {
 		.type = DW_HDMI_PHY_DWC_HDMI_3D_TX_PHY,
 		.name = "DWC HDMI 3D TX PHY",
 		.gen = 2,
+		.configure = hdmi_phy_configure_dwc_hdmi_3d_tx,
 	}, {
 		.type = DW_HDMI_PHY_DWC_HDMI20_TX_PHY,
 		.name = "DWC HDMI 2.0 TX PHY",
 		.gen = 2,
 		.has_svsret = true,
+	}, {
+		.type = DW_HDMI_PHY_VENDOR_PHY,
+		.name = "Vendor PHY",
 	}
 };
 
@@ -1895,17 +1926,23 @@ static int dw_hdmi_detect_phy(struct dw_hdmi *hdmi)
 	for (i = 0; i < ARRAY_SIZE(dw_hdmi_phys); ++i) {
 		if (dw_hdmi_phys[i].type == phy_type) {
 			hdmi->phy = &dw_hdmi_phys[i];
-			return 0;
+			break;
 		}
 	}
 
-	if (phy_type == DW_HDMI_PHY_VENDOR_PHY)
-		dev_err(hdmi->dev, "Unsupported vendor HDMI PHY\n");
-	else
+	if (!hdmi->phy) {
 		dev_err(hdmi->dev, "Unsupported HDMI PHY type (%02x)\n",
 			phy_type);
+		return -ENODEV;
+	}
+
+	if (!hdmi->phy->configure && !hdmi->plat_data->configure_phy) {
+		dev_err(hdmi->dev, "%s requires platform support\n",
+			hdmi->phy->name);
+		return -ENODEV;
+	}
 
-	return -ENODEV;
+	return 0;
 }
 
 static struct dw_hdmi *
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index b080a171a23f..c539f64a280a 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -62,6 +62,9 @@ struct dw_hdmi_plat_data {
 	const struct dw_hdmi_mpll_config *mpll_cfg;
 	const struct dw_hdmi_curr_ctrl *cur_ctr;
 	const struct dw_hdmi_phy_config *phy_config;
+	int (*configure_phy)(struct dw_hdmi *hdmi,
+			     const struct dw_hdmi_plat_data *pdata,
+			     unsigned long mpixelclock);
 	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
 					   struct drm_display_mode *mode);
 };
@@ -77,4 +80,8 @@ void dw_hdmi_set_sample_rate(struct dw_hdmi *hdmi, unsigned int rate);
 void dw_hdmi_audio_enable(struct dw_hdmi *hdmi);
 void dw_hdmi_audio_disable(struct dw_hdmi *hdmi);
 
+/* PHY configuration */
+void dw_hdmi_phy_i2c_write(struct dw_hdmi *hdmi, unsigned short data,
+			   unsigned char addr);
+
 #endif /* __IMX_HDMI_H__ */
-- 
Regards,

Laurent Pinchart
