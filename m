Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:45047 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727681AbeIURhq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Sep 2018 13:37:46 -0400
From: Nguyen An Hoan <na-hoan@jinso.co.jp>
To: broonie@kernel.org, linux-renesas-soc@vger.kernel.org,
        geert+renesas@glider.be
Cc: laurent.pinchart@ideasonboard.com,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        magnus.damm@gmail.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp,
        cv-dong@jinso.co.jp, na-hoan@jinso.co.jp
Subject: [PATCH] drm: rcar-du: fix probe error when DRM_RCAR_DW_HDMI disabled
Date: Fri, 21 Sep 2018 20:49:03 +0900
Message-Id: <1537530543-29518-2-git-send-email-na-hoan@jinso.co.jp>
In-Reply-To: <1537530543-29518-1-git-send-email-na-hoan@jinso.co.jp>
References: <1537530543-29518-1-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

Skip return EPROBE_DEFER when DRM_RCAR_DW_HDMI is disabled in case HDMI initialize.
At this time, the rcar-du driver not be able to successfully initialize
if disable DRM_RCAR_DW_HDMI (rcar_du_probe return error),
so can not use other features such as RGB Analog, this patch to fix.

Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index f9c933d..4dbc508 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -66,8 +66,15 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	/* Locate the DRM bridge from the encoder DT node. */
 	bridge = of_drm_find_bridge(enc_node);
 	if (!bridge) {
+#if IS_ENABLED(CONFIG_DRM_RCAR_DW_HDMI)
 		ret = -EPROBE_DEFER;
 		goto done;
+#else
+		if (output == RCAR_DU_OUTPUT_HDMI0 || 
+		    output == RCAR_DU_OUTPUT_HDMI1)
+		    ret = 0;
+		    goto done;
+#endif
 	}
 
 	ret = drm_encoder_init(rcdu->ddev, encoder, &encoder_funcs,
-- 
2.7.4
