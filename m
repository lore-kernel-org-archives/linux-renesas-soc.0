Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:32852 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbeIJXQF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Sep 2018 19:16:05 -0400
Received: by mail-lj1-f196.google.com with SMTP id s12-v6so18765624ljj.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Sep 2018 11:20:43 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Mon, 10 Sep 2018 20:20:41 +0200
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, kieran.bingham+renesas@ideasonboard.com,
        damm+renesas@opensource.se, ulrich.hecht+renesas@gmail.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/8] media: rcar-csi2: Add R8A77990 support
Message-ID: <20180910182041.GH18450@bigcity.dyn.berto.se>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
 <1536161385-25562-5-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1536161385-25562-5-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thanks for your patch.

On 2018-09-05 17:29:41 +0200, Jacopo Mondi wrote:
> Add support for R-Car E3 R8A77965 to R-Car CSI-2 driver.
> Based on the experimental patch from Magnus Damm.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Acked-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index dc5ae80..f82b668 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -959,6 +959,11 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77970 = {
>  	.confirm_start = rcsi2_confirm_start_v3m_e3,
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
> @@ -976,6 +981,10 @@ static const struct of_device_id rcar_csi2_of_table[] = {
>  		.compatible = "renesas,r8a77970-csi2",
>  		.data = &rcar_csi2_info_r8a77970,
>  	},
> +	{
> +		.compatible = "renesas,r8a77990-csi2",
> +		.data = &rcar_csi2_info_r8a77990,
> +	},
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, rcar_csi2_of_table);
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
