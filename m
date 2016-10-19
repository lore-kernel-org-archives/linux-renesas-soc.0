Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:35069 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938717AbcJSOOR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Oct 2016 10:14:17 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 6/8] drm: Set on-chip bridges' encoder type
Date: Wed, 19 Oct 2016 17:07:54 +0300
Message-Id: <1476886076-24178-7-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1476886076-24178-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1476886076-24178-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Initialize the new drm_bridge::encoder_type field to the right value for
all bridges that model on-SoC IP cores.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 2 ++
 drivers/gpu/drm/mediatek/mtk_hdmi.c     | 2 ++
 drivers/gpu/drm/sti/sti_dvo.c           | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index a0def0be6d65..7175ecda36e8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -390,6 +390,8 @@ static int exynos_mic_bind(struct device *dev, struct device *master,
 	mic->bridge.funcs = &mic_bridge_funcs;
 	mic->bridge.of_node = dev->of_node;
 	mic->bridge.driver_private = mic;
+	mic->bridge.encoder_type = DRM_MODE_ENCODER_DSI;
+
 	ret = drm_bridge_add(&mic->bridge);
 	if (ret)
 		DRM_ERROR("mic: Failed to add MIC to the global bridge list\n");
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 71227deef21b..4fd2e6203266 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1711,6 +1711,8 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
 
 	hdmi->bridge.funcs = &mtk_hdmi_bridge_funcs;
 	hdmi->bridge.of_node = pdev->dev.of_node;
+	hdmi->bridge.encoder_type = DRM_MODE_ENCODER_TMDS;
+
 	ret = drm_bridge_add(&hdmi->bridge);
 	if (ret) {
 		dev_err(dev, "failed to add bridge, ret = %d\n", ret);
diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index e8c1ed08a9f7..0c00d18028c5 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -472,6 +472,8 @@ static int sti_dvo_bind(struct device *dev, struct device *master, void *data)
 	bridge->driver_private = dvo;
 	bridge->funcs = &sti_dvo_bridge_funcs;
 	bridge->of_node = dvo->dev.of_node;
+	bridge->encoder_type = DRM_MODE_ENCODER_LVDS;
+
 	err = drm_bridge_add(bridge);
 	if (err) {
 		DRM_ERROR("Failed to add bridge\n");
-- 
Regards,

Laurent Pinchart
