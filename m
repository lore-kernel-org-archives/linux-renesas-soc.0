Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39352 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751350AbdGNAan (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2017 20:30:43 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: kieran.bingham@ideasonboard.com
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: Setup planes before enabling CRTC to avoid flicker
Date: Fri, 14 Jul 2017 03:30:45 +0300
Message-ID: <1925845.hJTmtBTYaG@avalon>
In-Reply-To: <9120be80-cefe-e52a-e512-15145ded1e82@ideasonboard.com>
References: <20170628185055.16379-1-laurent.pinchart+renesas@ideasonboard.com> <9120be80-cefe-e52a-e512-15145ded1e82@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Wednesday 12 Jul 2017 17:35:53 Kieran Bingham wrote:
> On 28/06/17 19:50, Laurent Pinchart wrote:
> > Commit 52055bafa1ff ("drm: rcar-du: Move plane commit code from CRTC
> > start to CRTC resume") changed the order of the plane commit and CRTC
> > enable operations to accommodate the runtime PM requirements. However,
> > this introduced corruption in the first displayed frame, as the CRTC is
> > now enabled without any plane configured. On Gen2 hardware the first
> > frame will be black and likely unnoticed, but on Gen3 hardware we end up
> > starting the display before the VSP compositor, which is more
> > noticeable.
> > 
> > To fix this, revert the order of the commit operations back, and handle
> > runtime PM requirements in the CRTC .atomic_begin() and .atomic_enable()
> > helper operation handlers.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> 
> I only have code reduction or comment suggestions below - so either with or
> without those changes, feel free to add my:
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> > ---
> > 
> >  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 66 +++++++++++++++++------------
> >  drivers/gpu/drm/rcar-du/rcar_du_crtc.h |  4 +--
> >  drivers/gpu/drm/rcar-du/rcar_du_kms.c  |  2 +-
> >  3 files changed, 43 insertions(+), 29 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c index 6b5219ef0ad2..76cdb88b2b8e
> > 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c

[snip]

> > @@ -467,6 +461,18 @@ static void rcar_du_crtc_start(struct rcar_du_crtc
> > *rcrtc)
> >  	/* Start with all planes disabled. */
> >  	rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? DS2PR : DS1PR, 0);
> > 
> > +	/* Enable the VSP compositor. */
> > +	if (rcar_du_has(rcrtc->group->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
> > +		rcar_du_vsp_enable(rcrtc);
> > +
> > +	/* Turn vertical blanking interrupt reporting on. */
> > +	drm_crtc_vblank_on(&rcrtc->crtc);
> > +}
> > +
> > +static void rcar_du_crtc_start(struct rcar_du_crtc *rcrtc)
> > +{
> > +	bool interlaced;
> > +
> >  	/* Select master sync mode. This enables display operation in master
> 
> Are we close enough here to fix this multiline comment style ?
> (Not worth doing unless the patch is respun for other reasons ...)
> 
> Actually - there are a lot in this file, so it would be better to do them
> all in one hit/patch at a point of least conflicts ...

Done :-) I actually had such a patch in my tree before receiving your comment.

> >  	 * sync mode (with the HSYNC and VSYNC signals configured as outputs and
> >  	 * actively driven).

[snip]

> > @@ -546,12 +538,10 @@ void rcar_du_crtc_resume(struct rcar_du_crtc *rcrtc)
> >  		return;
> >  	
> >  	rcar_du_crtc_get(rcrtc);
> > -	rcar_du_crtc_start(rcrtc);
> > +	rcar_du_crtc_setup(rcrtc);
> 
> Every call to _setup is immediately prefixed by a call to _get()
> 
> Could the _get() be done in the _setup() for code reduction?
> 
> I'm entirely open to that not happening here as it might be preferred to
> keep the _get() and _start() separate for style purposes.

Please see below.

> >  	/* Commit the planes state. */
> > -	if (rcar_du_has(rcrtc->group->dev, RCAR_DU_FEATURE_VSP1_SOURCE)) {
> > -		rcar_du_vsp_enable(rcrtc);
> > -	} else {
> > +	if (!rcar_du_has(rcrtc->group->dev, RCAR_DU_FEATURE_VSP1_SOURCE)) {
> >  		for (i = 0; i < rcrtc->group->num_planes; ++i) {
> >  			struct rcar_du_plane *plane = &rcrtc->group->planes[i];
> > 

[snip]

> > @@ -601,6 +602,19 @@ static void rcar_du_crtc_atomic_begin(struct drm_crtc
> > *crtc,
> >  {
> >  	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> > 
> > +	WARN_ON(!crtc->state->enable);
> 
> Is this necessary if it's handled by the rcrtc->initialized flag? or is it
> so that we find out if it happens ?
> 
> (Or is this due to the re-ordering of the _commit_tail() function below?)

It's to find out whether it happens. Before this patch the plane update
occurred after enabling the CRTC (through
drm_atomic_helper_commit_modeset_enables()). With this patch the CRTC can be
disabled at the hardware level, but only if it will be enabled right after
plane update. The state->enable flag should thus always be true, and I added
a WARN_ON to ensure that. I'd like to keep it a bit, we can remove it after
running more tests.

> > +
> > +	/*
> > +	 * If a mode set is in progress we can be called with the CRTC disabled.
> > +	 * We then need to first setup the CRTC in order to configure planes.
> > +	 * The .atomic_enable() handler will notice and skip the CRTC setup.
> > +	 */
> 
> I'm assuming this comment is the reason for the WARN_ON above ...
> 
> > +	if (!rcrtc->initialized) {
> > +		rcar_du_crtc_get(rcrtc);
> > +		rcar_du_crtc_setup(rcrtc);
> > +		rcrtc->initialized = true;
> > +	}
> 
> If the _get() was moved into the _setup(), and _setup() was protected by the
> rcrtc->initialized flag, then _atomic_begin() _enable() and _resume() could
> all just simply call _setup(). The _resume() should only ever be called
> with rcrtc->initialized = false anyway, as that is set in _suspend()

I think that makes sense, but I wonder whether it would make sense to address
that when fixing the currently broken suspend/resume code, as I expect the
get/setup/start sequence to be reworked then.

To help you decide, here's what we would merge now on top of this patch if we
don't wait.

-------------------------------------- 8< ------------------------------------commit 4e43b3a5400e40e8ef7ecc50640a2ca77fb8effa
Author: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Date:   Fri Jul 14 03:26:17 2017 +0300

    drm: rcar-du: Perform the initial CRTC setup from rcar_du_crtc_get()
    
    The rcar_du_crtc_get() function is always immediately followed by a call
    to rcar_du_crtc_setup(). Call the later from the former to simplify the
    code, and add a comment to explain how the get and put calls are
    balanced.
    
    Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 98cf446391dc..e29d8d494720 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -70,39 +70,6 @@ static void rcar_du_crtc_clr_set(struct rcar_du_crtc *rcrtc, u32 reg,
 	rcar_du_write(rcdu, rcrtc->mmio_offset + reg, (value & ~clr) | set);
 }
 
-static int rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
-{
-	int ret;
-
-	ret = clk_prepare_enable(rcrtc->clock);
-	if (ret < 0)
-		return ret;
-
-	ret = clk_prepare_enable(rcrtc->extclock);
-	if (ret < 0)
-		goto error_clock;
-
-	ret = rcar_du_group_get(rcrtc->group);
-	if (ret < 0)
-		goto error_group;
-
-	return 0;
-
-error_group:
-	clk_disable_unprepare(rcrtc->extclock);
-error_clock:
-	clk_disable_unprepare(rcrtc->clock);
-	return ret;
-}
-
-static void rcar_du_crtc_put(struct rcar_du_crtc *rcrtc)
-{
-	rcar_du_group_put(rcrtc->group);
-
-	clk_disable_unprepare(rcrtc->extclock);
-	clk_disable_unprepare(rcrtc->clock);
-}
-
 /* -----------------------------------------------------------------------------
  * Hardware Setup
  */
@@ -473,6 +440,49 @@ static void rcar_du_crtc_setup(struct rcar_du_crtc *rcrtc)
 	drm_crtc_vblank_on(&rcrtc->crtc);
 }
 
+static int rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
+{
+	int ret;
+
+	/*
+	 * Guard against double-get, as the function is called from both the
+	 * .atomic_enable() and .atomic_begin() handlers.
+	 */
+	if (rcrtc->initialized)
+		return 0;
+
+	ret = clk_prepare_enable(rcrtc->clock);
+	if (ret < 0)
+		return ret;
+
+	ret = clk_prepare_enable(rcrtc->extclock);
+	if (ret < 0)
+		goto error_clock;
+
+	ret = rcar_du_group_get(rcrtc->group);
+	if (ret < 0)
+		goto error_group;
+
+	rcar_du_crtc_setup(rcrtc);
+	rcrtc->initialized = true;
+
+	return 0;
+
+error_group:
+	clk_disable_unprepare(rcrtc->extclock);
+error_clock:
+	clk_disable_unprepare(rcrtc->clock);
+	return ret;
+}
+
+static void rcar_du_crtc_put(struct rcar_du_crtc *rcrtc)
+{
+	rcar_du_group_put(rcrtc->group);
+
+	clk_disable_unprepare(rcrtc->extclock);
+	clk_disable_unprepare(rcrtc->clock);
+}
+
 static void rcar_du_crtc_start(struct rcar_du_crtc *rcrtc)
 {
 	bool interlaced;
@@ -546,7 +556,6 @@ void rcar_du_crtc_resume(struct rcar_du_crtc *rcrtc)
 		return;
 
 	rcar_du_crtc_get(rcrtc);
-	rcar_du_crtc_setup(rcrtc);
 
 	/* Commit the planes state. */
 	if (!rcar_du_has(rcrtc->group->dev, RCAR_DU_FEATURE_VSP1_SOURCE)) {
@@ -573,16 +582,7 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
 
-	/*
-	 * If the CRTC has already been setup by the .atomic_begin() handler we
-	 * can skip the setup stage.
-	 */
-	if (!rcrtc->initialized) {
-		rcar_du_crtc_get(rcrtc);
-		rcar_du_crtc_setup(rcrtc);
-		rcrtc->initialized = true;
-	}
-
+	rcar_du_crtc_get(rcrtc);
 	rcar_du_crtc_start(rcrtc);
 }
 
@@ -614,14 +614,17 @@ static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
 
 	/*
 	 * If a mode set is in progress we can be called with the CRTC disabled.
-	 * We then need to first setup the CRTC in order to configure planes.
-	 * The .atomic_enable() handler will notice and skip the CRTC setup.
+	 * We thus need to first get and setup the CRTC in order to configure
+	 * planes. We must *not* put the CRTC in .atomic_flush(), as it must be
+	 * kept awake until the .atomic_enable() call that will follow. The get
+	 * operation in .atomic_enable() will in that case be a no-op, and the
+	 * CRTC will be put later in .atomic_disable().
+	 *
+	 * If a mode set is not in progress the CRTC is enabled, and the
+	 * following get call will be a no-op. There is thus no need to belance
+	 * it in .atomic_flush() either.
 	 */
-	if (!rcrtc->initialized) {
-		rcar_du_crtc_get(rcrtc);
-		rcar_du_crtc_setup(rcrtc);
-		rcrtc->initialized = true;
-	}
+	rcar_du_crtc_get(rcrtc);
 
 	if (rcar_du_has(rcrtc->group->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
 		rcar_du_vsp_atomic_begin(rcrtc);
-------------------------------------- 8< ------------------------------------

> > +
> >  	if (rcar_du_has(rcrtc->group->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
> >  		rcar_du_vsp_atomic_begin(rcrtc);
> >  }

[snip]

> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_kms.c index 82b978a5dae6..c2f382feca07
> > 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > @@ -255,9 +255,9 @@ static void rcar_du_atomic_commit_tail(struct
> > drm_atomic_state *old_state)
> > 
> >  	/* Apply the atomic update. */
> >  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> > -	drm_atomic_helper_commit_modeset_enables(dev, old_state);
> >  	drm_atomic_helper_commit_planes(dev, old_state,
> >  					DRM_PLANE_COMMIT_ACTIVE_ONLY);
> 
> Except for DRM_PLANE_COMMIT_ACTIVE_ONLY, this function now looks very much
> like the default drm_atomic_helper_commit_tail() code.
> 
> Reading around other uses /variants of commit_tail() style functions in
> other drivers has left me confused as to how the ordering affects things
> here.
> 
> Could be worth adding a comment at least to describe why we can't use the
> default helper...

The first reason, as you mentioned, is DRM_PLANE_COMMIT_ACTIVE_ONLY, as we
don't need to receive plane updates for disabled CRTCs.

The second reason is patch "[PATCH] drm: rcar-du: Wait for flip completion
instead of vblank in  commit tail" that I have just submitted, which replaces
the drm_atomic_helper_wait_for_vblanks() call with
drm_atomic_helper_wait_flip_done(). I can add a comment to that patch if you
think that would be helpful.

> > +	drm_atomic_helper_commit_modeset_enables(dev, old_state);
> > 
> >   	drm_atomic_helper_commit_hw_done(old_state);
> >  	drm_atomic_helper_wait_for_vblanks(dev, old_state);

-- 
Regards,

Laurent Pinchart
