Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C92C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 11:34:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6AF7A21871
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 11:34:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wEbG/H2J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727397AbfCOLe3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 07:34:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49012 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727378AbfCOLe3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 07:34:29 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4070D9F9;
        Fri, 15 Mar 2019 12:34:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1552649665;
        bh=yP1ZUQTP+jAu5s4SQ6FOyOjEMTrX4JlLCHM87bgatX8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wEbG/H2JhShmS2OfSEMQeFctCuh4cQc5lI+BvAmxfZGhIo73qG5sKokectIKu1p/m
         YN1HYNjqtVxaQIa0D+/ywOA3CY16ab8XlzZTRAunvwVmCSd0REpIe7H2t1/ui/HTSf
         yFwr032hEfOMiXbAO/VhiHWlkvoeDuorWhoyPClU=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [RFC PATCH 5/5] drm: rcar-du: Add crtc standby helpers
Date:   Fri, 15 Mar 2019 11:34:18 +0000
Message-Id: <20190315113418.24452-6-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190315113418.24452-1-kieran.bingham+renesas@ideasonboard.com>
References: <20190315113418.24452-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Provide helpers to manage the power state, and initial configuration of
the CRTC to match the group implementation.

rcar_du_crtc_get() and rcar_du_crtc_get() are no longer used, and are
removed, simplifying the implementation and removing the initialized
flag which was needed to track the state of the CRTC.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 94 ++++++++++++++------------
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h |  7 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c  |  2 +
 3 files changed, 57 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 8d35b9e987f1..f3145c24070d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -478,8 +478,18 @@ static void rcar_du_crtc_wait_page_flip(struct rcar_du_crtc *rcrtc)
  * Start/Stop and Suspend/Resume
  */
 
-static void rcar_du_crtc_setup(struct rcar_du_crtc *rcrtc)
+static int rcar_du_crtc_enable(struct rcar_du_crtc *rcrtc)
 {
+	int ret;
+
+	ret = clk_prepare_enable(rcrtc->clock);
+	if (ret < 0)
+		return ret;
+
+	ret = clk_prepare_enable(rcrtc->extclock);
+	if (ret < 0)
+		goto error_clock;
+
 	/* Set display off and background to black */
 	rcar_du_crtc_write(rcrtc, DOOR, DOOR_RGB(0, 0, 0));
 	rcar_du_crtc_write(rcrtc, BPOR, BPOR_RGB(0, 0, 0));
@@ -497,29 +507,6 @@ static void rcar_du_crtc_setup(struct rcar_du_crtc *rcrtc)
 
 	/* Turn vertical blanking interrupt reporting on. */
 	drm_crtc_vblank_on(&rcrtc->crtc);
-}
-
-static int rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
-{
-	int ret;
-
-	/*
-	 * Guard against double-get, as the function is called from both the
-	 * .atomic_enable() and .atomic_begin() handlers.
-	 */
-	if (rcrtc->initialized)
-		return 0;
-
-	ret = clk_prepare_enable(rcrtc->clock);
-	if (ret < 0)
-		return ret;
-
-	ret = clk_prepare_enable(rcrtc->extclock);
-	if (ret < 0)
-		goto error_clock;
-
-	rcar_du_crtc_setup(rcrtc);
-	rcrtc->initialized = true;
 
 	return 0;
 
@@ -528,12 +515,10 @@ static int rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
 	return ret;
 }
 
-static void rcar_du_crtc_put(struct rcar_du_crtc *rcrtc)
+static void rcar_du_crtc_disable(struct rcar_du_crtc *rcrtc)
 {
 	clk_disable_unprepare(rcrtc->extclock);
 	clk_disable_unprepare(rcrtc->clock);
-
-	rcrtc->initialized = false;
 }
 
 static void rcar_du_crtc_start(struct rcar_du_crtc *rcrtc)
@@ -629,6 +614,44 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
  * CRTC Functions
  */
 
