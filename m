Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:27965 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732699AbeHNQh7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Aug 2018 12:37:59 -0400
From: Ulrich Hecht <uli+renesas@fpond.eu>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PROTO][PATCH 08/10] drm: rcar-du: lvds: Handle LVDS interface reset
Date: Tue, 14 Aug 2018 15:50:02 +0200
Message-Id: <1534254604-24204-9-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu>
References: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Jacopo Mondi <jacopo+renesas@jmondi.org>

The processor manual prescribes to clear reset of LVDS interface in CPG/MSSR
module before display on, and to assert the same reset line at display off
time, to have the module resuming in a known state.

The module is said to be in "standby state" at initialization time, and this
requires, according to section 37.3.7 of the manual, to de-assert the reset to
have it functional.

Based on the original patch from
Koji Matsuoka <koji.matsuoka.xm@renesas.com>

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index cd55576..f6a4f9c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -14,6 +14,7 @@
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 
 #include <drm/drm_atomic.h>
@@ -55,6 +56,7 @@ struct rcar_lvds {
 
 	void __iomem *mmio;
 	struct clk *clock;
+	struct reset_control *rst;
 	bool enabled;
 
 	struct drm_display_mode display_mode;
@@ -385,6 +387,12 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
 	if (ret < 0)
 		return;
 
+	ret = reset_control_deassert(lvds->rst);
+	if (ret < 0) {
+		clk_disable_unprepare(lvds->clock);
+		return;
+	}
+
 	/*
 	 * Hardcode the channels and control signals routing for now.
 	 *
@@ -476,6 +484,7 @@ static void rcar_lvds_disable(struct drm_bridge *bridge)
 	rcar_lvds_write(lvds, LVDCR1, 0);
 	rcar_lvds_write(lvds, LVDPLLCR, 0);
 
+	reset_control_assert(lvds->rst);
 	clk_disable_unprepare(lvds->clock);
 
 	lvds->enabled = false;
@@ -692,6 +701,12 @@ static int rcar_lvds_probe(struct platform_device *pdev)
 		return PTR_ERR(lvds->clock);
 	}
 
+	lvds->rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(lvds->rst)) {
+		dev_err(&pdev->dev, "failed to get reset\n");
+		return PTR_ERR(lvds->rst);
+	}
+
 	drm_bridge_add(&lvds->bridge);
 
 	return 0;
-- 
2.7.4
