Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:60972 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbeIDQf2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Sep 2018 12:35:28 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 04/16] drm: bridge: thc63: Restrict modes based on hardware operating frequency
Date: Tue,  4 Sep 2018 15:10:15 +0300
Message-Id: <20180904121027.24031-5-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180904121027.24031-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20180904121027.24031-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The THC63LVD1024 is restricted to a pixel clock frequency in the range
of 8 to 135 MHz. Implement the bridge .mode_valid() operation
accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/thc63lvd1024.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
index c8b9edd5a7f4..63609ba16b6d 100644
--- a/drivers/gpu/drm/bridge/thc63lvd1024.c
+++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
@@ -45,6 +45,23 @@ static int thc63_attach(struct drm_bridge *bridge)
 	return drm_bridge_attach(bridge->encoder, thc63->next, bridge);
 }
 
+static enum drm_mode_status thc63_mode_valid(struct drm_bridge *bridge,
+					const struct drm_display_mode *mode)
+{
+	/*
+	 * The THC63LVD0124 clock frequency range is 8 to 135 MHz in single-in,
+	 * single-out mode. Note that the limits depends on the mode and will
+	 * need to be adjusted accordingly.
+	 */
+	if (mode->clock < 8000)
+		return MODE_CLOCK_LOW;
+
+	if (mode->clock > 135000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
 static void thc63_enable(struct drm_bridge *bridge)
 {
 	struct thc63_dev *thc63 = to_thc63(bridge);
@@ -77,6 +94,7 @@ static void thc63_disable(struct drm_bridge *bridge)
 
 static const struct drm_bridge_funcs thc63_bridge_func = {
 	.attach	= thc63_attach,
+	.mode_valid = thc63_mode_valid,
 	.enable = thc63_enable,
 	.disable = thc63_disable,
 };
-- 
Regards,

Laurent Pinchart
