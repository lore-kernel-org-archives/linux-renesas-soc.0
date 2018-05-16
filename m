Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51277 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751182AbeEPHyW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 May 2018 03:54:22 -0400
Date: Wed, 16 May 2018 09:54:19 +0200
From: Simon Horman <horms@verge.net.au>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/5] drm: rcar-du: lvds: Add R8A77995 support
Message-ID: <20180516075419.lpwb2yusthmm74mx@verge.net.au>
References: <1526386840-15368-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1526386840-15368-3-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1526386840-15368-3-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 15, 2018 at 02:20:37PM +0200, Ulrich Hecht wrote:
> Add support for the R-Car D3 (R8A77995) SoC to the LVDS encoder driver.
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 3d2d3bb..58fb9f8 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -511,6 +511,11 @@ static const struct rcar_lvds_device_info rcar_lvds_r8a77970_info = {
>  	.quirks = RCAR_LVDS_QUIRK_GEN2_PLLCR | RCAR_LVDS_QUIRK_GEN3_LVEN,
>  };
>  
> +static const struct rcar_lvds_device_info rcar_lvds_r8a77995_info = {
> +	.gen = 3,
> +	.quirks = RCAR_LVDS_QUIRK_GEN3_LVEN,
> +};

This new structure seems to be identical to rcar_lvds_r8a77970_info.
Could we consolidate somehow?

> +
>  static const struct of_device_id rcar_lvds_of_table[] = {
>  	{ .compatible = "renesas,r8a7743-lvds", .data = &rcar_lvds_gen2_info },
>  	{ .compatible = "renesas,r8a7790-lvds", .data = &rcar_lvds_r8a7790_info },
> @@ -519,6 +524,7 @@ static const struct of_device_id rcar_lvds_of_table[] = {
>  	{ .compatible = "renesas,r8a7795-lvds", .data = &rcar_lvds_gen3_info },
>  	{ .compatible = "renesas,r8a7796-lvds", .data = &rcar_lvds_gen3_info },
>  	{ .compatible = "renesas,r8a77970-lvds", .data = &rcar_lvds_r8a77970_info },
> +	{ .compatible = "renesas,r8a77995-lvds", .data = &rcar_lvds_r8a77995_info },
>  	{ }
>  };
>  
> -- 
> 2.7.4
> 
