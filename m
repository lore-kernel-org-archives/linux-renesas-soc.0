Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:36473 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933866AbeALOat (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jan 2018 09:30:49 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] drm: rcar-du: add R8A77970 support
Date: Fri, 12 Jan 2018 16:30:48 +0200
Message-ID: <3450878.q2PSDvCyDk@avalon>
In-Reply-To: <78c33176-39b7-6bd9-e307-2b28c0b28f04@cogentembedded.com>
References: <20180111170103.676775968@cogentembedded.com> <8239904.rdcckmYW4i@avalon> <78c33176-39b7-6bd9-e307-2b28c0b28f04@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Friday, 12 January 2018 11:23:00 EET Sergei Shtylyov wrote:
> On 1/12/2018 4:13 AM, Laurent Pinchart wrote:
> >> Add support for the R-Car  V3M  (R8A77970) SoC to the DU driver (this SoC
> >> has only  1 display port). Note that there are some differences  with the
> >> other R-Car gen3 SoCs in the LVDS encoder part, e.g. LVDPLLCR has the
> >> same layout  as  on the R-Car gen2 SoCs...
> >> 
> >> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > 
> > Could you please rebase this series on top of the LVDS rework posted as
> > "[PATCH 00/10] R-Car DU: Convert LVDS code to bridge driver" (https://
> > www.spinics.net/lists/dri-devel/msg161931.html) ? It should make it easier
> > to implement support for V3M. Please then split the DU and LVDS drivers
> > changes in two patches.
> > 
> >> ---
> >> 
> >>   Documentation/devicetree/bindings/display/renesas,du.txt |    1
> > 
> > Please split the DT bindings changes to a separate patch.
> 
>     I don't like putting a one-line chnage into a separate bindings patch...
> >>   drivers/gpu/drm/rcar-du/rcar_du_drv.c                    |   23 +++++++
> >>   drivers/gpu/drm/rcar-du/rcar_du_drv.h                    |    1
> >>   drivers/gpu/drm/rcar-du/rcar_du_group.c                  |   10 +++---
> >>   drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c                |   20 ++++---
> >>   5 files changed, 45 insertions(+), 10 deletions(-)

[snip]

> >> Index: linux/drivers/gpu/drm/rcar-du/rcar_du_group.c
> >> ===================================================================
> >> --- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_group.c
> >> +++ linux/drivers/gpu/drm/rcar-du/rcar_du_group.c
> >> @@ -133,10 +133,12 @@ static void rcar_du_group_setup(struct r
> >> 
> >>   	rcar_du_group_write(rgrp, DORCR, DORCR_PG1D_DS1 | DORCR_DPRS);
> >>   	
> >>   	/* Apply planes to CRTCs association. */
> >> 
> >> -	mutex_lock(&rgrp->lock);
> >> -	rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> >> -			    rgrp->dptsr_planes);
> >> -	mutex_unlock(&rgrp->lock);
> >> +	if (rcdu->info->num_crtcs > 1) {
> >> +		mutex_lock(&rgrp->lock);
> >> +		rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> >> +				    rgrp->dptsr_planes);
> >> +		mutex_unlock(&rgrp->lock);
> >> +	}
> > 
> > Shouldn't you skip writing to the DPTSR register if there's a single DPTSR
> > in the group ? That would then apply to M3-W as well, which doesn't have
> > the DPTSR2 register. I'd split this change to a separate patch.
> 
> OK, I guess you know this stuff better -- I didn't know DPTSR2 is used
> at all... :-)

Should I send a patch for this as well ?

> [...]
> 
> >> Index: linux/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
> >> ===================================================================
> >> --- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
> >> +++ linux/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
> 
> [...]
> 
> >> @@ -177,14 +185,14 @@ int rcar_du_lvdsenc_enable(struct rcar_d
> >>   void rcar_du_lvdsenc_atomic_check(struct rcar_du_lvdsenc *lvds,
> >>   				  struct drm_display_mode *mode)
> >>   {
> >> -	struct rcar_du_device *rcdu = lvds->dev;
> >> +	const struct rcar_du_device_info *info = lvds->dev->info;
> >> 
> >>   /*
> >>    * The internal LVDS encoder has a restricted clock frequency
> >>   	 operating
> >> -	 * range (30MHz to 150MHz on Gen2, 25.175MHz to 148.5MHz on Gen3).
> >> Clamp
> >> -	 * the clock accordingly.
> >> +	 * range (30MHz to 150MHz on Gen2 and R-Car V3M, 25.175MHz to 148.5MHz
> >> +	 * on Gen3). Clamp the clock accordingly.
> >>  	 */
> >> -	if (rcdu->info->gen < 3)
> >> +	if (info->gen < 3 || info->model == R8A77970)
> >>   		mode->clock = clamp(mode->clock, 30000, 150000);
> > 
> > According to the datasheet the frequency range for V3M is the same as for
> > the H3 and M3 SoCs.
> 
>     Indeed! I thought it's determined by the LVDPLLCR layout but it's not...
> 
> > The range seems to have changed starting in datasheet version
> > 0.52. I would fix the range in a separate patch first.
> 
>     Yes.
> 
> > If you want I can send patches to fix this issue
> 
>     Yes, please. You clearly know about DU more than me. :-)

I've prepared a patch, I'm testing it now and I'll then send it.

> > and the previous one, or you can write them and include them in v2. Let me
> > know what you'd prefer.
> > 
> >>   	else
> >>   		mode->clock = clamp(mode->clock, 25175, 148500);
> 
>     The lower bound documented on gen3 is 31 MHz indeed...

And I just found out that the latest versions of the Gen2 datasheets also 
document the 31 MHz - 148.5 MHz range. This will simplify the code.

-- 
Regards,

Laurent Pinchart
