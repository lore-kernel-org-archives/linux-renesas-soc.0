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
Subject: [PATCH 03/22] drm: bridge: dw-hdmi: Remove unused function parameter
Date: Fri,  2 Dec 2016 01:43:18 +0200
Message-Id: <1480635817-1258-4-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The 'prep' parameter passed to hdmi_phy_configure() is useless. It is
hardcoded as 0, and if set, simply prevents the configure function from
executing.

Remove it.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index f86894622070..5f8044a7d602 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -931,7 +931,7 @@ static void dw_hdmi_phy_sel_interface_control(struct dw_hdmi *hdmi, u8 enable)
 			 HDMI_PHY_CONF0_SELDIPIF_MASK);
 }
 
-static int hdmi_phy_configure(struct dw_hdmi *hdmi, unsigned char prep,
+static int hdmi_phy_configure(struct dw_hdmi *hdmi,
 			      unsigned char res, int cscon)
 {
 	unsigned res_idx;
@@ -941,9 +941,6 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi, unsigned char prep,
 	const struct dw_hdmi_curr_ctrl *curr_ctrl = pdata->cur_ctr;
 	const struct dw_hdmi_phy_config *phy_config = pdata->phy_config;
 
-	if (prep)
-		return -EINVAL;
-
 	switch (res) {
 	case 0:	/* color resolution 0 is 8 bit colour depth */
 	case 8:
@@ -1072,7 +1069,7 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi)
 		dw_hdmi_phy_enable_powerdown(hdmi, true);
 
 		/* Enable CSC */
-		ret = hdmi_phy_configure(hdmi, 0, 8, cscon);
+		ret = hdmi_phy_configure(hdmi, 8, cscon);
 		if (ret)
 			return ret;
 	}
-- 
Regards,

Laurent Pinchart
