Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:53148 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbeHULte (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Aug 2018 07:49:34 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: geert@linux-m68k.org, ulrich.hecht+renesas@gmail.com,
        kieran.bingham+renesas@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC/RTF] drm: rcar-du: lvds: Handle LVDS interface reset
Date: Tue, 21 Aug 2018 11:31:17 +0300
Message-ID: <2478883.mieEtpgdTJ@avalon>
In-Reply-To: <1533133596-8068-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1533133596-8068-1-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Jacopo,

Thank you for the patch.

On Wednesday, 1 August 2018 17:26:36 EEST Jacopo Mondi wrote:
> The processor manual prescribes to clear reset of LVDS interface in CPG/MSSR
> module before display on, and to assert the same reset line at display off
> time, to have the module resuming in a known state.
> 
> The module is said to be in "standby state" at initialization time, and this
> requires, according to section 37.3.7 of the manual, to de-assert the reset
> to have it functional.
> 
> Based on the original patch from
> Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> ---
> This patch upports commit:
> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit
> / ?id=23b62b82a5a705d28ddac1d973ee98e6f51d54ea
> 
> Even without this patch the LVDS interface has been succesfully tested on
> V3M/Eagle boards, and this makes me wonder on the real need for reset to
> be handled by the driver.
> 
> I've been able to 'test' the reset assertion/deassertion on Draak, whose
> LVDS interface is not yet being enabled due to missing LVDS PLL support. If
> someone with a V3M/Eagle could test this to make sure this doesn't break
> anything, we can then discuss on the real need for this patch to be
> mainlined.
> 
> Also, a series of patches to add reset to R8A7795/R8A7796/R8A77965 LVDS
> device nodes will be upported if this patch is considered useful.

I think we can upstream DT changes regardless of whether we merge this patch, 
as the reset lines exist, so it makes sense to have them in DT.

> For the interested ones (Laurent, Geert) reset de-assertion at display on
> time takes in average a hundreds of micro seconds.

Not very long, but still, if not need, I'd rather avoid it.

My understanding is that resetting the LVDS encoder is recommended "just in 
case" something goes wrong, but isn't needed in the general case. The question 
is thus in my opinion whether something can go wrong if we otherwise handle 
the LVDS controller according to the recommended procedure.

>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> b/drivers/gpu/drm/rcar-du/rcar_lvds.c index 20e8c34..acf4238 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -14,6 +14,7 @@
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>
>  #include <linux/slab.h>
> 
>  #include <drm/drm_atomic.h>
> @@ -53,6 +54,7 @@ struct rcar_lvds {
> 
>  	void __iomem *mmio;
>  	struct clk *clock;
> +	struct reset_control *rst;
>  	bool enabled;
> 
>  	struct drm_display_mode display_mode;
> @@ -175,6 +177,12 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
> if (ret < 0)
>  		return;
> 
> +	ret = reset_control_deassert(lvds->rst);
> +	if (ret < 0) {
> +		clk_disable_unprepare(lvds->clock);
> +		return;
> +	}
> +
>  	/*
>  	 * Hardcode the channels and control signals routing for now.
>  	 *
> @@ -265,6 +273,7 @@ static void rcar_lvds_disable(struct drm_bridge *bridge)
> rcar_lvds_write(lvds, LVDCR0, 0);
>  	rcar_lvds_write(lvds, LVDCR1, 0);
> 
> +	reset_control_assert(lvds->rst);
>  	clk_disable_unprepare(lvds->clock);
> 
>  	lvds->enabled = false;
> @@ -481,6 +490,12 @@ static int rcar_lvds_probe(struct platform_device
> *pdev) return PTR_ERR(lvds->clock);
>  	}
> 
> +	lvds->rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(lvds->rst)) {
> +		dev_err(&pdev->dev, "failed to get reset\n");
> +		return PTR_ERR(lvds->rst);
> +	}
> +
>  	drm_bridge_add(&lvds->bridge);
> 
>  	return 0;

-- 
Regards,

Laurent Pinchart
