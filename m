Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35149 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934472AbcKKRIE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Nov 2016 12:08:04 -0500
Received: by mail-wm0-f66.google.com with SMTP id a20so10774848wme.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Nov 2016 09:08:03 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org
Cc: kuninori.morimoto.gx@renesas.com, geert@linux-m68k.org,
        airlied@linux.ie, koji.matsuoka.xm@renesas.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 02/10] drm: bridge/dw_hdmi: Add R-Car Gen3 device support
Date: Fri, 11 Nov 2016 18:07:38 +0100
Message-Id: <1478884066-1090-3-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1478884066-1090-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1478884066-1090-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
[uli: eliminate rcar-specific connector funcs, extraneous DT properties]
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 drivers/gpu/drm/bridge/dw-hdmi.c | 113 ++++++++++++++++++++++++++-------------
 include/drm/bridge/dw_hdmi.h     |   9 ++++
 2 files changed, 86 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index 7c8386b..0c1c2ec 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -1,6 +1,7 @@
 /*
  * DesignWare High-Definition Multimedia Interface (HDMI) driver
  *
+ * Copyright (C) 2015 Renesas Electronics Corporation
  * Copyright (C) 2013-2015 Mentor Graphics Inc.
  * Copyright (C) 2011-2013 Freescale Semiconductor, Inc.
  * Copyright (C) 2010, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
@@ -21,6 +22,7 @@
 #include <linux/of_device.h>
 #include <linux/spinlock.h>
 
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_of.h>
 #include <drm/drmP.h>
 #include <drm/drm_atomic_helper.h>
@@ -154,6 +156,9 @@ struct dw_hdmi {
 	unsigned int audio_cts;
 	unsigned int audio_n;
 	bool audio_enable;
+	int ratio;
+	bool interlaced;
+	int num;
 
 	void (*write)(struct dw_hdmi *hdmi, u8 val, int offset);
 	u8 (*read)(struct dw_hdmi *hdmi, int offset);
@@ -947,6 +952,7 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi, unsigned char prep,
 	const struct dw_hdmi_mpll_config *mpll_config = pdata->mpll_cfg;
 	const struct dw_hdmi_curr_ctrl *curr_ctrl = pdata->cur_ctr;
 	const struct dw_hdmi_phy_config *phy_config = pdata->phy_config;
+	const struct dw_hdmi_multi_div *multi_div = pdata->multi_div;
 
 	if (prep)
 		return -EINVAL;
@@ -982,6 +988,13 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi, unsigned char prep,
 		    phy_config->mpixelclock)
 			break;
 
+	if (hdmi->dev_type == RCAR_HDMI) {
+		for (; multi_div->mpixelclock != ~0UL; multi_div++)
+			if (hdmi->hdmi_data.video_mode.mpixelclock <=
+			    multi_div->mpixelclock)
+				break;
+	}
+
 	if (mpll_config->mpixelclock == ~0UL ||
 	    curr_ctrl->mpixelclock == ~0UL ||
 	    phy_config->mpixelclock == ~0UL) {
@@ -990,6 +1003,13 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi, unsigned char prep,
 		return -EINVAL;
 	}
 
+	if (multi_div->mpixelclock == ~0UL &&
+	    hdmi->dev_type == RCAR_HDMI) {
+		dev_err(hdmi->dev, "Pixel clock %d - unsupported by HDMI\n",
+			hdmi->hdmi_data.video_mode.mpixelclock);
+		return -EINVAL;
+	}
+
 	/* Enable csc path */
 	if (cscon)
 		val = HDMI_MC_FLOWCTRL_FEED_THROUGH_OFF_CSC_IN_PATH;
@@ -1016,21 +1036,28 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi, unsigned char prep,
 	hdmi_phy_test_clear(hdmi, 0);
 
 	hdmi_phy_i2c_write(hdmi, mpll_config->res[res_idx].cpce, 0x06);
-	hdmi_phy_i2c_write(hdmi, mpll_config->res[res_idx].gmp, 0x15);
+	if (hdmi->dev_type != RCAR_HDMI)
+		hdmi_phy_i2c_write(hdmi, mpll_config->res[res_idx].gmp, 0x15);
 
 	/* CURRCTRL */
 	hdmi_phy_i2c_write(hdmi, curr_ctrl->curr[res_idx], 0x10);
 
