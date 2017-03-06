Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:35189 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932196AbdCFPKl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2017 10:10:41 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2] drm: rcar-du: Arm the page flip event after queuing the page flip
Date: Mon, 06 Mar 2017 17:11:17 +0200
Message-ID: <1783628.YCkISaBNKo@avalon>
In-Reply-To: <20170306150200.wpl3ya6kcybgtpij@phenom.ffwll.local>
References: <20170305011032.32747-1-laurent.pinchart+renesas@ideasonboard.com> <20170306150200.wpl3ya6kcybgtpij@phenom.ffwll.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Daniel,

On Monday 06 Mar 2017 16:02:00 Daniel Vetter wrote:
> On Sun, Mar 05, 2017 at 03:10:32AM +0200, Laurent Pinchart wrote:
> > The page flip event is armed in the atomic begin handler, creating a
> > race condition with the frame end interrupt that could send the event
> > before the atomic operation actually completes. To avoid that, arm the
> > event in the atomic flush handler after queuing the page flip.
> > 
> > This change doesn't fully close the race window, as the frame end
> > interrupt could be generated before the page flip is committed to
> > hardware but only handled after the event is armed. However, the race
> > window is now much smaller.
> > 
> > The event must however be armed before calling the VSP atomic commit
> > function, otherwise the completion callback could arrive before we arm
> > the event, resulting in a deadlock.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> 
> Since your hw is not the only one where this seems fundamentally
> unfixable, should we document a recommended way to handle/minize the race
> window?

Sure, that's a good idea.

I think it boils down to one of those two options:

- If the device can notify of page flip completion, the event should be armed 
just before the page flip is committed. At the hardware level this can be as 
simple as an interrupt that will only be fired when a queued page flip is 
processed (and not at every vblank), or a combination of a GO bit with vblank 
(which then requires a more complex dance). The R-Car Gen3 hardware falls in 
this category, the external VSP compositor that handles planes has a GO bit 
and a vblank-like interrupt.

- If the device can't notify of page flip completion, the event should be 
armed just after the page flip is committed. In the worst case the driver will 
send the event to userspace one frame too late. This doesn't allow for a real 
atomic update, but it should avoid tearing. The R-Car Gen2 hardware falls in 
this category.

Feel free to turn this into a kerneldoc patch :-)

> > ---
> > 
> >  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 22 +++++++++++-----------
> >  1 file changed, 11 insertions(+), 11 deletions(-)
> > 
> > Changes since v1:
> > 
> > - Arm the event before calling the VSP atomic commit function
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c index 7391dd95c733..2aceb84fc15d
> > 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > @@ -502,17 +502,6 @@ static void rcar_du_crtc_atomic_begin(struct drm_crtc
> > *crtc,> 
> >  				      struct drm_crtc_state *old_crtc_state)
> >  
> >  {
> >  
> >  	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> > 
> > -	struct drm_device *dev = rcrtc->crtc.dev;
> > -	unsigned long flags;
> > -
> > -	if (crtc->state->event) {
> > -		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
> > -
> > -		spin_lock_irqsave(&dev->event_lock, flags);
> > -		rcrtc->event = crtc->state->event;
> > -		crtc->state->event = NULL;
> > -		spin_unlock_irqrestore(&dev->event_lock, flags);
> > -	}
> > 
> >  	if (rcar_du_has(rcrtc->group->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
> >  	
> >  		rcar_du_vsp_atomic_begin(rcrtc);
> > 
> > @@ -522,9 +511,20 @@ static void rcar_du_crtc_atomic_flush(struct drm_crtc
> > *crtc,> 
> >  				      struct drm_crtc_state *old_crtc_state)
> >  
> >  {
> >  
> >  	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> > 
> > +	struct drm_device *dev = rcrtc->crtc.dev;
> > +	unsigned long flags;
> > 
> >  	rcar_du_crtc_update_planes(rcrtc);
> > 
> > +	if (crtc->state->event) {
> > +		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
> > +
> > +		spin_lock_irqsave(&dev->event_lock, flags);
> > +		rcrtc->event = crtc->state->event;
> > +		crtc->state->event = NULL;
> > +		spin_unlock_irqrestore(&dev->event_lock, flags);
> > +	}
> > +
> > 
> >  	if (rcar_du_has(rcrtc->group->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
> >  	
> >  		rcar_du_vsp_atomic_flush(rcrtc);
> >  
> >  }

-- 
Regards,

Laurent Pinchart
