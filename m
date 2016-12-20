Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:41469 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754596AbcLTBdp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Dec 2016 20:33:45 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Andy Yan <andy.yan@rock-chips.com>,
        Fabio Estevam <fabio.estevam@freescale.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Ulrich Hecht <ulrich.hecht@gmail.com>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 12/29] drm: bridge: dw-hdmi: Rename CONF0 SPARECTRL bit to SVSRET
Date: Tue, 20 Dec 2016 03:33:43 +0200
Message-Id: <20161220013400.28317-13-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The bit is documented in a Rockchip BSP as

 #define m_SVSRET_SIG		(1 << 5) /* depend on PHY_MHL_COMB0=1 */

This is confirmed by a Renesas platform, which uses a 2.0 DWC HDMI TX as
the RK3288. Rename the bit accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c | 8 ++++----
 drivers/gpu/drm/bridge/dw-hdmi.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index b4fb0bd78910..06c252f560ad 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -895,11 +895,11 @@ static void dw_hdmi_phy_enable_tmds(struct dw_hdmi *hdmi, u8 enable)
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
@@ -1014,7 +1014,7 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi, int cscon)
 	dw_hdmi_phy_gen2_pddq(hdmi, 0);
 
 	if (hdmi->dev_type == RK3288_HDMI)
-		dw_hdmi_phy_enable_spare(hdmi, 1);
+		dw_hdmi_phy_enable_svsret(hdmi, 1);
 
 	/*Wait for PHY PLL lock */
 	msec = 5;
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
-- 
Regards,

Laurent Pinchart
