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
Subject: [PATCH 13/22] drm: bridge: dw-hdmi: Replace device type with platform quirks
Date: Fri,  2 Dec 2016 01:43:28 +0200
Message-Id: <1480635817-1258-14-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The dw-hdmi driver declares a dev_type to distinguish platform specific
changes. Replace this with a quirk field, so that the platform can
specify the required quirks for the driver, rather than the driver
becoming conditional on multiple platforms.

As part of this, we rename the dw-hdmi 'spare' which is defined as the
SVSRET bit in later documentation.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c            | 14 ++++++--------
 drivers/gpu/drm/bridge/dw-hdmi.h            |  4 ++--
 drivers/gpu/drm/imx/dw_hdmi-imx.c           |  3 +--
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c |  2 +-
 include/drm/bridge/dw_hdmi.h                | 12 +++++-------
 5 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index 06a44a2cdf3b..26607185722f 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -118,7 +118,6 @@ struct dw_hdmi {
 	struct drm_bridge bridge;
 
 	struct platform_device *audio;
-	enum dw_hdmi_devtype dev_type;
 	struct device *dev;
 	struct clk *isfr_clk;
 	struct clk *iahb_clk;
@@ -896,11 +895,11 @@ static void dw_hdmi_phy_enable_tmds(struct dw_hdmi *hdmi, u8 enable)
 			 HDMI_PHY_CONF0_ENTMDS_MASK);
 }
 
-static void dw_hdmi_phy_enable_spare(struct dw_hdmi *hdmi, u8 enable)
+static void dw_hdmi_phy_enable_svsret(struct dw_hdmi *hdmi, u8 enable)
 {
 	hdmi_mask_writeb(hdmi, enable, HDMI_PHY_CONF0,
-			 HDMI_PHY_CONF0_SPARECTRL_OFFSET,
-			 HDMI_PHY_CONF0_SPARECTRL_MASK);
+			 HDMI_PHY_CONF0_SVSRET_OFFSET,
+			 HDMI_PHY_CONF0_SVSRET_MASK);
 }
 
 static void dw_hdmi_phy_gen2_pddq(struct dw_hdmi *hdmi, u8 enable)
@@ -1031,8 +1030,8 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi,
 	dw_hdmi_phy_gen2_txpwron(hdmi, 1);
 	dw_hdmi_phy_gen2_pddq(hdmi, 0);
 
-	if (hdmi->dev_type == RK3288_HDMI)
-		dw_hdmi_phy_enable_spare(hdmi, 1);
+	if (pdata->quirks & DW_HDMI_QUIRK_PHY_SVSRET)
+		dw_hdmi_phy_enable_svsret(hdmi, 1);
 
 	/*Wait for PHY PLL lock */
 	msec = 5;
@@ -1348,7 +1347,7 @@ static void dw_hdmi_clear_overflow(struct dw_hdmi *hdmi)
 	hdmi_writeb(hdmi, (u8)~HDMI_MC_SWRSTZ_TMDSSWRST_REQ, HDMI_MC_SWRSTZ);
 
 	val = hdmi_readb(hdmi, HDMI_FC_INVIDCONF);
