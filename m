Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44408 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726206AbeJJRqJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Oct 2018 13:46:09 -0400
Received: by mail-lj1-f194.google.com with SMTP id v6-v6so4354652ljc.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Oct 2018 03:24:39 -0700 (PDT)
Date: Wed, 10 Oct 2018 12:24:36 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] thermal: rcar_gen3_thermal: add R8A77980 support
Message-ID: <20181010102436.GA24305@bigcity.dyn.berto.se>
References: <3c96d51e-fc36-2ff9-03a8-176c4c0ed365@cogentembedded.com>
 <ffa4ab74-aa7c-553a-6246-022e3af7d9fa@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffa4ab74-aa7c-553a-6246-022e3af7d9fa@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

Thanks for your patch.

On 2018-10-09 22:11:51 +0300, Sergei Shtylyov wrote:
> Add the R-Car V3H (R8A77980) SoC support to the R-Car gen3 thermal driver.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> 
> ---
>  drivers/thermal/rcar_gen3_thermal.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> Index: linux-soc-thermal/drivers/thermal/rcar_gen3_thermal.c
> ===================================================================
> --- linux-soc-thermal.orig/drivers/thermal/rcar_gen3_thermal.c
> +++ linux-soc-thermal/drivers/thermal/rcar_gen3_thermal.c
> @@ -321,6 +321,7 @@ static const struct of_device_id rcar_ge
>  	{ .compatible = "renesas,r8a7795-thermal", },
>  	{ .compatible = "renesas,r8a7796-thermal", },
>  	{ .compatible = "renesas,r8a77965-thermal", },
> +	{ .compatible = "renesas,r8a77980-thermal", },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, rcar_gen3_thermal_dt_ids);

-- 
Regards,
Niklas S�derlund
