Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:39526 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbeK2Xai (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 18:30:38 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 08/13] clk: renesas: r8a77990: Correct parent clock of DU
Date: Thu, 29 Nov 2018 14:25:52 +0200
Message-ID: <1579147.G3PS2VnPk8@avalon>
In-Reply-To: <20181129105008.10239-9-geert+renesas@glider.be>
References: <20181129105008.10239-1-geert+renesas@glider.be> <20181129105008.10239-9-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thank you for the patch.

On Thursday, 29 November 2018 12:50:03 EET Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> According to the R-Car Gen3 Hardware Manual Rev 1.00, the parent clock
> of the DU module clocks on R-Car E3 is S1D1.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Fixes: 3570a2af473789c5 ("clk: renesas: cpg-mssr: Add support for R-Car E3")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/clk/renesas/r8a77990-cpg-mssr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c
> b/drivers/clk/renesas/r8a77990-cpg-mssr.c index
> 9eb80180eea0b1a6..9a278c75c918cfa8 100644
> --- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> @@ -183,8 +183,8 @@ static const struct mssr_mod_clk r8a77990_mod_clks[]
> __initconst = { DEF_MOD("ehci0",		 703,	R8A77990_CLK_S3D4),
>  	DEF_MOD("hsusb",		 704,	R8A77990_CLK_S3D4),
>  	DEF_MOD("csi40",		 716,	R8A77990_CLK_CSI0),
> -	DEF_MOD("du1",			 723,	R8A77990_CLK_S2D1),
> -	DEF_MOD("du0",			 724,	R8A77990_CLK_S2D1),
> +	DEF_MOD("du1",			 723,	R8A77990_CLK_S1D1),
> +	DEF_MOD("du0",			 724,	R8A77990_CLK_S1D1),
>  	DEF_MOD("lvds",			 727,	R8A77990_CLK_S2D1),
> 
>  	DEF_MOD("vin5",			 806,	R8A77990_CLK_S1D2),

-- 
Regards,

Laurent Pinchart
