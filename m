Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:45136 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbeKVFEe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Nov 2018 00:04:34 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>,
        David Airlie <airlied@linux.ie>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm: rcar-du: Enable alpha property on primary planes
Date: Wed, 21 Nov 2018 20:29:22 +0200
Message-ID: <3478783.2iBfSyQcgT@avalon>
In-Reply-To: <1604918.OXgyMDt7RE@avalon>
References: <20180919155700.10342-1-kieran.bingham+renesas@ideasonboard.com> <20180919155700.10342-3-kieran.bingham+renesas@ideasonboard.com> <1604918.OXgyMDt7RE@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Thursday, 20 September 2018 14:22:38 EET Laurent Pinchart wrote:
> On Wednesday, 19 September 2018 18:56:59 EEST Kieran Bingham wrote:
> > If the alpha property is not added to a plane, a default value will be
> > used, which can result in a non-visible layer if the alpha is
> > initialised as 0.
> > 
> > Provide an alpha blend property on all planes.
> > 
> > Fixes: 161ad653d6c9 ("drm: rcar-du: Use __drm_atomic_helper_plane_reset
> > instead of copying the logic")
> > 
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > ---
> > 
> >  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_plane.c index 9e07758a755c..72399a19d8a6
> > 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > @@ -783,13 +783,18 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
> > 
> >  		drm_plane_helper_add(&plane->plane,
> >  		
> >  				     &rcar_du_plane_helper_funcs);
> > 
> > +		/*
> > +		 * The alpha property needs to be initialised on all planes
> > +		 * to ensure the correct setting at the output.
> > +		 */
> > +		drm_plane_create_alpha_property(&plane->plane);
> > +
> 
> As mentioned in the cover letter, both patches in this series fix the issue
> at hand. The first patch is more generic as it will fix it for all drivers,
> while this patch is specific to the R-Car DU driver. It however makes sense
> to merge it, as it adds alpha support to the primary plane, which can be
> useful.
> 
> Once the first patch gets merged, the above comment won't be correct
> anymore. I wonder whether we shouldn't change the patch description and
> comment to focus on usage of the alpha property for primary planes, and not
> on the bug fix. What's your opinion ?

I've removed the comment and changed the commit message to

  drm: rcar-du: Enable alpha property on primary planes
  
  The hardware supports alpha on all planes, and using it on the primary
  plane can be useful. Don't restrict the alpha property to overlay
  planes.

With this,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree.

> >  		if (type == DRM_PLANE_TYPE_PRIMARY)
> >  			continue;
> >  		
> >  		drm_object_attach_property(&plane->plane.base,
> >  					   rcdu->props.colorkey,
> >  					   RCAR_DU_COLORKEY_NONE);
> > 
> > -		drm_plane_create_alpha_property(&plane->plane);
> >  		drm_plane_create_zpos_property(&plane->plane, 1, 1, 7);
> >  	}

-- 
Regards,

Laurent Pinchart
