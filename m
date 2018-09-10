Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46349 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbeIJXNy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Sep 2018 19:13:54 -0400
Received: by mail-lf1-f66.google.com with SMTP id e23-v6so18198497lfc.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Sep 2018 11:18:33 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Mon, 10 Sep 2018 20:18:31 +0200
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, kieran.bingham+renesas@ideasonboard.com,
        damm+renesas@opensource.se, ulrich.hecht+renesas@gmail.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/8] media: rcar-vin: Add support for R-Car R8A77990
Message-ID: <20180910181831.GF18450@bigcity.dyn.berto.se>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
 <1536161385-25562-3-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1536161385-25562-3-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thanks for for work.

On 2018-09-05 17:29:39 +0200, Jacopo Mondi wrote:
> Add R-Car E3 R8A77990 SoC to the rcar-vin supported ones.
> Based on the experimental patch from Magnus Damm.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Acked-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index ce09799..d443c09 100644
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
> @@ -1143,6 +1159,10 @@ static const struct of_device_id rvin_of_id_table[] = {
>  		.data = &rcar_info_r8a77970,
>  	},
>  	{
> +		.compatible = "renesas,vin-r8a77990",
> +		.data = &rcar_info_r8a77990,
> +	},
> +	{
>  		.compatible = "renesas,vin-r8a77995",
>  		.data = &rcar_info_r8a77995,
>  	},
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
