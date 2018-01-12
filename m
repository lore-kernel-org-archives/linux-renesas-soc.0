Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39367 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965156AbeALWP7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jan 2018 17:15:59 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] drm: rcar-du: lvds: fix LVDS startup on R-Car gen3
Date: Sat, 13 Jan 2018 00:15:59 +0200
Message-ID: <3090757.msatNG3mHi@avalon>
In-Reply-To: <2286420.LkWkKn4WW8@avalon>
References: <20180112201550.368547609@cogentembedded.com> <2286420.LkWkKn4WW8@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Friday, 12 January 2018 23:51:35 EET Laurent Pinchart wrote:
> On Friday, 12 January 2018 22:12:04 EET Sergei Shtylyov wrote:
> > According to the latest revisions of the R-Car gen3 manual, the LVDS mode
> > must be set before the LVDS I/O pins are enabled, not after --  fix  the
> > gen3 LVDS startup sequence accordingly...
> > 
> > While  at it,  also fix the comment  preceding the first LVDCR0 write in
> > the R-Car gen2 startup code that still talks about hardcoding the LVDS
> > mode 0...
> 
> How about fixing that in patch 2/2 that touches the Gen2 initialization
> sequence ? I think I'd even go as far as squashing both patches, I don't
> think there's a need to split them.
> 
> > Fixes: e947eccbeba4 ("drm: rcar-du: Add support for LVDS mode selection")
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Is this really needed ? Does it fix a problem you've experienced, or is it
> theoretical only ? The mode shouldn't matter before the LVDS internal logic
> is turned on. Unless there's a real issue I'm not sure we should make the
> code more complex.

Furthermore the datasheet states

"3. This refers to settings other than those that are concerned with LVDS-IF 
startup. These items may be set while waiting for the conditions of step 6 to 
be met."

Doesn't this mean that the mode and input selector don't have to be set as the 
very first step, but can be programmed at any point before starting the LVDS 
encoder through the PWD bit (on Gen3) or the PLLON bit (on Gen2) ?

> > ---
> > 
> >  drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c |   10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > Index: linux/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
> > ===================================================================
> > --- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
> > +++ linux/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
> > @@ -60,8 +60,8 @@ static void rcar_du_lvdsenc_start_gen2(s
> >  	rcar_lvds_write(lvds, LVDPLLCR, pllcr);
> >  	
> >  	/*
> > -	 * Select the input, hardcode mode 0, enable LVDS operation and turn
> > -	 * bias circuitry on.
> > +	 * Set the  LVDS mode, select the input, enable LVDS operation,
> > +	 * and turn bias circuitry on.
> >  	 */
> >  	lvdcr0 = (lvds->mode << LVDCR0_LVMD_SHIFT) | LVDCR0_BEN | LVDCR0_LVEN;
> >  	if (rcrtc->index == 2)
> > @@ -106,6 +106,9 @@ static void rcar_du_lvdsenc_start_gen3(s
> > 
> >  	rcar_lvds_write(lvds, LVDPLLCR, pllcr);
> > 
> > +	lvdcr0 = lvds->mode << LVDCR0_LVMD_SHIFT;
> > +	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> > +
> >  	/* Turn all the channels on. */
> >  	rcar_lvds_write(lvds, LVDCR1,
> >  			LVDCR1_CHSTBY(3) | LVDCR1_CHSTBY(2) |
> > @@ -115,7 +118,8 @@ static void rcar_du_lvdsenc_start_gen3(s
> >  	 * Turn the PLL on, set it to LVDS normal mode, wait for the startup
> >  	 * delay and turn the output on.
> >  	 */
> > -	lvdcr0 = (lvds->mode << LVDCR0_LVMD_SHIFT) | LVDCR0_PLLON;
> > +
> > +	lvdcr0 = | LVDCR0_PLLON;
> >  	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> >  	
> >  	lvdcr0 |= LVDCR0_PWD;

-- 
Regards,

Laurent Pinchart
