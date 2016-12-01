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
Subject: [PATCH 11/22] drm: bridge: dw-hdmi: Refactor hdmi_phy_configure resolution parameter
Date: Fri,  2 Dec 2016 01:43:26 +0200
Message-Id: <1480635817-1258-12-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The current code hard codes the call of hdmi_phy_configure() to be 8bpp
and provides extraneous error checking to verify that this hardcoded
value is correct.

Simplify the passing of the data by setting the parameter to be of the
enum type it represents rather than converting and then verifying the
value. This will allow the compiler to check the value is acceptable
based on the type, and remove the dead code that we currently have.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c | 20 ++------------------
 include/drm/bridge/dw_hdmi.h     |  2 +-
 2 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index 107fea49c4c6..074ceb1e4897 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -931,30 +931,14 @@ static void dw_hdmi_phy_sel_interface_control(struct dw_hdmi *hdmi, u8 enable)
 }
 
 static int hdmi_phy_configure(struct dw_hdmi *hdmi,
-			      unsigned char res, int cscon)
+			      enum dw_hdmi_resolution res_idx, int cscon)
 {
-	unsigned res_idx;
 	u8 val, msec;
 	const struct dw_hdmi_plat_data *pdata = hdmi->plat_data;
 	const struct dw_hdmi_mpll_config *mpll_config = pdata->mpll_cfg;
 	const struct dw_hdmi_curr_ctrl *curr_ctrl = pdata->cur_ctr;
 	const struct dw_hdmi_phy_config *phy_config = pdata->phy_config;
 
-	switch (res) {
-	case 0:	/* color resolution 0 is 8 bit colour depth */
-	case 8:
-		res_idx = DW_HDMI_RES_8;
-		break;
-	case 10:
-		res_idx = DW_HDMI_RES_10;
-		break;
-	case 12:
-		res_idx = DW_HDMI_RES_12;
-		break;
-	default:
-		return -EINVAL;
-	}
-
 	/* PLL/MPLL Cfg - always match on final entry */
 	for (; mpll_config->mpixelclock != ~0UL; mpll_config++)
 		if (hdmi->hdmi_data.video_mode.mpixelclock <=
@@ -1068,7 +1052,7 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi)
 		dw_hdmi_phy_enable_powerdown(hdmi, true);
 
 		/* Enable CSC */
-		ret = hdmi_phy_configure(hdmi, 8, cscon);
+		ret = hdmi_phy_configure(hdmi, DW_HDMI_RES_8, cscon);
 		if (ret)
 			return ret;
 	}
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 3bb22a849830..e551b457c100 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -14,7 +14,7 @@
 
 struct dw_hdmi;
 
-enum {
+enum dw_hdmi_resolution {
 	DW_HDMI_RES_8,
 	DW_HDMI_RES_10,
 	DW_HDMI_RES_12,
-- 
Regards,

Laurent Pinchart
