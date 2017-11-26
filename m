Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:59537 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751733AbdKZLSp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 26 Nov 2017 06:18:45 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 2/2] drm: rcar-du: Clip planes to screen boundaries
Date: Sun, 26 Nov 2017 13:18:46 +0200
Message-ID: <3602648.r47gg9TK3D@avalon>
In-Reply-To: <20171116170426.GA10981@intel.com>
References: <20171113084700.12076-1-laurent.pinchart+renesas@ideasonboard.com> <20171113084700.12076-3-laurent.pinchart+renesas@ideasonboard.com> <20171116170426.GA10981@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ville,

On Thursday, 16 November 2017 19:04:26 EET Ville Syrj=E4l=E4 wrote:
> On Mon, Nov 13, 2017 at 10:47:00AM +0200, Laurent Pinchart wrote:
> > Unlike the KMS API, the hardware doesn't support planes exceeding the
> > screen boundaries or planes being located fully off-screen. We need to
> > clip plane coordinates to support the use case.
> >=20
> > Fortunately the DRM core offers the drm_plane_helper_check_state()
> > helper that valides the scaling factor and clips the plane coordinates.
> > Use it to implement the plane atomic check and use the clipped source
> > and destination rectangles from the plane state instead of the unclipped
> > source and CRTC coordinates to configure the device.
> >=20
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >=20
> >  drivers/gpu/drm/rcar-du/rcar_du_crtc.c  |  3 ++-
> >  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 37 +++++++++++++++++++++----=
=2D--
> >  drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 10 ++++++---
> >  3 files changed, 39 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c index b492063a6e1f..5685d5af69=
98
> > 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > @@ -319,7 +319,8 @@ static void rcar_du_crtc_update_planes(struct
> > rcar_du_crtc *rcrtc)>=20
> >  		struct rcar_du_plane *plane =3D &rcrtc->group->planes[i];
> >  		unsigned int j;
> >=20
> > -		if (plane->plane.state->crtc !=3D &rcrtc->crtc)
> > +		if (plane->plane.state->crtc !=3D &rcrtc->crtc ||
> > +		    !plane->plane.state->visible)
> >=20
> >  			continue;
> >  	=09
> >  		/* Insert the plane in the sorted planes array. */
> >=20
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_plane.c index
> > 4f076c364f25..9cf02b44902d 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > @@ -570,16 +570,39 @@ int __rcar_du_plane_atomic_check(struct drm_plane
> > *plane,
> >  				 const struct rcar_du_format_info **format)
> >  {
> >  	struct drm_device *dev =3D plane->dev;
> > +	struct drm_crtc_state *crtc_state;
> > +	struct drm_rect clip;
> > +	int ret;
> >=20
> > -	if (!state->fb || !state->crtc) {
> > +	if (!state->crtc) {
> > +		/*
> > +		 * The visible field is not reset by the DRM core but only
> > +		 * updated by drm_plane_helper_check_state(), set it manually.
> > +		 */
> > +		state->visible =3D false;
> >  		*format =3D NULL;
> >  		return 0;
> > -	}
> > +	};
>=20
> spurious ;

Oops, my bad, I'll fix that.

> > -	if (state->src_w >> 16 !=3D state->crtc_w ||
> > -	    state->src_h >> 16 !=3D state->crtc_h) {
> > -		dev_dbg(dev->dev, "%s: scaling not supported\n", __func__);
> > -		return -EINVAL;
> > +	crtc_state =3D drm_atomic_get_crtc_state(state->state, state->crtc);
> > +	if (IS_ERR(crtc_state))
> > +		return PTR_ERR(crtc_state);
> > +
> > +	clip.x1 =3D 0;
> > +	clip.y1 =3D 0;
> > +	clip.x2 =3D crtc_state->adjusted_mode.hdisplay;
> > +	clip.y2 =3D crtc_state->adjusted_mode.vdisplay;
>=20
> crtc_state->mode would be more correct. I messed that up too in my
> recent vmwgfx fix [1]. But this should probably work just as well
> if you don't have a crtc scaler in your pipeline.

Indeed, my CRTC can't scale, so this works, but I'll fix it nonetheless.

> Also you may want to leave the clip empty when !crtc_state->enable.
> That way you'll be guaranteed to get visible=3D=3Dfalse. The helper is
> currently a bit broken wrt. the crtc->enable vs. crtc_state->enable.
> I've fixed that in [1] as well but those patches haven't been pushed
> yet.

[1] has landed in drm-misc, I'll rebase this series on top of that, and wil=
l=20
send a pull request when drm-misc gets merged in Dave's tree.

> After getting that stuff in, I'm going to attempt moving this
> clipping stuff entirely into the helper to avoid these kinds of
> mistakes in the future.

Good idea, thanks.

> [1] https://patchwork.freedesktop.org/series/33001/
>=20
> > +
> > +	ret =3D drm_plane_helper_check_state(state, &clip,
> > +					   DRM_PLANE_HELPER_NO_SCALING,
> > +					   DRM_PLANE_HELPER_NO_SCALING,
> > +					   true, true);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	if (!state->visible) {
> > +		*format =3D NULL;
> > +		return 0;
> >  	}
> >  =09
> >  	*format =3D rcar_du_format_info(state->fb->format->format);

=2D-=20
Regards,

Laurent Pinchart
