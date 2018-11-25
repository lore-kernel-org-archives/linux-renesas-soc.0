Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:46230 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbeKZBb2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Nov 2018 20:31:28 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: [PATCH 3/5] drm: rcar-du: Disable unused DPAD outputs
Date: Sun, 25 Nov 2018 16:40:29 +0200
Message-Id: <20181125144031.4407-4-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20181125144031.4407-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20181125144031.4407-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

DU channels are routed to DPAD outputs in an SoC-dependent way. The
routing can be fixed (e.g. DU3 to DPAD0 on H3) or configurable (e.g. DU0
or DU1 to DPAD0 on D3/E3). The hardware offers no option to disconnect
DPAD outputs, which are thus always driven by a DU channel.

On SoCs that have less DU channels than DU outputs, such as D3 and E3,
the DPAD output is always driven when all channels are in used by other
outputs (such as the internal LVDS and HDMI encoders). This creates an
unwanted clone on the DPAD output.

However, the parallel output of the DU channels routed to DPAD can be
set to fixed levels in the DU channels themselves through the DOFLR
group register. Use this to turn the DPAD on or off by driving fixed
signals at the output of any DU channel not routed to a DPAD output.
This doesn't affect the DU output signals going to other outputs.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 42 +++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index 7e440f61977f..5aaf41b7a2ca 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -287,6 +287,46 @@ int rcar_du_set_dpad0_vsp1_routing(struct rcar_du_device *rcdu)
 	return 0;
 }
 
+static void rcar_du_group_set_output_levels(struct rcar_du_group *rgrp)
+{
+	static const u32 doflr_values[2] = {
+		DOFLR_HSYCFL0 | DOFLR_VSYCFL0 | DOFLR_ODDFL0 |
+		DOFLR_DISPFL0 | DOFLR_CDEFL0  | DOFLR_RGBFL0,
+		DOFLR_HSYCFL1 | DOFLR_VSYCFL1 | DOFLR_ODDFL1 |
+		DOFLR_DISPFL1 | DOFLR_CDEFL1  | DOFLR_RGBFL1,
+	};
+	static const u32 dpad_mask = BIT(RCAR_DU_OUTPUT_DPAD1)
+				   | BIT(RCAR_DU_OUTPUT_DPAD0);
+	struct rcar_du_device *rcdu = rgrp->dev;
+	u32 doflr = DOFLR_CODE;
+	unsigned int i;
+
+	if (rcdu->info->gen < 2)
+		return;
+
+	/*
+	 * The DPAD outputs can't be controlled directly. However, the parallel
+	 * output of the DU channels routed to DPAD can be set to fixed levels
+	 * through the DOFLR group register. Use this to turn the DPAD on or off
+	 * by driving fixed signals at the output of any DU channel not routed
+	 * to a DPAD output. This doesn't affect the DU output signals going to
+	 * other outputs, such as the internal LVDS and HDMI encoders.
+	 */
+
+	for (i = 0; i < rgrp->num_crtcs; ++i) {
+		struct rcar_du_crtc_state *rstate;
+		struct rcar_du_crtc *rcrtc;
+
+		rcrtc = &rcdu->crtcs[rgrp->index * 2 + i];
+		rstate = to_rcar_crtc_state(rcrtc->crtc.state);
+
+		if (!(rstate->outputs & dpad_mask))
+			doflr |= doflr_values[i];
+	}
+
+	rcar_du_group_write(rgrp, DOFLR, doflr);
+}
+
 int rcar_du_group_set_routing(struct rcar_du_group *rgrp)
 {
 	struct rcar_du_device *rcdu = rgrp->dev;
@@ -306,5 +346,7 @@ int rcar_du_group_set_routing(struct rcar_du_group *rgrp)
 
 	rcar_du_group_write(rgrp, DORCR, dorcr);
 
+	rcar_du_group_set_output_levels(rgrp);
+
 	return rcar_du_set_dpad0_vsp1_routing(rgrp->dev);
 }
-- 
Regards,

Laurent Pinchart