-	hdmi_phy_i2c_write(hdmi, 0x0000, 0x13);  /* PLLPHBYCTRL */
-	hdmi_phy_i2c_write(hdmi, 0x0006, 0x17);
-
-	hdmi_phy_i2c_write(hdmi, phy_config->term, 0x19);  /* TXTERM */
-	hdmi_phy_i2c_write(hdmi, phy_config->sym_ctr, 0x09); /* CKSYMTXCTRL */
-	hdmi_phy_i2c_write(hdmi, phy_config->vlev_ctr, 0x0E); /* VLEVCTRL */
-
-	/* REMOVE CLK TERM */
-	hdmi_phy_i2c_write(hdmi, 0x8000, 0x05);  /* CKCALCTRL */
-
+	if (hdmi->dev_type == RCAR_HDMI)
+		hdmi_phy_i2c_write(hdmi, multi_div->multi[res_idx], 0x11);
+
+	if (hdmi->dev_type != RCAR_HDMI) {
+		hdmi_phy_i2c_write(hdmi, 0x0000, 0x13);	/* PLLPHBYCTRL */
+		hdmi_phy_i2c_write(hdmi, 0x0006, 0x17);
+
+		hdmi_phy_i2c_write(hdmi, phy_config->term,
+				   0x19);		/* TXTERM */
+		hdmi_phy_i2c_write(hdmi, phy_config->sym_ctr,
+				   0x09);		/* CKSYMTXCTRL */
+		hdmi_phy_i2c_write(hdmi, phy_config->vlev_ctr,
+				   0x0e);		/* VLEVCTRL */
+		/* REMOVE CLK TERM */
+		hdmi_phy_i2c_write(hdmi, 0x8000, 0x05);	/* CKCALCTRL */
+	}
 	dw_hdmi_phy_enable_powerdown(hdmi, false);
 
 	/* toggle TMDS enable */
@@ -1041,7 +1068,7 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi, unsigned char prep,
 	dw_hdmi_phy_gen2_txpwron(hdmi, 1);
 	dw_hdmi_phy_gen2_pddq(hdmi, 0);
 
-	if (hdmi->dev_type == RK3288_HDMI)
+	if (hdmi->dev_type == RK3288_HDMI || hdmi->dev_type == RCAR_HDMI)
 		dw_hdmi_phy_enable_spare(hdmi, 1);
 
 	/*Wait for PHY PLL lock */
@@ -1850,6 +1877,9 @@ static int dw_hdmi_register(struct drm_device *drm, struct dw_hdmi *hdmi)
 	encoder->bridge = bridge;
 	hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;
 
+	if (hdmi->interlaced)
+		hdmi->connector.interlace_allowed = true;
+
 	drm_connector_helper_add(&hdmi->connector,
 				 &dw_hdmi_connector_helper_funcs);
 
@@ -1911,6 +1941,11 @@ int dw_hdmi_bind(struct device *dev, struct device *master,
 		return -EINVAL;
 	}
 
