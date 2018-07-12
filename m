Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34042 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727057AbeGLNGE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jul 2018 09:06:04 -0400
Date: Thu, 12 Jul 2018 14:56:32 +0200
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v2 2/4] mmc: tmio: Fix SCC error detection
Message-ID: <20180712125632.x3jhkvs7wickqsrd@verge.net.au>
References: <20180705141841.11121-1-niklas.soderlund+renesas@ragnatech.se>
 <20180705141841.11121-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180705141841.11121-3-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 05, 2018 at 04:18:39PM +0200, Niklas Söderlund wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> 
> SDR104 and HS200 need to check for SCC error. If SCC error is detected,
> retuning is necessary.
> 
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> [Niklas: update commit message]
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/mmc/host/tmio_mmc_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 000fa9dff784ecb0..525f16f4e33b01ae 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -919,8 +919,8 @@ static void tmio_mmc_finish_request(struct tmio_mmc_host *host)
>  	if (mrq->cmd->error || (mrq->data && mrq->data->error))
>  		tmio_mmc_abort_dma(host);
>  
> -	if (host->check_scc_error)
> -		host->check_scc_error(host);
> +	if (host->check_scc_error && host->check_scc_error(host))
> +		mrq->cmd->error = -EILSEQ;
>  
>  	/* If SET_BLOCK_COUNT, continue with main command */
>  	if (host->mrq && !mrq->cmd->error) {
> -- 
> 2.17.0
> 
