Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6192C10F00
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 11:34:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A163A21872
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 11:34:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nQeZPKLV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbfCOLe3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 07:34:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49002 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727344AbfCOLe3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 07:34:29 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8DE59F1;
        Fri, 15 Mar 2019 12:34:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1552649665;
        bh=PgertdZI5pXdCL1/qjbGNxTQ+IbMEZTHgCyfz1bXHEE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nQeZPKLVvg5hkU8bh9TFUBV2qp+DJVeC9umjvrTOLyY3xyFJsQ2fm+G7xPMZFmXpZ
         APCTbYP745It0eecQMFkzYtYYo8HGfW2f/CNcHFnu+/1uY2FOZP8O4dXA82PhZeUVM
         G5hHtwjWn+pFhhdBY0TE2HW+8i7Jwn68Z/GNBjRQ=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [RFC PATCH 4/5] drm: rcar-du: add group hooks for atomic-commit
Date:   Fri, 15 Mar 2019 11:34:17 +0000
Message-Id: <20190315113418.24452-5-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190315113418.24452-1-kieran.bingham+renesas@ideasonboard.com>
References: <20190315113418.24452-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The group can now be handled independently from the CRTC tracking its
own state.

Introduce an rcar_du_group_atomic_check() call which will iterate the
CRTCs to determine the per-state use-count of the group.

This use count then allows us to determine if the group should be
configured or disabled in our commit tail through the introduction of
two new calls rcar_du_group_atomic_{enter,exit}_standby().

The existing rcar_du_group_{get,put}() functions are now redundant and
removed along with their interactions in the CRTC get/put calls.

The group takes the clock of the first CRTC in the group.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---

I'm already looking to refactor the series and put the CRTC handlng first. This
will mean that the CRTC will power up the group instead, and the 'stealing' of
the CRTC clock (rgrp->clock = rcdu->crtcs[rgrp->index * 2].clock;) can be
removed


 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  |   8 --
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 122 +++++++++++++++++-------
 drivers/gpu/drm/rcar-du/rcar_du_group.h |  16 +++-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c   |  13 +++
 4 files changed, 115 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 471ce464654a..8d35b9e987f1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -518,17 +518,11 @@ static int rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
 	if (ret < 0)
 		goto error_clock;
 
-	ret = rcar_du_group_get(rcrtc->group);
-	if (ret < 0)
-		goto error_group;
-
 	rcar_du_crtc_setup(rcrtc);
 	rcrtc->initialized = true;
 
 	return 0;
 
-error_group:
-	clk_disable_unprepare(rcrtc->extclock);
 error_clock:
 	clk_disable_unprepare(rcrtc->clock);
 	return ret;
@@ -536,8 +530,6 @@ static int rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
 
 static void rcar_du_crtc_put(struct rcar_du_crtc *rcrtc)
 {
-	rcar_du_group_put(rcrtc->group);
-
 	clk_disable_unprepare(rcrtc->extclock);
 	clk_disable_unprepare(rcrtc->clock);
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index 9c82d666f170..c31b968c1134 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -24,6 +24,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/err.h>
 #include <linux/io.h>
 
 #include <drm/drm_atomic.h>
@@ -172,38 +173,6 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 	mutex_unlock(&rgrp->lock);
 }
 