+	if (of_property_read_u32(np, "interlaced", &val) == 0)
+		hdmi->interlaced = val;
+	else
+		hdmi->interlaced = false;
+
 	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
 	if (ddc_node) {
 		hdmi->ddc = of_find_i2c_adapter_by_node(ddc_node);
@@ -1929,29 +1964,27 @@ int dw_hdmi_bind(struct device *dev, struct device *master,
 		return PTR_ERR(hdmi->regs);
 
 	hdmi->isfr_clk = devm_clk_get(hdmi->dev, "isfr");
-	if (IS_ERR(hdmi->isfr_clk)) {
-		ret = PTR_ERR(hdmi->isfr_clk);
-		dev_err(hdmi->dev, "Unable to get HDMI isfr clk: %d\n", ret);
-		return ret;
-	}
-
-	ret = clk_prepare_enable(hdmi->isfr_clk);
-	if (ret) {
-		dev_err(hdmi->dev, "Cannot enable HDMI isfr clock: %d\n", ret);
-		return ret;
+	if (IS_ERR(hdmi->isfr_clk))
+		hdmi->isfr_clk = NULL;
+	else {
+		ret = clk_prepare_enable(hdmi->isfr_clk);
+		if (ret) {
+			dev_err(hdmi->dev,
+				"Cannot enable HDMI isfr clock: %d\n", ret);
+			return ret;
+		}
 	}
 
 	hdmi->iahb_clk = devm_clk_get(hdmi->dev, "iahb");
-	if (IS_ERR(hdmi->iahb_clk)) {
-		ret = PTR_ERR(hdmi->iahb_clk);
-		dev_err(hdmi->dev, "Unable to get HDMI iahb clk: %d\n", ret);
-		goto err_isfr;
-	}
-
-	ret = clk_prepare_enable(hdmi->iahb_clk);
-	if (ret) {
-		dev_err(hdmi->dev, "Cannot enable HDMI iahb clock: %d\n", ret);
-		goto err_isfr;
+	if (IS_ERR(hdmi->iahb_clk))
+		hdmi->iahb_clk = NULL;
+	else {
+		ret = clk_prepare_enable(hdmi->iahb_clk);
+		if (ret) {
+			dev_err(hdmi->dev,
+				"Cannot enable HDMI iahb clock: %d\n", ret);
+			goto err_isfr;
+		}
 	}
 
 	/* Product and revision IDs */
@@ -2037,9 +2070,11 @@ int dw_hdmi_bind(struct device *dev, struct device *master,
 		hdmi->ddc = NULL;
 	}
 
-	clk_disable_unprepare(hdmi->iahb_clk);
+	if (hdmi->iahb_clk)
+		clk_disable_unprepare(hdmi->iahb_clk);
 err_isfr:
-	clk_disable_unprepare(hdmi->isfr_clk);
+	if (hdmi->isfr_clk)
+		clk_disable_unprepare(hdmi->isfr_clk);
 
 	return ret;
 }
@@ -2055,8 +2090,14 @@ void dw_hdmi_unbind(struct device *dev, struct device *master, void *data)
 	/* Disable all interrupts */
 	hdmi_writeb(hdmi, ~0, HDMI_IH_MUTE_PHY_STAT0);
 
-	clk_disable_unprepare(hdmi->iahb_clk);
-	clk_disable_unprepare(hdmi->isfr_clk);
+	hdmi->connector.funcs->destroy(&hdmi->connector);
+	hdmi->encoder->funcs->destroy(hdmi->encoder);
+
+	if (hdmi->iahb_clk)
+		clk_disable_unprepare(hdmi->iahb_clk);
+
+	if (hdmi->isfr_clk)
+		clk_disable_unprepare(hdmi->isfr_clk);
 
 	if (hdmi->i2c)
 		i2c_del_adapter(&hdmi->i2c->adap);
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index bae79f3..a620cab 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -1,4 +1,5 @@
 /*
+ * Copyright (C) 2015 Renesas Electronics Corporation
  * Copyright (C) 2011 Freescale Semiconductor, Inc.
  *
  * This program is free software; you can redistribute it and/or modify
@@ -25,6 +26,7 @@ enum dw_hdmi_devtype {
 	IMX6Q_HDMI,
 	IMX6DL_HDMI,
 	RK3288_HDMI,
+	RCAR_HDMI,
 };
 
 struct dw_hdmi_mpll_config {
@@ -40,6 +42,11 @@ struct dw_hdmi_curr_ctrl {
 	u16 curr[DW_HDMI_RES_MAX];
 };
 
+struct dw_hdmi_multi_div {
+	unsigned long mpixelclock;
+	u16 multi[DW_HDMI_RES_MAX];
+};
+
 struct dw_hdmi_phy_config {
 	unsigned long mpixelclock;
 	u16 sym_ctr;    /*clock symbol and transmitter control*/
@@ -51,9 +58,11 @@ struct dw_hdmi_plat_data {
 	enum dw_hdmi_devtype dev_type;
 	const struct dw_hdmi_mpll_config *mpll_cfg;
 	const struct dw_hdmi_curr_ctrl *cur_ctr;
+	const struct dw_hdmi_multi_div *multi_div;
 	const struct dw_hdmi_phy_config *phy_config;
 	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
 					   struct drm_display_mode *mode);
+	u32 index;
 };
 
 void dw_hdmi_unbind(struct device *dev, struct device *master, void *data);
-- 
2.7.4
