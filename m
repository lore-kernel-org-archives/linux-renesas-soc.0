Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:58660 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161247AbeBNRxO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 12:53:14 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 3/3] drm: rcar-du: lvds: add R8A77970 support
Date: Wed, 14 Feb 2018 19:53:47 +0200
Message-ID: <1916253.7gD2R49gcv@avalon>
In-Reply-To: <20180119183557.226328412@cogentembedded.com>
References: <20180119183557.226328412@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

Thank you for the patch.

On Friday, 19 January 2018 20:29:21 EET Sergei Shtylyov wrote:
> Add support for the R-Car V3M (R8A77970) SoC to the LVDS encoder driver.
> Note that there are some differences with the other R-Car gen3 SoCs, e.g.
> LVDPLLCR has the same layout as in the R-Car gen2 SoCs...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c |   21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> Index: linux/drivers/gpu/drm/rcar-du/rcar_lvds.c
> ===================================================================
> --- linux.orig/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ linux/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -32,6 +32,10 @@ enum rcar_lvds_mode {
>  };
> 
>  #define RCAR_LVDS_QUIRK_LANES	(1 << 0)	/* LVDS lanes 1 and 3 inverted */
> +#define RCAR_LVDS_QUIRK_GEN2_PLLCR (1 << 1)	/* LVDPLLCR has gen2-like */
> +						/* layout on R8A77970 */
> +#define RCAR_LVDS_QUIRK_PHY	(1 << 2)	/* LVDS has PHY on R8A77970 */
> +						/* and  R8A7799{0|5} */

I'm not sure if that's the right explanation for this quirk. I assume the LVDS 
encoder to always have a PHY. The difference here is that it needs to be 
explicitly enabled. Note that the LVEN bit also exists in Gen2.

>  struct rcar_lvds_device_info {
>  	unsigned int gen;
> @@ -162,6 +166,7 @@ static void rcar_lvds_enable(struct drm_
>  	 */
>  	struct drm_crtc *crtc = lvds->bridge.encoder->crtc;
>  	const struct drm_display_mode *mode = &lvds->display_mode;
> +	unsigned int quirks = lvds->info->quirks;
>  	unsigned int gen = lvds->info->gen;
>  	u32 lvdcr0 = lvds->mode << LVDCR0_LVMD_SHIFT;
>  	u32 lvdpllcr;
> @@ -186,7 +191,7 @@ static void rcar_lvds_enable(struct drm_
>  			LVDCTRCR_CTR2SEL_DISP | LVDCTRCR_CTR1SEL_VSYNC |
>  			LVDCTRCR_CTR0SEL_HSYNC);
> 
> -	if (lvds->info->quirks & RCAR_LVDS_QUIRK_LANES)
> +	if (quirks & RCAR_LVDS_QUIRK_LANES)
>  		lvdhcr = LVDCHCR_CHSEL_CH(0, 0) | LVDCHCR_CHSEL_CH(1, 3)
> 
>  		       | LVDCHCR_CHSEL_CH(2, 2) | LVDCHCR_CHSEL_CH(3, 1);
> 
>  	else
> @@ -195,7 +200,7 @@ static void rcar_lvds_enable(struct drm_
>  	rcar_lvds_write(lvds, LVDCHCR, lvdhcr);
> 
>  	/* PLL clock configuration */
> -	if (gen < 3)
> +	if (gen < 3 || quirks & RCAR_LVDS_QUIRK_GEN2_PLLCR)

I'd set the RCAR_LVDS_QUIRK_GEN2_PLLCR flag in all the Gen2 
rcar_lvds_device_info instances, and remove the gen check here.

>  		lvdpllcr = rcar_lvds_lvdpllcr_gen2(mode->clock);
>  	else
>  		lvdpllcr = rcar_lvds_lvdpllcr_gen3(mode->clock);
> @@ -227,6 +232,12 @@ static void rcar_lvds_enable(struct drm_
>  		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
>  	}
> 
> +	if (quirks & RCAR_LVDS_QUIRK_PHY) {
> +		/* Turn on the LVDS PHY. */
> +		lvdcr0 |= LVDCR0_LVEN;
> +		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> +	}
> +
>  	/* Wait for the startup delay. */
>  	usleep_range(100, 150);
> 
> @@ -499,6 +510,11 @@ static const struct rcar_lvds_device_inf
>  	.gen = 3,
>  };
> 
> +static const struct rcar_lvds_device_info rcar_lvds_r8a77970_info = {
> +	.gen = 3,
> +	.quirks = RCAR_LVDS_QUIRK_GEN2_PLLCR | RCAR_LVDS_QUIRK_PHY,
> +};
> +
>  static const struct of_device_id rcar_lvds_of_table[] = {
>  	{ .compatible = "renesas,r8a7743-lvds", .data = &rcar_lvds_gen2_info },
>  	{ .compatible = "renesas,r8a7790-lvds", .data = &rcar_lvds_r8a7790_info },
> @@ -506,6 +522,7 @@ static const struct of_device_id rcar_lv
>  	{ .compatible = "renesas,r8a7793-lvds", .data = &rcar_lvds_gen2_info },
>  	{ .compatible = "renesas,r8a7795-lvds", .data = &rcar_lvds_gen3_info },
>  	{ .compatible = "renesas,r8a7796-lvds", .data = &rcar_lvds_gen3_info },
> +	{ .compatible = "renesas,r8a77970-lvds", .data = &rcar_lvds_r8a77970_info
> }, { }
>  };

-- 
Regards,

Laurent Pinchart
