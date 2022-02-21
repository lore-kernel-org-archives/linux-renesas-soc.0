Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311F1C433FE
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Feb 2022 17:23:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243459AbiBURYB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Feb 2022 12:24:01 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352849AbiBURYB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 12:24:01 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37284AE77
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 09:23:38 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79574482;
        Mon, 21 Feb 2022 18:23:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645464216;
        bh=NqFJhwQyZcctRvGSCMd+zhukBkUPAuuq4bIRaGLQpwA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UnWZz9+3GfBVY+qqLm9oKm+wGAxQsc0et10mmwWrNb2mO0PmP4NqbnLs7CyiJhyEX
         f7UwEn5I5JchMWg9Gyo+a1W9jwBLgcNA1SKZojb3riJcqYQSvzirkArvv79y2Z0w9B
         n/Rk/vRV1T1wdaPdLnmSv8bykTrU8BudZdsOpKn0=
Date:   Mon, 21 Feb 2022 19:23:27 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: Simplify division/shift logic
Message-ID: <YhPKjzUHVs0N6pj9@pendragon.ideasonboard.com>
References: <aee36069582647a0841ec8b49c4c824f901a3f9f.1645460725.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aee36069582647a0841ec8b49c4c824f901a3f9f.1645460725.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Mon, Feb 21, 2022 at 05:26:15PM +0100, Geert Uytterhoeven wrote:
> "a / (1 << b)" == "a >> b".
> 
> No change in generated code.

If there's no change in generated code, isn't the current code more
readable ? :-)

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 72a272cfc11ee129..30afc1d3482a9670 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -229,7 +229,7 @@ static void rcar_lvds_d3_e3_pll_calc(struct rcar_lvds *lvds, struct clk *clk,
>  				 * the PLL, followed by a an optional fixed /7
>  				 * divider.
>  				 */
> -				fout = fvco / (1 << e) / div7;
> +				fout = (fvco >> e) / div7;
>  				div = max(1UL, DIV_ROUND_CLOSEST(fout, target));
>  				diff = abs(fout / div - target);
>  
> @@ -249,7 +249,7 @@ static void rcar_lvds_d3_e3_pll_calc(struct rcar_lvds *lvds, struct clk *clk,
>  	}
>  
>  done:
> -	output = fin * pll->pll_n / pll->pll_m / (1 << pll->pll_e)
> +	output = (fin * pll->pll_n / pll->pll_m >> pll->pll_e)
>  	       / div7 / pll->div;
>  	error = (long)(output - target) * 10000 / (long)target;
>  

-- 
Regards,

Laurent Pinchart
