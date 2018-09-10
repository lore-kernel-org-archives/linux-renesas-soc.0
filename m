Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:54076 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727674AbeIJS7L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Sep 2018 14:59:11 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: geert@linux-m68k.org, horms@verge.net.au,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, damm+renesas@opensource.se,
        ulrich.hecht+renesas@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/8] media: rcar-csi2: Add R8A77990 support
Date: Mon, 10 Sep 2018 17:05:04 +0300
Message-ID: <7392095.B4xYg3mrBd@avalon>
In-Reply-To: <1536161385-25562-5-git-send-email-jacopo+renesas@jmondi.org>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org> <1536161385-25562-5-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thank you for the patch.

On Wednesday, 5 September 2018 18:29:41 EEST Jacopo Mondi wrote:
> Add support for R-Car E3 R8A77965 to R-Car CSI-2 driver.
> Based on the experimental patch from Magnus Damm.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c
> b/drivers/media/platform/rcar-vin/rcar-csi2.c index dc5ae80..f82b668 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -959,6 +959,11 @@ static const struct rcar_csi2_info
> rcar_csi2_info_r8a77970 = { .confirm_start = rcsi2_confirm_start_v3m_e3,
>  };
> 
> +static const struct rcar_csi2_info rcar_csi2_info_r8a77990 = {
> +	.init_phtw = rcsi2_init_phtw_v3m_e3,
> +	.confirm_start = rcsi2_confirm_start_v3m_e3,
> +};
> +
>  static const struct of_device_id rcar_csi2_of_table[] = {
>  	{
>  		.compatible = "renesas,r8a7795-csi2",
> @@ -976,6 +981,10 @@ static const struct of_device_id rcar_csi2_of_table[] =
> { .compatible = "renesas,r8a77970-csi2",
>  		.data = &rcar_csi2_info_r8a77970,
>  	},
> +	{
> +		.compatible = "renesas,r8a77990-csi2",
> +		.data = &rcar_csi2_info_r8a77990,
> +	},
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, rcar_csi2_of_table);


-- 
Regards,

Laurent Pinchart
