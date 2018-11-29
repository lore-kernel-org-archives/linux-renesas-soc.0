Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:39682 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727040AbeK2XdV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 18:33:21 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 09/13] clk: renesas: r8a77995: Correct parent clock of DU
Date: Thu, 29 Nov 2018 14:28:35 +0200
Message-ID: <2350048.0LZWSkXjt6@avalon>
In-Reply-To: <20181129105008.10239-10-geert+renesas@glider.be>
References: <20181129105008.10239-1-geert+renesas@glider.be> <20181129105008.10239-10-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thank you for the patch.

On Thursday, 29 November 2018 12:50:04 EET Geert Uytterhoeven wrote:
> According to the R-Car Gen3 Hardware Manual Rev 1.00, the parent clock
> of the DU module clocks on R-Car D3 is S1D1.
> 
> Fixes: d71e851d82c6cfe5 ("clk: renesas: cpg-mssr: Add R8A77995 support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The patch has no effect on the DU operation as the rcar-du driver hardcodes a 
different clock source for the dot clock. However, after hacking the driver to 
hardcode usage of this clock, operation off the LVDS output is improved. I 
thus believe this change to be correct in addition to not having any effect 
with the current mainline code :-)

Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/clk/renesas/r8a77995-cpg-mssr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c
> b/drivers/clk/renesas/r8a77995-cpg-mssr.c index
> 47e60e3dbe05ff18..ad95dc225e9c039a 100644
> --- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
> @@ -146,8 +146,8 @@ static const struct mssr_mod_clk r8a77995_mod_clks[]
> __initconst = { DEF_MOD("vspbs",		 627,	R8A77995_CLK_S0D1),
>  	DEF_MOD("ehci0",		 703,	R8A77995_CLK_S3D2),
>  	DEF_MOD("hsusb",		 704,	R8A77995_CLK_S3D2),
> -	DEF_MOD("du1",			 723,	R8A77995_CLK_S2D1),
> -	DEF_MOD("du0",			 724,	R8A77995_CLK_S2D1),
> +	DEF_MOD("du1",			 723,	R8A77995_CLK_S1D1),
> +	DEF_MOD("du0",			 724,	R8A77995_CLK_S1D1),
>  	DEF_MOD("lvds",			 727,	R8A77995_CLK_S2D1),
>  	DEF_MOD("vin7",			 804,	R8A77995_CLK_S1D2),
>  	DEF_MOD("vin6",			 805,	R8A77995_CLK_S1D2),

-- 
Regards,

Laurent Pinchart
