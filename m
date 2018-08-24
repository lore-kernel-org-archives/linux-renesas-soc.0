Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:45682 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbeHXM2f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 08:28:35 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nguyen An Hoan <na-hoan@jinso.co.jp>
Cc: broonie@kernel.org, linux-renesas-soc@vger.kernel.org,
        geert+renesas@glider.be, magnus.damm@gmail.com,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
Subject: Re: [PATCH 2/2] clk: renesas: r8a77965: Add FDP clock
Date: Fri, 24 Aug 2018 11:54:53 +0300
Message-ID: <4303416.Kz9Xpi0Tgs@avalon>
In-Reply-To: <1535086349-10657-3-git-send-email-na-hoan@jinso.co.jp>
References: <1535086349-10657-1-git-send-email-na-hoan@jinso.co.jp> <1535086349-10657-3-git-send-email-na-hoan@jinso.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Nguyen An,

Thank you for the patch.

On Friday, 24 August 2018 07:52:29 EEST Nguyen An Hoan wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>

Here too a commit message would be nice.

> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> ---
>  drivers/clk/renesas/r8a77965-cpg-mssr.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c
> b/drivers/clk/renesas/r8a77965-cpg-mssr.c index 312f9fe..d0847dc 100644
> --- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
> @@ -112,6 +112,7 @@ static const struct cpg_core_clk r8a77965_core_clks[]
> __initconst = { };
> 
>  static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
> +	DEF_MOD("fdp0",			119,	R8A77965_CLK_S0D1),

I haven't found information in the datasheet to confirm whether the parent 
clock is correct. As it doesn't matter too much given that the parent clock 
doesn't need to be controlled, and the FDP driver doesn't care about the clock 
frequency, we can start with this without any problem.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	DEF_MOD("scif5",		202,	R8A77965_CLK_S3D4),
>  	DEF_MOD("scif4",		203,	R8A77965_CLK_S3D4),
>  	DEF_MOD("scif3",		204,	R8A77965_CLK_S3D4),

-- 
Regards,

Laurent Pinchart
