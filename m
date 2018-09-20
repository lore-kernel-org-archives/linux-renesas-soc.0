Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr40044.outbound.protection.outlook.com ([40.107.4.44]:32230
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726177AbeITQBy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Sep 2018 12:01:54 -0400
Date: Thu, 20 Sep 2018 11:19:04 +0100
From: Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
        <ville.syrjala@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>,
        open list <linux-kernel@vger.kernel.org>,
        Sean Paul <sean@poorly.run>, nd@arm.com
Subject: Re: [PATCH 1/2] drm/atomic: Initialise planes with opaque alpha
 values
Message-ID: <20180920101904.GA28394@e114479-lin.cambridge.arm.com>
References: <20180919155700.10342-1-kieran.bingham+renesas@ideasonboard.com>
 <20180919155700.10342-2-kieran.bingham+renesas@ideasonboard.com>
 <20180919161545.GH5565@intel.com>
 <20180919164347.GA21403@e114479-lin.cambridge.arm.com>
 <007554b7-8aa4-3ecd-354a-c63ec6fa39f8@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <007554b7-8aa4-3ecd-354a-c63ec6fa39f8@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Sep 20, 2018 at 11:03:12AM +0100, Kieran Bingham wrote:
> Hi Alexandru,
> 
> On 19/09/18 17:43, Alexandru-Cosmin Gheorghe wrote:
> > Hi Kieran,
> > 
> > 
> > On Wed, Sep 19, 2018 at 07:15:45PM +0300, Ville Syrj�l� wrote:
> >> On Wed, Sep 19, 2018 at 04:56:58PM +0100, Kieran Bingham wrote:
> >>> Planes without an alpha property, using __drm_atomic_helper_plane_reset
> >>> will have their plane state alpha initialised as zero, which represents
> >>> a transparent alpha.
> >>>
> >>> If this value is then used for the plane, it may not be visible by
> >>> default, and thus doesn't represent a good initialisation state.
> >>>
> >>> Update the default state->alpha value to DRM_BLEND_ALPHA_OPAQUE
> >>> unconditionally when the plane is reset.
> >>>
> >>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>> ---
> >>>  drivers/gpu/drm/drm_atomic_helper.c | 4 +---
> >>>  1 file changed, 1 insertion(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> >>> index 3cf1aa132778..e49b22381048 100644
> >>> --- a/drivers/gpu/drm/drm_atomic_helper.c
> >>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> >>> @@ -3569,9 +3569,7 @@ void __drm_atomic_helper_plane_reset(struct drm_plane *plane,
> >>>  	state->plane = plane;
> >>>  	state->rotation = DRM_MODE_ROTATE_0;
> >>>  
> >>> -	/* Reset the alpha value to fully opaque if it matters */
> >>> -	if (plane->alpha_property)
> >>> -		state->alpha = plane->alpha_property->values[1];
> >>> +	state->alpha = DRM_BLEND_ALPHA_OPAQUE;
> >>
> >> I can't come up with a solid excuse for not initializing it always.
> >>
> >> Reviewed-by: Ville Syrj�l� <ville.syrjala@linux.intel.com>
> > 
> > Neither do I, so:
> > Reviewed-by: Alexandru Gheorghe <alexandru-cosmin.gheorghe@arm.com>
> > 
> > And thanks again.
> > 
> > I plan to push it tomorrow to drm-misc-next.
> > 
> > Now, I've seen the plane_reset patches in the pull request for drm-next
> > 4.20, I wonder if someone could tell me what should I do to get this
> > patch on that train.
> 
> I've submitted a separate patch for the rcar-du which enables the alpha
> property for the primary plane - and it incorporates a "Fixes:
> 161ad653d6c9 ("drm: rcar-du: Use __drm_atomic_helper_plane_reset
> instead of copying the logic")" tag.
> 
> Technically that should be sufficient to get that fix into v4.19 I
> believe ...

plane_reset patches are not in v4.19, but in drm-next which as far as
I know will be sent for v4.20

> 
> But if you feel that this patch should also be included - we could add
> the same tag to this patch, and get it queued up for v4.19 fixes?

Looking here 
https://01.org/linuxgraphics/gfx-docs/maintainer-tools/repositories.html#drm-misc-next
It seems that the last pull request for v4.20 of drm-misc-next will be
sent around rc6, so I think putting it in drm-misc-next will be enough
to get this with the rest of the plane_reset patch in v4.20,  but just
to make sure I will double check with Sean on IRC.


> 
> --
> Regards
> 
> Kieran
> 
> 
> > 
> >>
> >>>  	state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
> >>>  
> >>>  	plane->state = state;
> >>> -- 
> >>> 2.17.1
> >>>
> >>> _______________________________________________
> >>> dri-devel mailing list
> >>> dri-devel@lists.freedesktop.org
> >>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >>
> >> -- 
> >> Ville Syrj�l�
> >> Intel
> > 

-- 
Cheers,
Alex G
