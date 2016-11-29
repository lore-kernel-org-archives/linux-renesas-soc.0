Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60491 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756484AbcK2JFJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 04:05:09 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Archit Taneja <architt@codeaurora.org>,
        Boris Brezillon <boris.brezillon@free-electrons.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Sean Paul <seanpaul@chromium.org>,
        Inki Dae <inki.dae@samsung.com>,
        Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH v3 10/13] drm: bridge: Set bridges' encoder type
Date: Tue, 29 Nov 2016 11:04:40 +0200
Message-Id: <1480410283-28698-11-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Initialize the new drm_bridge::encoder_type field to the right value for
all external bridge drivers.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       | 1 +
 drivers/gpu/drm/bridge/analogix-anx78xx.c          | 1 +
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 1 +
 drivers/gpu/drm/bridge/dumb-vga-dac.c              | 1 +
 drivers/gpu/drm/bridge/dw-hdmi.c                   | 2 ++
 drivers/gpu/drm/bridge/nxp-ptn3460.c               | 2 ++
 drivers/gpu/drm/bridge/parade-ps8622.c             | 2 ++
 drivers/gpu/drm/bridge/sii902x.c                   | 2 ++
 drivers/gpu/drm/bridge/tc358767.c                  | 2 ++
 9 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 8ed3906dd411..66bbd2073529 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1030,6 +1030,7 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 
 	adv7511->bridge.funcs = &adv7511_bridge_funcs;
 	adv7511->bridge.of_node = dev->of_node;
+	adv7511->bridge.encoder_type = DRM_MODE_ENCODER_TMDS;
 
 	ret = drm_bridge_add(&adv7511->bridge);
 	if (ret) {
diff --git a/drivers/gpu/drm/bridge/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix-anx78xx.c
index a2a82366a771..62be93f7ffaa 100644
--- a/drivers/gpu/drm/bridge/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix-anx78xx.c
@@ -1437,6 +1437,7 @@ static int anx78xx_i2c_probe(struct i2c_client *client,
 	}
 
 	anx78xx->bridge.funcs = &anx78xx_bridge_funcs;
+	anx78xx->bridge.encoder_type = DRM_MODE_ENCODER_TMDS;
 
 	err = drm_bridge_add(&anx78xx->bridge);
 	if (err < 0) {
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 1835f1fdad19..f0f9c5024e3e 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1229,6 +1229,7 @@ static int analogix_dp_create_bridge(struct drm_device *drm_dev,
 
 	bridge->driver_private = dp;
 	bridge->funcs = &analogix_dp_bridge_funcs;
+	bridge->encoder_type = DRM_MODE_ENCODER_TMDS;
 
 	ret = drm_bridge_attach(dp->encoder, bridge, NULL);
 	if (ret) {
diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/bridge/dumb-vga-dac.c
index b33e3f829e4f..036c54c849e6 100644
--- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
+++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
@@ -182,6 +182,7 @@ static int dumb_vga_probe(struct platform_device *pdev)
 
 	vga->bridge.funcs = &dumb_vga_bridge_funcs;
 	vga->bridge.of_node = pdev->dev.of_node;
+	vga->bridge.encoder_type = DRM_MODE_ENCODER_DAC;
 
 	ret = drm_bridge_add(&vga->bridge);
 	if (ret && !IS_ERR(vga->ddc))
diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
index 432e0e3fff72..0ac28aa76017 100644
--- a/drivers/gpu/drm/bridge/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/dw-hdmi.c
@@ -1841,6 +1841,8 @@ static int dw_hdmi_register(struct drm_device *drm, struct dw_hdmi *hdmi)
 	hdmi->bridge = bridge;
 	bridge->driver_private = hdmi;
 	bridge->funcs = &dw_hdmi_bridge_funcs;
+	bridge->encoder_type = DRM_MODE_ENCODER_TMDS;
+
 	ret = drm_bridge_attach(encoder, bridge, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to initialize bridge with drm\n");
diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index f1a99938e924..8be117cc024f 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -349,6 +349,8 @@ static int ptn3460_probe(struct i2c_client *client,
 
 	ptn_bridge->bridge.funcs = &ptn3460_bridge_funcs;
 	ptn_bridge->bridge.of_node = dev->of_node;
+	ptn_bridge->bridge.encoder_type = DRM_MODE_ENCODER_LVDS;
+
 	ret = drm_bridge_add(&ptn_bridge->bridge);
 	if (ret) {
 		DRM_ERROR("Failed to add bridge\n");
diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index 6f7c2f9860d2..37ac7211139a 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -615,6 +615,8 @@ static int ps8622_probe(struct i2c_client *client,
 
 	ps8622->bridge.funcs = &ps8622_bridge_funcs;
 	ps8622->bridge.of_node = dev->of_node;
+	ps8622->bridge.encoder_type = DRM_MODE_ENCODER_LVDS;
+
 	ret = drm_bridge_add(&ps8622->bridge);
 	if (ret) {
 		DRM_ERROR("Failed to add bridge\n");
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 9126d0306ab5..ad4663dea333 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -418,6 +418,8 @@ static int sii902x_probe(struct i2c_client *client,
 
 	sii902x->bridge.funcs = &sii902x_bridge_funcs;
 	sii902x->bridge.of_node = dev->of_node;
+	sii902x->bridge.encoder_type = DRM_MODE_ENCODER_TMDS;
+
 	ret = drm_bridge_add(&sii902x->bridge);
 	if (ret) {
 		dev_err(dev, "Failed to add drm_bridge\n");
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 44d476ea6d2e..934333cb647b 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1353,6 +1353,8 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 	tc->bridge.funcs = &tc_bridge_funcs;
 	tc->bridge.of_node = dev->of_node;
+	tc->bridge.encoder_type = DRM_MODE_ENCODER_TMDS;
+
 	ret = drm_bridge_add(&tc->bridge);
 	if (ret) {
 		dev_err(dev, "Failed to add drm_bridge: %d\n", ret);
-- 
Regards,

Laurent Pinchart
