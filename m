Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40929 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751827AbeF0Fg5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Jun 2018 01:36:57 -0400
Received: by mail-lj1-f195.google.com with SMTP id a6-v6so589301ljj.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Jun 2018 22:36:56 -0700 (PDT)
Date: Wed, 27 Jun 2018 07:36:54 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/04] rcar-vin: r8a77990 prototype
Message-ID: <20180627053654.GP5237@bigcity.dyn.berto.se>
References: <152942152672.28480.665572564123111170.sendpatchset@little-apple>
 <152942153504.28480.18358640564322769858.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <152942153504.28480.18358640564322769858.sendpatchset@little-apple>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

Thanks for your patch.

On 2018-06-20 00:18:55 +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Extend the VIN driver with experimental r8a77990 support.
> 
> Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  drivers/media/platform/rcar-vin/rcar-core.c |   21 +++++++++++++++++++++
>  drivers/media/platform/rcar-vin/rcar-csi2.c |    8 ++++++++
>  2 files changed, 29 insertions(+)
> 
> --- 0001/drivers/media/platform/rcar-vin/rcar-core.c
> +++ work/drivers/media/platform/rcar-vin/rcar-core.c	2018-06-19 20:54:34.180607110 +0900
> @@ -1037,6 +1037,23 @@ static const struct rvin_info rcar_info_
>  	.routes = _rcar_info_r8a77970_routes,
>  };
>  
> +
> +static const struct rvin_group_route _rcar_info_r8a77990_routes[] = {

Please drop the leading _. I did a bad copy past error when adding 
support for r8a77970 which included the leading _ for the route tables.  
We are trying to correct this mistake upstream but in the mean time we 
should not let it spread :-)

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
> +	.routes = _rcar_info_r8a77990_routes,
> +};
> +
>  static const struct of_device_id rvin_of_id_table[] = {
>  	{
>  		.compatible = "renesas,vin-r8a7778",
> @@ -1082,6 +1099,10 @@ static const struct of_device_id rvin_of
>  		.compatible = "renesas,vin-r8a77970",
>  		.data = &rcar_info_r8a77970,
>  	},
> +	{
> +		.compatible = "renesas,vin-r8a77990",

The compatible value also needs to be added to the bindings 
documentation.

> +		.data = &rcar_info_r8a77990,
> +	},
>  	{ /* Sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, rvin_of_id_table);
> --- 0001/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ work/drivers/media/platform/rcar-vin/rcar-csi2.c	2018-06-19 20:54:34.180607110 +0900

I would split this into a separate patch as VIN and CSI-2 are two 
separate drivers.

> @@ -951,6 +951,10 @@ static const struct rcar_csi2_info rcar_
>  	.init_phtw = rcsi2_init_phtw_v3m_e3,
>  };
>  
> +static const struct rcar_csi2_info rcar_csi2_info_r8a77990 = {
> +	.init_phtw = rcsi2_init_phtw_v3m_e3,
> +};
> +
>  static const struct of_device_id rcar_csi2_of_table[] = {
>  	{
>  		.compatible = "renesas,r8a7795-csi2",
> @@ -968,6 +972,10 @@ static const struct of_device_id rcar_cs
>  		.compatible = "renesas,r8a77970-csi2",
>  		.data = &rcar_csi2_info_r8a77970,
>  	},
> +	{
> +		.compatible = "renesas,r8a77990-csi2",

Same with this compatible string.

> +		.data = &rcar_csi2_info_r8a77990,
> +	},
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, rcar_csi2_of_table);

-- 
Regards,
Niklas S�derlund
