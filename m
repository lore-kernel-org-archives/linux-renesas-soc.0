Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36727 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727204AbeIQNrL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 09:47:11 -0400
Date: Mon, 17 Sep 2018 10:20:48 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clocksource: sh_cmt: properly line-wrap
 sh_cmt_of_table[] initializer
Message-ID: <20180917082048.yqkadcclz733av6j@verge.net.au>
References: <c94a4ad6-93ee-05e4-e2c1-e8d24d3bc75e@cogentembedded.com>
 <e5dea828-5f4c-e88e-034a-163d98e5f522@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5dea828-5f4c-e88e-034a-163d98e5f522@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 12, 2018 at 11:14:14PM +0300, Sergei Shtylyov wrote:
> There's no good reason for the sh_cmt_of_table[] initializer to
> violate the 80-column limit, especially after the commit 8d50e9476bb4
> ("clocksource/drivers/sh_cmt: Mark "renesas,cmt-48-gen2" deprecated")
> partially fixed it -- fix the R-Car gen2 related entries as well.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> 
> ---
> Changes in version 2:
> - refreshed the patch;
> - added Chris' and Geert's tags.
> 
>  drivers/clocksource/sh_cmt.c |   10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> Index: tip/drivers/clocksource/sh_cmt.c
> ===================================================================
> --- tip.orig/drivers/clocksource/sh_cmt.c
> +++ tip/drivers/clocksource/sh_cmt.c
> @@ -935,8 +935,14 @@ static const struct of_device_id sh_cmt_
>  		.compatible = "renesas,cmt-48-gen2",
>  		.data = &sh_cmt_info[SH_CMT0_RCAR_GEN2]
>  	},
> -	{ .compatible = "renesas,rcar-gen2-cmt0", .data = &sh_cmt_info[SH_CMT0_RCAR_GEN2] },
> -	{ .compatible = "renesas,rcar-gen2-cmt1", .data = &sh_cmt_info[SH_CMT1_RCAR_GEN2] },
> +	{
> +		.compatible = "renesas,rcar-gen2-cmt0",
> +		.data = &sh_cmt_info[SH_CMT0_RCAR_GEN2]
> +	},
> +	{
> +		.compatible = "renesas,rcar-gen2-cmt1",
> +		.data = &sh_cmt_info[SH_CMT1_RCAR_GEN2]
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, sh_cmt_of_table);
> 