-/*
- * rcar_du_group_get - Acquire a reference to the DU channels group
- *
- * Acquiring the first reference setups core registers. A reference must be held
- * before accessing any hardware registers.
- *
- * This function must be called with the DRM mode_config lock held.
- *
- * Return 0 in case of success or a negative error code otherwise.
- */
-int rcar_du_group_get(struct rcar_du_group *rgrp)
-{
-	if (rgrp->use_count)
-		goto done;
-
-	rcar_du_group_setup(rgrp);
-
-done:
-	rgrp->use_count++;
-	return 0;
-}
-
-/*
- * rcar_du_group_put - Release a reference to the DU
- *
- * This function must be called with the DRM mode_config lock held.
- */
-void rcar_du_group_put(struct rcar_du_group *rgrp)
-{
-	--rgrp->use_count;
-}
-
 static void __rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start)
 {
 	struct rcar_du_device *rcdu = rgrp->dev;
@@ -384,6 +353,95 @@ static const struct drm_private_state_funcs rcar_du_group_state_funcs = {
 	.atomic_destroy_state = rcar_du_group_atomic_destroy_state,
 };
 
+#define for_each_oldnew_group_in_state(__state, __obj, __old_state, __new_state, __i) \
+	for_each_oldnew_private_obj_in_state((__state), (__obj), (__old_state), (__new_state), (__i)) \
+		for_each_if((__obj)->funcs == &rcar_du_group_state_funcs)
+
+static struct rcar_du_group_state *
+rcar_du_get_group_state(struct drm_atomic_state *state,
+			struct rcar_du_group *rgrp)
+{
+	struct drm_private_state *pstate;
+
+	pstate = drm_atomic_get_private_obj_state(state, &rgrp->private);
+	if (IS_ERR(pstate))
+		return ERR_CAST(pstate);
+
+	return to_rcar_group_state(pstate);
+}
+
+int rcar_du_group_atomic_check(struct drm_device *dev,
+			       struct drm_atomic_state *state)
+{
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *crtc_state;
+	unsigned int i;
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+		struct rcar_du_group_state *rstate;
+
+		if (crtc_state->active_changed || crtc_state->mode_changed) {
+			rstate = rcar_du_get_group_state(state, rcrtc->group);
+			if (IS_ERR(rstate))
+				return PTR_ERR(rstate);
+
+			if (crtc_state->active)
+				rstate->use_count++;
+		}
+	}
+
+	return 0;
+}
+
+int rcar_du_group_atomic_exit_standby(struct drm_device *dev,
+				      struct drm_atomic_state *state)
+{
+	struct drm_private_state *old_pstate, *new_pstate;
+	struct drm_private_obj *obj;
+	unsigned int i;
+	int ret;
+
+	for_each_oldnew_group_in_state(state, obj, old_pstate, new_pstate, i) {
+		struct rcar_du_group *rgrp = to_rcar_group(obj);
+		struct rcar_du_group_state *old_state, *new_state;
+
+		old_state = to_rcar_group_state(old_pstate);
+		new_state = to_rcar_group_state(new_pstate);
+
+		if (!old_state->use_count && new_state->use_count) {
+			ret = clk_prepare_enable(rgrp->clock);
+			if (ret < 0)
+				return ret;
+
+			rcar_du_group_setup(rgrp);
+		}
+	}
+
+	return 0;
+}
+
+int rcar_du_group_atomic_enter_standby(struct drm_device *dev,
+				       struct drm_atomic_state *state)
+{
+	struct drm_private_state *old_pstate, *new_pstate;
+	struct drm_private_obj *obj;
+	unsigned int i;
+
+	for_each_oldnew_group_in_state(state, obj, old_pstate, new_pstate, i) {
+		struct rcar_du_group *rgrp = to_rcar_group(obj);
+		struct rcar_du_group_state *old_state, *new_state;
+
+		old_state = to_rcar_group_state(old_pstate);
+		new_state = to_rcar_group_state(new_pstate);
+
+		if (old_state->use_count && !new_state->use_count)
+			clk_disable_unprepare(rgrp->clock);
+	}
+
+	return 0;
+}
+
 /*
  * rcar_du_group_init - Initialise and reset a group object
  *
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.h b/drivers/gpu/drm/rcar-du/rcar_du_group.h
index 4b812e167987..d0312e65ee9c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.h
@@ -22,11 +22,11 @@ struct rcar_du_device;
  * struct rcar_du_group - CRTCs and planes group
  * @private: The base drm private object
  * @dev: the DU device
+ * @clock: the group functional clock
  * @mmio_offset: registers offset in the device memory map
  * @index: group index
  * @channels_mask: bitmask of populated DU channels in this group
  * @num_crtcs: number of CRTCs in this group (1 or 2)
- * @use_count: number of users of the group (rcar_du_group_(get|put))
  * @used_crtcs: number of CRTCs currently in use
  * @lock: protects the dptsr_planes field and the DPTSR register
  * @dptsr_planes: bitmask of planes driven by dot-clock and timing generator 1
@@ -38,12 +38,12 @@ struct rcar_du_group {
 	struct drm_private_obj private;
 
 	struct rcar_du_device *dev;
+	struct clk *clock;
 	unsigned int mmio_offset;
 	unsigned int index;
 
 	unsigned int channels_mask;
 	unsigned int num_crtcs;
-	unsigned int use_count;
 	unsigned int used_crtcs;
 
 	struct mutex lock;
@@ -59,9 +59,12 @@ struct rcar_du_group {
 /**
  * struct rcar_du_group_state - Driver-specific group state
  * @state: base DRM private state
+ * @use_count: number of users of the group
  */
 struct rcar_du_group_state {
 	struct drm_private_state state;
+
+	unsigned int use_count;
 };
 
 #define to_rcar_group_state(s) \
