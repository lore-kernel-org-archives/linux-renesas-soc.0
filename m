Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43064 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbeIUNPi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Sep 2018 09:15:38 -0400
Date: Fri, 21 Sep 2018 09:27:59 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: r8a77970: add TPU clock
Message-ID: <20180921072758.3gz5icbxbd3uyui4@verge.net.au>
References: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com>
 <53539d21-bb00-eb11-bfde-206f3b7e3fe0@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53539d21-bb00-eb11-bfde-206f3b7e3fe0@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 19, 2018 at 09:10:40PM +0300, Sergei Shtylyov wrote:
> The TPU0 clock wasn't present in the original R8A77970 patch by Daisuke
> Matsushita, it was added in a later BSP version...
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> 
> ---
> This patch is against the 'clk-renesas' branch of Geert's 'renesas-drivers.git'
> repo...
> 
>  drivers/clk/renesas/r8a77970-cpg-mssr.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> Index: renesas-drivers/drivers/clk/renesas/r8a77970-cpg-mssr.c
> ===================================================================
> --- renesas-drivers.orig/drivers/clk/renesas/r8a77970-cpg-mssr.c
> +++ renesas-drivers/drivers/clk/renesas/r8a77970-cpg-mssr.c
> @@ -127,6 +127,7 @@ static const struct mssr_mod_clk r8a7797
>  	DEF_MOD("cmt2",			 301,	R8A77970_CLK_R),
>  	DEF_MOD("cmt1",			 302,	R8A77970_CLK_R),
>  	DEF_MOD("cmt0",			 303,	R8A77970_CLK_R),
> +	DEF_MOD("tpu0",			 304,	R8A77970_CLK_S2D4),
>  	DEF_MOD("sd-if",		 314,	R8A77970_CLK_SD0),
>  	DEF_MOD("rwdt",			 402,	R8A77970_CLK_R),
>  	DEF_MOD("intc-ex",		 407,	R8A77970_CLK_CP),
> 
