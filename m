Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart+renesas@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Andy Yan <andy.yan@rock-chips.com>,
	Fabio Estevam <fabio.estevam@freescale.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Nickey Yang <nickey.yang@rock-chips.com>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 2/9] drm: bridge: dw-hdmi: Move CSC configuration out of PHY code
Date: Thu,  2 Mar 2017 00:39:08 +0200
Message-Id: <20170301223915.29888-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170301223915.29888-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170301223915.29888-1-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

The color space converter isn't part of the PHY, move its configuration
out of PHY code.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index ce7496399ccf..906583beb08b 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -914,7 +914,7 @@ static void dw_hdmi_phy_sel_interface_control(struct dw_hdmi *hdmi, u8 enable)
 			 HDMI_PHY_CONF0_SELDIPIF_MASK);
 }
 
-static int hdmi_phy_configure(struct dw_hdmi *hdmi, int cscon)
+static int hdmi_phy_configure(struct dw_hdmi *hdmi)
 {
 	u8 val, msec;
 	const struct dw_hdmi_plat_data *pdata = hdmi->plat_data;
@@ -946,14 +946,6 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi, int cscon)
 		return -EINVAL;
 	}
 
-	/* Enable csc path */
-	if (cscon)
-		val = HDMI_MC_FLOWCTRL_FEED_THROUGH_OFF_CSC_IN_PATH;
-	else
-		val = HDMI_MC_FLOWCTRL_FEED_THROUGH_OFF_CSC_BYPASS;
-
-	hdmi_writeb(hdmi, val, HDMI_MC_FLOWCTRL);
-
 	/* gen2 tx power off */
 	dw_hdmi_phy_gen2_txpwron(hdmi, 0);
 
@@ -1028,10 +1020,6 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi, int cscon)
 static int dw_hdmi_phy_init(struct dw_hdmi *hdmi)
 {
 	int i, ret;
-	bool cscon;
-
-	/*check csc whether needed activated in HDMI mode */
-	cscon = hdmi->sink_is_hdmi && is_color_space_conversion(hdmi);
 
 	/* HDMI Phy spec says to do the phy initialization sequence twice */
 	for (i = 0; i < 2; i++) {
@@ -1040,8 +1028,7 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi)
 		dw_hdmi_phy_enable_tmds(hdmi, 0);
 		dw_hdmi_phy_enable_powerdown(hdmi, true);
 
-		/* Enable CSC */
-		ret = hdmi_phy_configure(hdmi, cscon);
+		ret = hdmi_phy_configure(hdmi);
 		if (ret)
 			return ret;
 	}
@@ -1303,6 +1290,14 @@ static void dw_hdmi_enable_video_path(struct dw_hdmi *hdmi)
 		clkdis &= ~HDMI_MC_CLKDIS_CSCCLK_DISABLE;
 		hdmi_writeb(hdmi, clkdis, HDMI_MC_CLKDIS);
 	}
+
+	/* Enable color space conversion if needed (for HDMI sinks only). */
+	if (hdmi->sink_is_hdmi && is_color_space_conversion(hdmi))
+		hdmi_writeb(hdmi, HDMI_MC_FLOWCTRL_FEED_THROUGH_OFF_CSC_IN_PATH,
+			    HDMI_MC_FLOWCTRL);
+	else
+		hdmi_writeb(hdmi, HDMI_MC_FLOWCTRL_FEED_THROUGH_OFF_CSC_BYPASS,
+			    HDMI_MC_FLOWCTRL);
 }
 
 static void hdmi_enable_audio_clk(struct dw_hdmi *hdmi)
-- 
Regards,

Laurent Pinchart