-	if (hdmi->dev_type == IMX6DL_HDMI) {
+	if (hdmi->plat_data->quirks & DW_HDMI_QUIRK_FC_INVIDCONF) {
 		hdmi_writeb(hdmi, val, HDMI_FC_INVIDCONF);
 		return;
 	}
@@ -1859,7 +1858,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
 
 	hdmi->plat_data = plat_data;
 	hdmi->dev = dev;
-	hdmi->dev_type = plat_data->dev_type;
 	hdmi->sample_rate = 48000;
 	hdmi->disabled = true;
 	hdmi->rxsense = true;
diff --git a/drivers/gpu/drm/bridge/dw-hdmi.h b/drivers/gpu/drm/bridge/dw-hdmi.h
index 55135bbd0c16..08235aef2fa3 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.h
+++ b/drivers/gpu/drm/bridge/dw-hdmi.h
@@ -847,8 +847,8 @@ enum {
 	HDMI_PHY_CONF0_PDZ_OFFSET = 7,
 	HDMI_PHY_CONF0_ENTMDS_MASK = 0x40,
 	HDMI_PHY_CONF0_ENTMDS_OFFSET = 6,
-	HDMI_PHY_CONF0_SPARECTRL_MASK = 0x20,
-	HDMI_PHY_CONF0_SPARECTRL_OFFSET = 5,
+	HDMI_PHY_CONF0_SVSRET_MASK = 0x20,
+	HDMI_PHY_CONF0_SVSRET_OFFSET = 5,
 	HDMI_PHY_CONF0_GEN2_PDDQ_MASK = 0x10,
 	HDMI_PHY_CONF0_GEN2_PDDQ_OFFSET = 4,
 	HDMI_PHY_CONF0_GEN2_TXPWRON_MASK = 0x8,
diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
index f1cb25c429cf..404def112f5d 100644
--- a/drivers/gpu/drm/imx/dw_hdmi-imx.c
+++ b/drivers/gpu/drm/imx/dw_hdmi-imx.c
@@ -175,7 +175,6 @@ static struct dw_hdmi_plat_data imx6q_hdmi_drv_data = {
 	.mpll_cfg   = imx_mpll_cfg,
 	.cur_ctr    = imx_cur_ctr,
 	.phy_config = imx_phy_config,
-	.dev_type   = IMX6Q_HDMI,
 	.mode_valid = imx6q_hdmi_mode_valid,
 	.configure_phy = dw_hdmi_phy_configure_synopsys,
 };
@@ -184,7 +183,7 @@ static struct dw_hdmi_plat_data imx6dl_hdmi_drv_data = {
 	.mpll_cfg = imx_mpll_cfg,
 	.cur_ctr  = imx_cur_ctr,
 	.phy_config = imx_phy_config,
-	.dev_type = IMX6DL_HDMI,
+	.quirks   = DW_HDMI_QUIRK_FC_INVIDCONF,
 	.mode_valid = imx6dl_hdmi_mode_valid,
 	.configure_phy = dw_hdmi_phy_configure_synopsys,
 };
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 55b1f2f27d6e..4f6ff30fa091 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -238,7 +238,7 @@ static const struct dw_hdmi_plat_data rockchip_hdmi_drv_data = {
 	.cur_ctr    = rockchip_cur_ctr,
 	.phy_config = rockchip_phy_config,
 	.configure_phy = dw_hdmi_phy_configure_synopsys,
-	.dev_type   = RK3288_HDMI,
+	.quirks     = DW_HDMI_QUIRK_PHY_SVSRET,
 };
 
 static const struct of_device_id dw_hdmi_rockchip_dt_ids[] = {
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index fa7655836c81..4b12b8fe765e 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -21,12 +21,6 @@ enum dw_hdmi_resolution {
 	DW_HDMI_RES_MAX,
 };
 
-enum dw_hdmi_devtype {
-	IMX6Q_HDMI,
-	IMX6DL_HDMI,
-	RK3288_HDMI,
-};
-
 struct dw_hdmi_mpll_config {
 	unsigned long mpixelclock;
 	struct {
@@ -47,11 +41,15 @@ struct dw_hdmi_phy_config {
 	u16 vlev_ctr;   /* voltage level control */
 };
 
+/* Define DW HDMI platform-specific quirks */
+#define DW_HDMI_QUIRK_FC_INVIDCONF		BIT(0)
+#define DW_HDMI_QUIRK_PHY_SVSRET		BIT(1)
+
 struct dw_hdmi_plat_data {
-	enum dw_hdmi_devtype dev_type;
 	const struct dw_hdmi_mpll_config *mpll_cfg;
 	const struct dw_hdmi_curr_ctrl *cur_ctr;
 	const struct dw_hdmi_phy_config *phy_config;
+	unsigned int quirks;
 	int (*configure_phy)(struct dw_hdmi *hdmi,
 			     const struct dw_hdmi_plat_data *pdata,
 			     unsigned long mpixelclock,
-- 
Regards,

Laurent Pinchart
