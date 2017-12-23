Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:53418 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750842AbdLWNI5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 23 Dec 2017 08:08:57 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: lvds: fix LVDCR1 for R-Car gen3
Date: Sat, 23 Dec 2017 15:09:06 +0200
Message-ID: <89065057.2qEGqgNSnG@avalon>
In-Reply-To: <20171221202343.596842084@cogentembedded.com>
References: <20171221202343.596842084@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

Thank you for the patch.

On Thursday, 21 December 2017 22:23:30 EET Sergei Shtylyov wrote:
> The LVDCR1 register for the R-Car gen3 SoCs was documented as having the
> layout different from the gen2 SoCs in  the early R-Car gen3 manuals but
> since v0.52 the LVDCR1 layout is described as being the same as on the gen2
> SoCs; the old CHn control values are said to be prohibited now (and there
> seems to be no valid output signal when they are used).

Could it be that the "Gen3" values are specific to the H3 ES1.x ? I've got the 
LVDS output working on a Salvator-X H3 board with the existing code, although 
I'm not sure at the moment whether that was on ES1.x or ES2.0. I can check 
that when I'll get access to the hardware back in a week.

On which platform have you tested this patch ?

> Fixes: 6bc2e15cf21c ("drm: rcar-du: lvds: Add R-Car Gen3 support")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c |   10 ++++------
>  drivers/gpu/drm/rcar-du/rcar_lvds_regs.h  |    6 ++----
>  2 files changed, 6 insertions(+), 10 deletions(-)
> 
> Index: linux/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
> ===================================================================
> --- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
> +++ linux/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
> @@ -70,9 +70,8 @@ static void rcar_du_lvdsenc_start_gen2(s
> 
>  	/* Turn all the channels on. */
>  	rcar_lvds_write(lvds, LVDCR1,
> -			LVDCR1_CHSTBY_GEN2(3) | LVDCR1_CHSTBY_GEN2(2) |
> -			LVDCR1_CHSTBY_GEN2(1) | LVDCR1_CHSTBY_GEN2(0) |
> -			LVDCR1_CLKSTBY_GEN2);
> +			LVDCR1_CHSTBY(3) | LVDCR1_CHSTBY(2) |
> +			LVDCR1_CHSTBY(1) | LVDCR1_CHSTBY(0) | LVDCR1_CLKSTBY);
> 
>  	/*
>  	 * Turn the PLL on, wait for the startup delay, and turn the output
> @@ -109,9 +108,8 @@ static void rcar_du_lvdsenc_start_gen3(s
> 
>  	/* Turn all the channels on. */
>  	rcar_lvds_write(lvds, LVDCR1,
> -			LVDCR1_CHSTBY_GEN3(3) | LVDCR1_CHSTBY_GEN3(2) |
> -			LVDCR1_CHSTBY_GEN3(1) | LVDCR1_CHSTBY_GEN3(0) |
> -			LVDCR1_CLKSTBY_GEN3);
> +			LVDCR1_CHSTBY(3) | LVDCR1_CHSTBY(2) |
> +			LVDCR1_CHSTBY(1) | LVDCR1_CHSTBY(0) | LVDCR1_CLKSTBY);
> 
>  	/*
>  	 * Turn the PLL on, set it to LVDS normal mode, wait for the startup
> Index: linux/drivers/gpu/drm/rcar-du/rcar_lvds_regs.h
> ===================================================================
> --- linux.orig/drivers/gpu/drm/rcar-du/rcar_lvds_regs.h
> +++ linux/drivers/gpu/drm/rcar-du/rcar_lvds_regs.h
> @@ -26,10 +26,8 @@
> 
>  #define LVDCR1				0x0004
>  #define LVDCR1_CKSEL			(1 << 15)		/* Gen2 only */
> -#define LVDCR1_CHSTBY_GEN2(n)		(3 << (2 + (n) * 2))	/* Gen2 only */
> -#define LVDCR1_CHSTBY_GEN3(n)		(1 << (2 + (n) * 2))	/* Gen3 only */
> -#define LVDCR1_CLKSTBY_GEN2		(3 << 0)		/* Gen2 only */
> -#define LVDCR1_CLKSTBY_GEN3		(1 << 0)		/* Gen3 only */
> +#define LVDCR1_CHSTBY(n)		(3 << (2 + (n) * 2))
> +#define LVDCR1_CLKSTBY			(3 << 0)
> 
>  #define LVDPLLCR			0x0008
>  #define LVDPLLCR_CEEN			(1 << 14)

-- 
Regards,

Laurent Pinchart