@@ -70,14 +73,19 @@ struct rcar_du_group_state {
 u32 rcar_du_group_read(struct rcar_du_group *rgrp, u32 reg);
 void rcar_du_group_write(struct rcar_du_group *rgrp, u32 reg, u32 data);
 
-int rcar_du_group_get(struct rcar_du_group *rgrp);
-void rcar_du_group_put(struct rcar_du_group *rgrp);
 void rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start);
 void rcar_du_group_restart(struct rcar_du_group *rgrp);
 int rcar_du_group_set_routing(struct rcar_du_group *rgrp);
 
 int rcar_du_set_dpad0_vsp1_routing(struct rcar_du_device *rcdu);
 
+int rcar_du_group_atomic_check(struct drm_device *dev,
+			       struct drm_atomic_state *state);
+int rcar_du_group_atomic_exit_standby(struct drm_device *dev,
+				      struct drm_atomic_state *state);
+int rcar_du_group_atomic_enter_standby(struct drm_device *dev,
+				       struct drm_atomic_state *state);
+
 int rcar_du_group_init(struct rcar_du_device *rcdu, struct rcar_du_group *rgrp,
 		       unsigned int index);
 void rcar_du_group_cleanup(struct rcar_du_group *rgrp);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 6066e10e80ff..9896036d879b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -271,6 +271,10 @@ static int rcar_du_atomic_check(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	ret = rcar_du_group_atomic_check(dev, state);
+	if (ret)
+		return ret;
+
 	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE))
 		return 0;
 
@@ -304,11 +308,16 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 	}
 
 	/* Apply the atomic update. */
+
+	rcar_du_group_atomic_exit_standby(dev, old_state);
+
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
 	drm_atomic_helper_commit_planes(dev, old_state,
 					DRM_PLANE_COMMIT_ACTIVE_ONLY);
 	drm_atomic_helper_commit_modeset_enables(dev, old_state);
 
+	rcar_du_group_atomic_enter_standby(dev, old_state);
+
 	drm_atomic_helper_commit_hw_done(old_state);
 	drm_atomic_helper_wait_for_flip_done(dev, old_state);
 
@@ -588,6 +597,10 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 			return ret;
 	}
 
+	/* The Group clock is taken from the first CRTC clock in the group. */
+	for_each_rcdu_group(rcdu, rgrp, i)
+		rgrp->clock = rcdu->crtcs[rgrp->index * 2].clock;
+
 	/* Initialize the encoders. */
 	ret = rcar_du_encoders_init(rcdu);
 	if (ret < 0)
-- 
2.19.1

