Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35920 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750794AbdI1HKp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Sep 2017 03:10:45 -0400
Received: by mail-wm0-f68.google.com with SMTP id r74so383312wme.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Sep 2017 00:10:44 -0700 (PDT)
Date: Thu, 28 Sep 2017 09:10:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: kieran.bingham@ideasonboard.com
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] drm: rcar-du: Reject planes located fully off-screen
Message-ID: <20170928071034.ovxweoxdp3sb3ij2@phenom.ffwll.local>
References: <20170815230338.14913-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170815230338.14913-3-laurent.pinchart+renesas@ideasonboard.com>
 <b2179a21-51aa-e973-73de-fd657ecfedb5@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2179a21-51aa-e973-73de-fd657ecfedb5@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 27, 2017 at 07:58:42PM +0100, Kieran Bingham wrote:
> Hi Laurent,
> 
> Thankyou for the patch,
> 
> This looks good, and passes the tests.
> 
> On 16/08/17 00:03, Laurent Pinchart wrote:
> > There is no point in accepting fully off-screen planes as they won't be
> > displayed. Reject them in the atomic check.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Just a note, this is different from what i915 does. Not sure you want to
intentionally be incompatible with i915 and hence defacto make this part
of atomic undefined (or break some apps, depending upon how this pans
out). I think X loves to put the cursor offscreen at least.

I think we even have igts to test this properly.
-Daniel
> 
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > index 4f076c364f25..714e02960635 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > @@ -569,6 +569,8 @@ int __rcar_du_plane_atomic_check(struct drm_plane *plane,
> >  				 struct drm_plane_state *state,
> >  				 const struct rcar_du_format_info **format)
> >  {
> > +	const struct drm_display_mode *mode;
> > +	struct drm_crtc_state *crtc_state;
> >  	struct drm_device *dev = plane->dev;
> >  
> >  	if (!state->fb || !state->crtc) {
> > @@ -582,6 +584,20 @@ int __rcar_du_plane_atomic_check(struct drm_plane *plane,
> >  		return -EINVAL;
> >  	}
> >  
> > +	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
> > +	if (IS_ERR(crtc_state))
> > +		return PTR_ERR(crtc_state);
> > +
> > +	mode = &crtc_state->adjusted_mode;
> > +	if (state->crtc_x >= mode->hdisplay ||
> > +	    state->crtc_y >= mode->vdisplay ||
> > +	    state->crtc_x + (int)state->crtc_w <= 0 ||
> > +	    state->crtc_y + (int)state->crtc_h <= 0) {
> > +		dev_dbg(dev->dev, "%s: plane can't be fully off-screen\n",
> > +			__func__);
> > +		return -EINVAL;
> > +	}
> > +
> >  	*format = rcar_du_format_info(state->fb->format->format);
> >  	if (*format == NULL) {
> >  		dev_dbg(dev->dev, "%s: unsupported format %08x\n", __func__,
> > 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
