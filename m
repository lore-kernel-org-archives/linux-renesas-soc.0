Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48763 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728601AbeGRJbD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jul 2018 05:31:03 -0400
Date: Wed, 18 Jul 2018 10:54:08 +0200
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v3 4/4] mmc: renesas_sdhi: skip SCC error check when
 retuning
Message-ID: <20180718085408.eydhelufuhgtyhxj@verge.net.au>
References: <20180717145216.16840-1-niklas.soderlund+renesas@ragnatech.se>
 <20180717145216.16840-5-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180717145216.16840-5-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Tue, Jul 17, 2018 at 04:52:16PM +0200, Niklas Söderlund wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> 
> Checking for SCC error during retuning is unnecessary.
> 
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> [Niklas: fix small style issue]
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> ---
> 
> * Changes since v2
> - Added check for HS400 as it's now merged.
> - Added tags from Wolfram.
> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 777e32b0e410e850..a21b347424f67c52 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -444,6 +444,14 @@ static bool renesas_sdhi_check_scc_error(struct tmio_mmc_host *host)
>  {
>  	struct renesas_sdhi *priv = host_to_priv(host);
>  
> +	if (!(host->mmc->ios.timing == MMC_TIMING_UHS_SDR104) &&
> +	    !(host->mmc->ios.timing == MMC_TIMING_MMC_HS200) &&
> +	    !(host->mmc->ios.timing == MMC_TIMING_MMC_HS400))

According to the BSP this needs to differentiate between 4tap and 8tap
variants of HS400 support.

> +		return false;
> +
> +	if (host->mmc->doing_retune)
> +		return false;
> +
>  	/* Check SCC error */
>  	if (sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL) &
>  	    SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN &&
> -- 
> 2.18.0
> 
