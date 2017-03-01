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
Subject: [PATCH v4 1/9] drm: bridge: dw-hdmi: Remove unused functions
Date: Thu,  2 Mar 2017 00:39:07 +0200
Message-Id: <20170301223915.29888-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170301223915.29888-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170301223915.29888-1-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

Most of the hdmi_phy_test_*() functions are unused. Remove them.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index 9a9ec27d9e28..ce7496399ccf 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -837,32 +837,6 @@ static inline void hdmi_phy_test_clear(struct dw_hdmi *hdmi,
 		  HDMI_PHY_TST0_TSTCLR_MASK, HDMI_PHY_TST0);
 }
 
-static inline void hdmi_phy_test_enable(struct dw_hdmi *hdmi,
-					unsigned char bit)
-{
-	hdmi_modb(hdmi, bit << HDMI_PHY_TST0_TSTEN_OFFSET,
-		  HDMI_PHY_TST0_TSTEN_MASK, HDMI_PHY_TST0);
-}
-
-static inline void hdmi_phy_test_clock(struct dw_hdmi *hdmi,
-				       unsigned char bit)
-{
-	hdmi_modb(hdmi, bit << HDMI_PHY_TST0_TSTCLK_OFFSET,
-		  HDMI_PHY_TST0_TSTCLK_MASK, HDMI_PHY_TST0);
-}
-
-static inline void hdmi_phy_test_din(struct dw_hdmi *hdmi,
-				     unsigned char bit)
-{
-	hdmi_writeb(hdmi, bit, HDMI_PHY_TST1);
-}
-
-static inline void hdmi_phy_test_dout(struct dw_hdmi *hdmi,
-				      unsigned char bit)
-{
-	hdmi_writeb(hdmi, bit, HDMI_PHY_TST2);
-}
-
 static bool hdmi_phy_wait_i2c_done(struct dw_hdmi *hdmi, int msec)
 {
 	u32 val;
-- 
Regards,

Laurent Pinchart
