Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:41900 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728626AbeHFTSS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 15:18:18 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: kieran.bingham+renesas@ideasonboard.com
Cc: Jacopo Mondi <jacopo@jmondi.org>, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS"
        <linux-renesas-soc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 2/3] drm: rcar-du: Rename var to a more precise name
Date: Mon, 06 Aug 2018 20:08:59 +0300
Message-ID: <2766858.dkh6WOvVc0@avalon>
In-Reply-To: <8ddd8179-a0c7-1fbe-0390-ea8fd8c0ff7b@ideasonboard.com>
References: <1532971214-17962-1-git-send-email-jacopo@jmondi.org> <1532971214-17962-3-git-send-email-jacopo@jmondi.org> <8ddd8179-a0c7-1fbe-0390-ea8fd8c0ff7b@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Monday, 6 August 2018 18:49:12 EEST Kieran Bingham wrote:
> On 30/07/18 18:20, Jacopo Mondi wrote:
> > Rename the 'value' variable, only used to for writing to DMSR register to
> > a more precise 'dmsr' name.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> > 
> >  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c index 6d55cec..4d7907c 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > @@ -208,7 +208,7 @@ static void rcar_du_crtc_set_display_timing(struct
> > rcar_du_crtc *rcrtc)> 
> >  	const struct drm_display_mode *mode = &rcrtc->crtc.state-
>adjusted_mode;
> >  	struct rcar_du_device *rcdu = rcrtc->group->dev;
> >  	unsigned long mode_clock = mode->clock * 1000;
> > 
> > -	u32 value;
> > +	u32 dsmr;
> > 
> >  	u32 escr;
> >  	
> >  	if (rcdu->info->dpll_ch & (1 << rcrtc->index)) {
> > 
> > @@ -299,11 +299,11 @@ static void rcar_du_crtc_set_display_timing(struct
> > rcar_du_crtc *rcrtc)> 
> >  	rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? OTAR2 : OTAR, 0);
> >  	
> >  	/* Signal polarities */
> > 
> > -	value = ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? DSMR_VSL : 0)
> > -	      | ((mode->flags & DRM_MODE_FLAG_PHSYNC) ? DSMR_HSL : 0)
> > -	      | ((mode->flags & DRM_MODE_FLAG_INTERLACE) ? DSMR_ODEV : 0)
> > -	      | DSMR_DIPM_DISP | DSMR_CSPM;
> > -	rcar_du_crtc_write(rcrtc, DSMR, value);
> > +	dsmr = ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? DSMR_VSL : 0)
> > +	       | ((mode->flags & DRM_MODE_FLAG_PHSYNC) ? DSMR_HSL : 0)
> > +	       | ((mode->flags & DRM_MODE_FLAG_INTERLACE) ? DSMR_ODEV : 0)
> > +	       | DSMR_DIPM_DISP | DSMR_CSPM;
> 
> Quite nit-picky I'm afraid, but here, you have increased the indent such
> that the '|' operator is now aligned with the first '(', rather than the
> '=' as used by the rest of the driver.
> 
> Was this intentional ?
> 
> I think it should be brought forwards to align under the '=' to match.

Agreed.

For the record, this change was part of patch 1/3 that I provided on its own 
to Jacopo, who then split it out. I'd be inclined to squash the two changes 
back together, I don't think this rename requires a patch of its own.

> > +	rcar_du_crtc_write(rcrtc, DSMR, dsmr);
> > 
> >  	/* Display timings */
> >  	rcar_du_crtc_write(rcrtc, HDSR, mode->htotal - mode->hsync_start - 19);

-- 
Regards,

Laurent Pinchart