+int rcar_du_crtc_atomic_exit_standby(struct drm_device *dev,
+				     struct drm_atomic_state *state)
+{
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *crtc_state;
+	unsigned int i;
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+
+		if (crtc_state->active_changed && crtc_state->active) {
+			int ret = rcar_du_crtc_enable(rcrtc);
+
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+int rcar_du_crtc_atomic_enter_standby(struct drm_device *dev,
+				      struct drm_atomic_state *state)
+{
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *crtc_state;
+	unsigned int i;
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+
+		if (crtc_state->active_changed && !crtc_state->active)
+			rcar_du_crtc_disable(rcrtc);
+	}
+
+	return 0;
+}
+
 static int rcar_du_crtc_atomic_check(struct drm_crtc *crtc,
 				     struct drm_crtc_state *state)
 {
@@ -654,8 +677,6 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct rcar_du_crtc_state *rstate = to_rcar_crtc_state(crtc->state);
 	struct rcar_du_device *rcdu = rcrtc->dev;
 
-	rcar_du_crtc_get(rcrtc);
-
 	/*
 	 * On D3/E3 the dot clock is provided by the LVDS encoder attached to
 	 * the DU channel. We need to enable its clock output explicitly if
@@ -683,7 +704,6 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
 	struct rcar_du_device *rcdu = rcrtc->dev;
 
 	rcar_du_crtc_stop(rcrtc);
-	rcar_du_crtc_put(rcrtc);
 
 	if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index) &&
 	    rstate->outputs == BIT(RCAR_DU_OUTPUT_DPAD0)) {
@@ -712,20 +732,6 @@ static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
 
 	WARN_ON(!crtc->state->enable);
 
-	/*
-	 * If a mode set is in progress we can be called with the CRTC disabled.
-	 * We thus need to first get and setup the CRTC in order to configure
-	 * planes. We must *not* put the CRTC in .atomic_flush(), as it must be
-	 * kept awake until the .atomic_enable() call that will follow. The get
-	 * operation in .atomic_enable() will in that case be a no-op, and the
-	 * CRTC will be put later in .atomic_disable().
-	 *
-	 * If a mode set is not in progress the CRTC is enabled, and the
-	 * following get call will be a no-op. There is thus no need to balance
-	 * it in .atomic_flush() either.
-	 */
-	rcar_du_crtc_get(rcrtc);
-
 	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
 		rcar_du_vsp_atomic_begin(rcrtc);
 }
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 11814eafef77..d12d4a788e9f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -29,7 +29,6 @@ struct rcar_du_vsp;
  * @extclock: external pixel dot clock (optional)
  * @mmio_offset: offset of the CRTC registers in the DU MMIO block
  * @index: CRTC software and hardware index
- * @initialized: whether the CRTC has been initialized and clocks enabled
  * @dsysr: cached value of the DSYSR register
  * @vblank_enable: whether vblank events are enabled on this CRTC
  * @event: event to post when the pending page flip completes
@@ -49,7 +48,6 @@ struct rcar_du_crtc {
 	struct clk *extclock;
 	unsigned int mmio_offset;
 	unsigned int index;
-	bool initialized;
 
 	u32 dsysr;
 
@@ -102,6 +100,11 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 
 void rcar_du_crtc_finish_page_flip(struct rcar_du_crtc *rcrtc);
 
+int rcar_du_crtc_atomic_exit_standby(struct drm_device *dev,
+				     struct drm_atomic_state *state);
+int rcar_du_crtc_atomic_enter_standby(struct drm_device *dev,
+				      struct drm_atomic_state *state);
+
 void rcar_du_crtc_dsysr_clr_set(struct rcar_du_crtc *rcrtc, u32 clr, u32 set);
 
 #endif /* __RCAR_DU_CRTC_H__ */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 9896036d879b..cb79eb7ba0f1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -310,12 +310,14 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 	/* Apply the atomic update. */
 
 	rcar_du_group_atomic_exit_standby(dev, old_state);
+	rcar_du_crtc_atomic_exit_standby(dev, old_state);
 
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
 	drm_atomic_helper_commit_planes(dev, old_state,
 					DRM_PLANE_COMMIT_ACTIVE_ONLY);
 	drm_atomic_helper_commit_modeset_enables(dev, old_state);
 
+	rcar_du_crtc_atomic_enter_standby(dev, old_state);
 	rcar_du_group_atomic_enter_standby(dev, old_state);
 
 	drm_atomic_helper_commit_hw_done(old_state);
-- 
2.19.1

