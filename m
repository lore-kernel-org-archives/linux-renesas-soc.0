Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39392 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965172AbeALWXT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jan 2018 17:23:19 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] drm: rcar-du: lvds: fix LVDS startup on R-Car gen2
Date: Sat, 13 Jan 2018 00:23:20 +0200
Message-ID: <11845752.a3eY2rs97p@avalon>
In-Reply-To: <20180112201553.683979009@cogentembedded.com>
References: <20180112201553.683979009@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

Thank you for the patch.

On Friday, 12 January 2018 22:12:05 EET Sergei Shtylyov wrote:
> According to the latest revision 2.00 of the R-Car gen2 manual, the LVDS
> must be enabled and the bias crcuit  enabled after the LVDS I/O pins are
> enabled, not before --  fix the gen2 LVDS startup sequence accordingly.
> 
> Fixes: 90374b5c25c9 ("drm/rcar-du: Add internal LVDS encoder support")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c |   11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> Index: linux/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
> ===================================================================
> --- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
> +++ linux/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
> @@ -59,11 +59,8 @@ static void rcar_du_lvdsenc_start_gen2(s
> 
>  	rcar_lvds_write(lvds, LVDPLLCR, pllcr);
> 
> -	/*
> -	 * Set the  LVDS mode, select the input, enable LVDS operation,
> -	 * and turn bias circuitry on.
> -	 */
> -	lvdcr0 = (lvds->mode << LVDCR0_LVMD_SHIFT) | LVDCR0_BEN | LVDCR0_LVEN;
> +	/* Select the input and set the LVDS mode. */
> +	lvdcr0 = lvds->mode << LVDCR0_LVMD_SHIFT;
>  	if (rcrtc->index == 2)
>  		lvdcr0 |= LVDCR0_DUSEL;
>  	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> @@ -73,6 +70,10 @@ static void rcar_du_lvdsenc_start_gen2(s
>  			LVDCR1_CHSTBY(3) | LVDCR1_CHSTBY(2) |
>  			LVDCR1_CHSTBY(1) | LVDCR1_CHSTBY(0) | LVDCR1_CLKSTBY);
> 
> +	/* Enable LVDS operation and turn bias circuitry on. */
> +	lvdcr0 |= LVDCR0_BEN | LVDCR0_LVEN;
> +	rcar_lvds_write(lvds, LVDCR0, lvdcr0);

This change looks good, but for the reasons explained in my replies to patch 
1/2, I would set the mode here along with the BEN and LVEN bits.

>  	/*
>  	 * Turn the PLL on, wait for the startup delay, and turn the output
>  	 * on.

-- 
Regards,

Laurent Pinchart
