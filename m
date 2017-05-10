Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54222 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751816AbdEJJa3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2017 05:30:29 -0400
Date: Wed, 10 May 2017 11:30:24 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH 6/6] mmc: sdhi: add CMD23 support to R-Car Gen2 & Gen3
Message-ID: <20170510093024.GD16496@verge.net.au>
References: <20170501090346.10801-1-wsa+renesas@sang-engineering.com>
 <20170501090346.10801-7-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170501090346.10801-7-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 01, 2017 at 11:03:46AM +0200, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/mmc/host/sh_mobile_sdhi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/sh_mobile_sdhi.c b/drivers/mmc/host/sh_mobile_sdhi.c
> index bc6be0dbea3927..4843ce800c918d 100644
> --- a/drivers/mmc/host/sh_mobile_sdhi.c
> +++ b/drivers/mmc/host/sh_mobile_sdhi.c
> @@ -96,7 +96,7 @@ static struct sh_mobile_sdhi_scc rcar_gen2_scc_taps[] = {
>  static const struct sh_mobile_sdhi_of_data of_rcar_gen2_compatible = {
>  	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_WRPROTECT_DISABLE |
>  			  TMIO_MMC_CLK_ACTUAL | TMIO_MMC_MIN_RCAR2,
> -	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ,
> +	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ | MMC_CAP_CMD23,

Breaking capabilities over two lines would seem consistent with the
formatting of the rest of the structure.

>  	.dma_buswidth	= DMA_SLAVE_BUSWIDTH_4_BYTES,
>  	.dma_rx_offset	= 0x2000,
>  	.scc_offset	= 0x0300,
> @@ -115,7 +115,7 @@ static struct sh_mobile_sdhi_scc rcar_gen3_scc_taps[] = {
>  static const struct sh_mobile_sdhi_of_data of_rcar_gen3_compatible = {
>  	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_WRPROTECT_DISABLE |
>  			  TMIO_MMC_CLK_ACTUAL | TMIO_MMC_MIN_RCAR2,
> -	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ,
> +	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ | MMC_CAP_CMD23,
>  	.bus_shift	= 2,
>  	.scc_offset	= 0x1000,
>  	.taps		= rcar_gen3_scc_taps,
> -- 
> 2.11.0
> 
