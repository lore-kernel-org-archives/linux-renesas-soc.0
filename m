Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:49816 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729445AbeG0KNh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jul 2018 06:13:37 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Dan Williams <dan.j.williams@intel.com>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dmaengine: rcar-dmac: Make rcar_dmac_of_xlate() more robust
Date: Fri, 27 Jul 2018 11:53:17 +0300
Message-ID: <1565818.ujc0qXmH5O@avalon>
In-Reply-To: <20180727084447.13984-1-geert+renesas@glider.be>
References: <20180727084447.13984-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thank you for the patch.

On Friday, 27 July 2018 11:44:47 EEST Geert Uytterhoeven wrote:
> Add an upper bound check for the MID/RID value passed from DT via the
> DMA spec.
> 
> This avoids writing to reserved bits in the DMARS registers in case of
> an out-of-range value in DT.

Is this really useful ? In the normal case, when information in DT is correct, 
this will just add overhead. What do we really want to guard against ? If we 
merge this change, how much further do we need to go ? What other values 
provided in DT, such as reg addresses, do we need to validate them too ? 
Functionally speaking this change does no harm, but it increases the kernel 
size, add overhead at runtime, and only addresses a very limited range of 
invalid DT issues.

> Suggested-by: Renesas BSP team via Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> Signed-off-by: Geert Uytterhoeven
> <geert+renesas@glider.be>
> ---
>  drivers/dma/sh/rcar-dmac.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 72572320208dbb9a..73cf1053bed90244 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -1644,8 +1644,11 @@ static struct dma_chan *rcar_dmac_of_xlate(struct
> of_phandle_args *dma_spec, struct dma_chan *chan;
>  	dma_cap_mask_t mask;
> 
> -	if (dma_spec->args_count != 1)
> +	if (dma_spec->args_count != 1 || dma_spec->args[0] > 0xff) {
> +		pr_info("%s: invalid MID/RID 0x%x... for %pOF\n", __func__,
> +			dma_spec->args[0], dma_spec->np);
>  		return NULL;
> +	}
> 
>  	/* Only slave DMA channels can be allocated via DT */
>  	dma_cap_zero(mask);

-- 
Regards,

Laurent Pinchart
