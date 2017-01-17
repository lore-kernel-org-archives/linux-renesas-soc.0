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
Subject: [PATCH v3 18/20] drm: bridge: dw-hdmi: Fix the name of the PHY reset macros
Date: Tue, 17 Jan 2017 10:29:08 +0200
Message-Id: <20170117082910.27023-19-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170117082910.27023-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170117082910.27023-1-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

The PHY reset signal is controlled by bit PHYRSTZ in the MC_PHYRSTZ
register. The signal is active low on Gen1 PHYs and active high on Gen2
PHYs. The driver toggles the signal high then low, which is correct for
all currently supported platforms, but the register values macros are
incorrectly named. Replace them with a single macro named after the bit,
and add a comment to the source code to explain the behaviour.

The driver's behaviour isn't changed by this rename, the code will still
need to be fixed to support Gen1 PHYs.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jose Abreu <joabreu@synopsys.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c | 6 +++---
 drivers/gpu/drm/bridge/dw-hdmi.h | 3 +--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index 6e605fd910ef..93e8816f1f78 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -986,9 +986,9 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi, int cscon)
 	/* gen2 pddq */
 	dw_hdmi_phy_gen2_pddq(hdmi, 1);
 
-	/* PHY reset */
-	hdmi_writeb(hdmi, HDMI_MC_PHYRSTZ_DEASSERT, HDMI_MC_PHYRSTZ);
-	hdmi_writeb(hdmi, HDMI_MC_PHYRSTZ_ASSERT, HDMI_MC_PHYRSTZ);
+	/* PHY reset. The reset signal is active high on Gen2 PHYs. */
+	hdmi_writeb(hdmi, HDMI_MC_PHYRSTZ_PHYRSTZ, HDMI_MC_PHYRSTZ);
+	hdmi_writeb(hdmi, 0, HDMI_MC_PHYRSTZ);
 
 	hdmi_writeb(hdmi, HDMI_MC_HEACPHY_RST_ASSERT, HDMI_MC_HEACPHY_RST);
 
diff --git a/drivers/gpu/drm/bridge/dw-hdmi.h b/drivers/gpu/drm/bridge/dw-hdmi.h
index f3c149c88d71..325b0b8ae639 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.h
+++ b/drivers/gpu/drm/bridge/dw-hdmi.h
@@ -989,8 +989,7 @@ enum {
 	HDMI_MC_FLOWCTRL_FEED_THROUGH_OFF_CSC_BYPASS = 0x0,
 
 /* MC_PHYRSTZ field values */
-	HDMI_MC_PHYRSTZ_ASSERT = 0x0,
-	HDMI_MC_PHYRSTZ_DEASSERT = 0x1,
+	HDMI_MC_PHYRSTZ_PHYRSTZ = 0x01,
 
 /* MC_HEACPHY_RST field values */
 	HDMI_MC_HEACPHY_RST_ASSERT = 0x1,
-- 
Regards,

Laurent Pinchart
