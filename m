Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD913C282C4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 22:54:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AB05120870
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 22:54:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c0I6cVL7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbfAVWyP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jan 2019 17:54:15 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60676 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfAVWyP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jan 2019 17:54:15 -0500
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EEBD1234;
        Tue, 22 Jan 2019 23:54:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1548197651;
        bh=3eoIvDpyBLbww5t8OhJ5cw5GlYAmYVtWfKErUaHrhOU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c0I6cVL7c/VmBOi4+HSVc62YoR7lnAOCpbsrdNMArJmSIz0SAGYQXDUmQhO7CWDNK
         tNvgsXDlkZDuLizqQI5/PAXMnnxDc/nbOFPkLJGR9cinvq4Yy5hYd0rkEHTCUzXKeR
         wa7LFo/+XWKt82M4+KYqR38WSzuFoxCQGlNKUfWU=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 4/6] drm: rcar-du: Turn LVDS clock output on/off for DPAD0 output on D3/E3
Date:   Wed, 23 Jan 2019 00:54:03 +0200
Message-Id: <20190122225405.7815-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190122225405.7815-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190122225405.7815-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On the D3 and E3 SoCs the LVDS PLL clock output provides the dot clock
to the DU channels, even when the LVDS outputs are not in use. Enable
and disable the LVDS clock output when enabling or disabling a CRTC
connected to the DPAD0 output.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c    | 34 +++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h     |  3 ++
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c |  1 +
 3 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 771b460c7216..3018e4500aa1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -26,6 +26,7 @@
 #include "rcar_du_plane.h"
 #include "rcar_du_regs.h"
 #include "rcar_du_vsp.h"
+#include "rcar_lvds.h"
 
 static u32 rcar_du_crtc_read(struct rcar_du_crtc *rcrtc, u32 reg)
 {
@@ -657,8 +658,27 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 				       struct drm_crtc_state *old_state)
 {
 	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+	struct rcar_du_crtc_state *rstate = to_rcar_crtc_state(crtc->state);
+	struct rcar_du_device *rcdu = rcrtc->group->dev;
 
 	rcar_du_crtc_get(rcrtc);
+
+	/*
+	 * On D3/E3 the dot clock is provided by the LVDS encoder attached to
+	 * the DU channel. We need to enable its clock output explicitly if
+	 * the LVDS output is disabled.
+	 */
+	if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index) &&
+	    rstate->outputs == BIT(RCAR_DU_OUTPUT_DPAD0)) {
+		struct rcar_du_encoder *encoder =
+			rcdu->encoders[RCAR_DU_OUTPUT_LVDS0 + rcrtc->index];
+		const struct drm_display_mode *mode =
+			&crtc->state->adjusted_mode;
+
+		rcar_lvds_clk_enable(encoder->base.bridge,
+				     mode->clock * 1000);
+	}
+
 	rcar_du_crtc_start(rcrtc);
 }
 
@@ -666,10 +686,24 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
 					struct drm_crtc_state *old_state)
 {
 	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+	struct rcar_du_crtc_state *rstate = to_rcar_crtc_state(old_state);
+	struct rcar_du_device *rcdu = rcrtc->group->dev;
 
 	rcar_du_crtc_stop(rcrtc);
 	rcar_du_crtc_put(rcrtc);
 
+	if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index) &&
+	    rstate->outputs == BIT(RCAR_DU_OUTPUT_DPAD0)) {
+		struct rcar_du_encoder *encoder =
+			rcdu->encoders[RCAR_DU_OUTPUT_LVDS0 + rcrtc->index];
+
+		/*
+		 * Disable the LVDS clock output, see
+		 * rcar_du_crtc_atomic_enable().
+		 */
+		rcar_lvds_clk_disable(encoder->base.bridge);
+	}
+
 	spin_lock_irq(&crtc->dev->event_lock);
 	if (crtc->state->event) {
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 6c187d0bf7c2..1327cd0df90a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -22,6 +22,7 @@ struct device;
 struct drm_device;
 struct drm_property;
 struct rcar_du_device;
+struct rcar_du_encoder;
 
 #define RCAR_DU_FEATURE_CRTC_IRQ_CLOCK	BIT(0)	/* Per-CRTC IRQ and clock */
 #define RCAR_DU_FEATURE_VSP1_SOURCE	BIT(1)	/* Has inputs from VSP1 */
@@ -81,6 +82,8 @@ struct rcar_du_device {
 	struct rcar_du_crtc crtcs[RCAR_DU_MAX_CRTCS];
 	unsigned int num_crtcs;
 
+	struct rcar_du_encoder *encoders[RCAR_DU_OUTPUT_MAX];
+
 	struct rcar_du_group groups[RCAR_DU_MAX_GROUPS];
 	struct rcar_du_vsp vsps[RCAR_DU_MAX_VSPS];
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index ba2b38f76b54..13c3c7382514 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -41,6 +41,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	if (renc == NULL)
 		return -ENOMEM;
 
+	rcdu->encoders[output] = renc;
 	renc->output = output;
 	encoder = rcar_encoder_to_drm_encoder(renc);
 
-- 
Regards,

Laurent Pinchart

