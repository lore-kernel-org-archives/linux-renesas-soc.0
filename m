Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:41469 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754714AbcLTBdt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Dec 2016 20:33:49 -0500
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
Subject: [PATCH v2 20/29] drm: bridge: dw-hdmi: Remove device type from platform data
Date: Tue, 20 Dec 2016 03:33:51 +0200
Message-Id: <20161220013400.28317-21-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The device type isn't used anymore now that workarounds and PHY-specific
operations are performed based on version information read at runtime.
Remove it.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c            | 2 --
 drivers/gpu/drm/imx/dw_hdmi-imx.c           | 2 --
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 1 -
 include/drm/bridge/dw_hdmi.h                | 7 -------
 4 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index ebea96ad5dd0..8480f95d3e0b 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -127,7 +127,6 @@ struct dw_hdmi {
 	struct drm_connector connector;
 	struct drm_bridge bridge;
 
-	enum dw_hdmi_devtype dev_type;
 	unsigned int version;
 
 	struct platform_device *audio;
@@ -1969,7 +1968,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
 
 	hdmi->plat_data = plat_data;
 	hdmi->dev = dev;
-	hdmi->dev_type = plat_data->dev_type;
 	hdmi->sample_rate = 48000;
 	hdmi->disabled = true;
 	hdmi->rxsense = true;
diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
index f645275e6e63..f039641070ac 100644
--- a/drivers/gpu/drm/imx/dw_hdmi-imx.c
+++ b/drivers/gpu/drm/imx/dw_hdmi-imx.c
@@ -175,7 +175,6 @@ static struct dw_hdmi_plat_data imx6q_hdmi_drv_data = {
 	.mpll_cfg   = imx_mpll_cfg,
 	.cur_ctr    = imx_cur_ctr,
 	.phy_config = imx_phy_config,
-	.dev_type   = IMX6Q_HDMI,
 	.mode_valid = imx6q_hdmi_mode_valid,
 };
 
@@ -183,7 +182,6 @@ static struct dw_hdmi_plat_data imx6dl_hdmi_drv_data = {
 	.mpll_cfg = imx_mpll_cfg,
 	.cur_ctr  = imx_cur_ctr,
 	.phy_config = imx_phy_config,
-	.dev_type = IMX6DL_HDMI,
 	.mode_valid = imx6dl_hdmi_mode_valid,
 };
 
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index a6d4a0236e8f..d53827413996 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -237,7 +237,6 @@ static const struct dw_hdmi_plat_data rockchip_hdmi_drv_data = {
 	.mpll_cfg   = rockchip_mpll_cfg,
 	.cur_ctr    = rockchip_cur_ctr,
 	.phy_config = rockchip_phy_config,
-	.dev_type   = RK3288_HDMI,
 };
 
 static const struct of_device_id dw_hdmi_rockchip_dt_ids[] = {
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index c539f64a280a..735a8ab2509c 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -21,12 +21,6 @@ enum {
 	DW_HDMI_RES_MAX,
 };
 
-enum dw_hdmi_devtype {
-	IMX6Q_HDMI,
-	IMX6DL_HDMI,
-	RK3288_HDMI,
-};
-
 enum dw_hdmi_phy_type {
 	DW_HDMI_PHY_DWC_HDMI_TX_PHY = 0x00,
 	DW_HDMI_PHY_DWC_MHL_PHY_HEAC = 0xb2,
@@ -58,7 +52,6 @@ struct dw_hdmi_phy_config {
 };
 
 struct dw_hdmi_plat_data {
-	enum dw_hdmi_devtype dev_type;
 	const struct dw_hdmi_mpll_config *mpll_cfg;
 	const struct dw_hdmi_curr_ctrl *cur_ctr;
 	const struct dw_hdmi_phy_config *phy_config;
-- 
Regards,

Laurent Pinchart
