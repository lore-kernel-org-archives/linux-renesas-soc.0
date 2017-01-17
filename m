Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart+renesas@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	Andy Yan <andy.yan@rock-chips.com>,
	Archit Taneja <architt@codeaurora.org>,
	Fabio Estevam <fabio.estevam@freescale.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Nickey Yang <nickey.yang@rock-chips.com>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: [PATCH v3 19/20] drm: bridge: dw-hdmi: Assert SVSRET before resetting the PHY
Date: Tue, 17 Jan 2017 10:29:09 +0200
Message-Id: <20170117082910.27023-20-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170117082910.27023-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170117082910.27023-1-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

According to the PHY IP core vendor, the SVSRET signal must be asserted
before resetting the PHY. Tests on RK3288 and R-Car Gen3 showed no
regression, the change should thus be safe.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jose Abreu <joabreu@synopsys.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index 93e8816f1f78..4fda0717e789 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -986,6 +986,10 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi, int cscon)
 	/* gen2 pddq */
 	dw_hdmi_phy_gen2_pddq(hdmi, 1);
 
+	/* Leave low power consumption mode by asserting SVSRET. */
+	if (hdmi->phy->has_svsret)
+		dw_hdmi_phy_enable_svsret(hdmi, 1);
+
 	/* PHY reset. The reset signal is active high on Gen2 PHYs. */
 	hdmi_writeb(hdmi, HDMI_MC_PHYRSTZ_PHYRSTZ, HDMI_MC_PHYRSTZ);
 	hdmi_writeb(hdmi, 0, HDMI_MC_PHYRSTZ);
@@ -1028,11 +1032,7 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi, int cscon)
 	dw_hdmi_phy_gen2_txpwron(hdmi, 1);
 	dw_hdmi_phy_gen2_pddq(hdmi, 0);
 
-	/* The DWC MHL and HDMI 2.0 PHYs need the SVSRET signal to be set. */
-	if (hdmi->phy->has_svsret)
-		dw_hdmi_phy_enable_svsret(hdmi, 1);
-
-	/*Wait for PHY PLL lock */
+	/* Wait for PHY PLL lock */
 	msec = 5;
 	do {
 		val = hdmi_readb(hdmi, HDMI_PHY_STAT0) & HDMI_PHY_TX_PHY_LOCK;
-- 
Regards,

Laurent Pinchart
