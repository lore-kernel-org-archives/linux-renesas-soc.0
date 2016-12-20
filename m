Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:41472 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754596AbcLTBds (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Dec 2016 20:33:48 -0500
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
Subject: [PATCH v2 17/29] drm: bridge: dw-hdmi: Refactor PHY power handling
Date: Tue, 20 Dec 2016 03:33:48 +0200
Message-Id: <20161220013400.28317-18-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Instead of spreading version-dependent PHY power handling code around,
group it in two functions to power the PHY on and off and use them
through the driver.

Powering off the PHY at the beginning of the setup phase is currently
split in two locations for first and second generation PHYs, group all
the operations in the dw_hdmi_phy_init() function.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c | 54 ++++++++++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index ef4f2f96ed2c..6167eb6806fe 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -116,6 +116,7 @@ struct dw_hdmi_i2c {
 struct dw_hdmi_phy_data {
 	enum dw_hdmi_phy_type type;
 	const char *name;
+	unsigned int gen;
 	bool has_svsret;
 };
 
@@ -940,6 +941,31 @@ static void dw_hdmi_phy_sel_interface_control(struct dw_hdmi *hdmi, u8 enable)
 			 HDMI_PHY_CONF0_SELDIPIF_MASK);
 }
 
+static void dw_hdmi_phy_power_off(struct dw_hdmi *hdmi)
+{
+	if (hdmi->phy->gen == 1) {
+		dw_hdmi_phy_enable_tmds(hdmi, 0);
+		dw_hdmi_phy_enable_powerdown(hdmi, true);
+	} else {
+		dw_hdmi_phy_gen2_txpwron(hdmi, 0);
+		dw_hdmi_phy_gen2_pddq(hdmi, 1);
+	}
+}
+
+static void dw_hdmi_phy_power_on(struct dw_hdmi *hdmi)
+{
+	if (hdmi->phy->gen == 1) {
+		dw_hdmi_phy_enable_powerdown(hdmi, false);
+
+		/* Toggle TMDS enable. */
+		dw_hdmi_phy_enable_tmds(hdmi, 0);
+		dw_hdmi_phy_enable_tmds(hdmi, 1);
+	} else {
+		dw_hdmi_phy_gen2_txpwron(hdmi, 1);
+		dw_hdmi_phy_gen2_pddq(hdmi, 0);
+	}
+}
+
 static int hdmi_phy_configure(struct dw_hdmi *hdmi, int cscon)
 {
 	u8 val, msec;
@@ -980,11 +1006,7 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi, int cscon)
 
 	hdmi_writeb(hdmi, val, HDMI_MC_FLOWCTRL);
 
-	/* gen2 tx power off */
-	dw_hdmi_phy_gen2_txpwron(hdmi, 0);
-
-	/* gen2 pddq */
-	dw_hdmi_phy_gen2_pddq(hdmi, 1);
+	dw_hdmi_phy_power_off(hdmi);
 
 	/* PHY reset */
 	hdmi_writeb(hdmi, HDMI_MC_PHYRSTZ_DEASSERT, HDMI_MC_PHYRSTZ);
@@ -1013,15 +1035,7 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi, int cscon)
 	/* REMOVE CLK TERM */
 	hdmi_phy_i2c_write(hdmi, 0x8000, 0x05);  /* CKCALCTRL */
 
-	dw_hdmi_phy_enable_powerdown(hdmi, false);
-
-	/* toggle TMDS enable */
-	dw_hdmi_phy_enable_tmds(hdmi, 0);
-	dw_hdmi_phy_enable_tmds(hdmi, 1);
-
-	/* gen2 tx power on */
-	dw_hdmi_phy_gen2_txpwron(hdmi, 1);
-	dw_hdmi_phy_gen2_pddq(hdmi, 0);
+	dw_hdmi_phy_power_on(hdmi);
 
 	/* The DWC MHL and HDMI 2.0 PHYs need the SVSRET signal to be set. */
 	if (hdmi->phy->has_svsret)
@@ -1058,8 +1072,6 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi)
 	for (i = 0; i < 2; i++) {
 		dw_hdmi_phy_sel_data_en_pol(hdmi, 1);
 		dw_hdmi_phy_sel_interface_control(hdmi, 0);
-		dw_hdmi_phy_enable_tmds(hdmi, 0);
-		dw_hdmi_phy_enable_powerdown(hdmi, true);
 
 		/* Enable CSC */
 		ret = hdmi_phy_configure(hdmi, cscon);
@@ -1290,9 +1302,7 @@ static void dw_hdmi_phy_disable(struct dw_hdmi *hdmi)
 	if (!hdmi->phy_enabled)
 		return;
 
-	dw_hdmi_phy_enable_tmds(hdmi, 0);
-	dw_hdmi_phy_enable_powerdown(hdmi, true);
-
+	dw_hdmi_phy_power_off(hdmi);
 	hdmi->phy_enabled = false;
 }
 
@@ -1853,23 +1863,29 @@ static const struct dw_hdmi_phy_data dw_hdmi_phys[] = {
 	{
 		.type = DW_HDMI_PHY_DWC_HDMI_TX_PHY,
 		.name = "DWC HDMI TX PHY",
+		.gen = 1,
 	}, {
 		.type = DW_HDMI_PHY_DWC_MHL_PHY_HEAC,
 		.name = "DWC MHL PHY + HEAC PHY",
+		.gen = 2,
 		.has_svsret = true,
 	}, {
 		.type = DW_HDMI_PHY_DWC_MHL_PHY,
 		.name = "DWC MHL PHY",
+		.gen = 2,
 		.has_svsret = true,
 	}, {
 		.type = DW_HDMI_PHY_DWC_HDMI_3D_TX_PHY_HEAC,
 		.name = "DWC HDMI 3D TX PHY + HEAC PHY",
+		.gen = 2,
 	}, {
 		.type = DW_HDMI_PHY_DWC_HDMI_3D_TX_PHY,
 		.name = "DWC HDMI 3D TX PHY",
+		.gen = 2,
 	}, {
 		.type = DW_HDMI_PHY_DWC_HDMI20_TX_PHY,
 		.name = "DWC HDMI 2.0 TX PHY",
+		.gen = 2,
 		.has_svsret = true,
 	}
 };
-- 
Regards,

Laurent Pinchart
