Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:54016 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727674AbeIJS4I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Sep 2018 14:56:08 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: geert@linux-m68k.org, horms@verge.net.au,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, damm+renesas@opensource.se,
        ulrich.hecht+renesas@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/8] media: rcar-vin: Add support for R-Car R8A77990
Date: Mon, 10 Sep 2018 17:02:02 +0300
Message-ID: <1702539.uiMWham5XG@avalon>
In-Reply-To: <1536161385-25562-3-git-send-email-jacopo+renesas@jmondi.org>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org> <1536161385-25562-3-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thank you for the patch.

On Wednesday, 5 September 2018 18:29:39 EEST Jacopo Mondi wrote:
> Add R-Car E3 R8A77990 SoC to the rcar-vin supported ones.
> Based on the experimental patch from Magnus Damm.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c
> b/drivers/media/platform/rcar-vin/rcar-core.c index ce09799..d443c09 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -1085,6 +1085,22 @@ static const struct rvin_info rcar_info_r8a77970 = {
>  	.routes = rcar_info_r8a77970_routes,
>  };
> 
> +static const struct rvin_group_route rcar_info_r8a77990_routes[] = {
> +	{ .csi = RVIN_CSI40, .channel = 0, .vin = 4, .mask = BIT(0) | BIT(3) },
> +	{ .csi = RVIN_CSI40, .channel = 0, .vin = 5, .mask = BIT(2) },
> +	{ .csi = RVIN_CSI40, .channel = 1, .vin = 4, .mask = BIT(2) },
> +	{ .csi = RVIN_CSI40, .channel = 1, .vin = 5, .mask = BIT(1) | BIT(3) },
> +	{ /* Sentinel */ }
> +};
> +
> +static const struct rvin_info rcar_info_r8a77990 = {
> +	.model = RCAR_GEN3,
> +	.use_mc = true,
> +	.max_width = 4096,
> +	.max_height = 4096,
> +	.routes = rcar_info_r8a77990_routes,
> +};
> +
>  static const struct rvin_group_route rcar_info_r8a77995_routes[] = {
>  	{ /* Sentinel */ }
>  };
> @@ -1143,6 +1159,10 @@ static const struct of_device_id rvin_of_id_table[] =
> { .data = &rcar_info_r8a77970,
>  	},
>  	{
> +		.compatible = "renesas,vin-r8a77990",
> +		.data = &rcar_info_r8a77990,
> +	},
> +	{
>  		.compatible = "renesas,vin-r8a77995",
>  		.data = &rcar_info_r8a77995,
>  	},

-- 
Regards,

Laurent Pinchart
