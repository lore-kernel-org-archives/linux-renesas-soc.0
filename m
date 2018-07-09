Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:59174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933415AbeGIRXc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Jul 2018 13:23:32 -0400
Date: Mon, 9 Jul 2018 22:53:24 +0530
From: Vinod <vkoul@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dma: sh: rcar-dmac: avoid to write CHCR.TE to 1 if TCR
 is set to 0
Message-ID: <20180709172324.GM22377@vkoul-mobl>
References: <1530523083-2106-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1530523083-2106-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02-07-18, 18:18, Yoshihiro Shimoda wrote:
> This patch fixes an issue that unexpected retransfering happens
> if TCR is set to 0 before rcar_dmac_sync_tcr() writes DE bit to
> the CHCR register. For example, sh-sci driver can reproduce this
> issue like below:
> 
>  In rx_timer_fn():		/* CHCR DE bit may be set to 1 */
>   dmaengine_tx_status()
>    rcar_dmac_tx_status()
>     rcar_dmac_chan_get_residue()
>      rcar_dmac_sync_tcr()	/* TCR is possible to be set to 0 */
> 
> According to the description of commit 73a47bd0da66 ("dmaengine:
> rcar-dmac: use TCRB instead of TCR for residue"), "this buffered data
> will be transferred if CHCR::DE bit was cleared". So, this patch
> doesn't need to check TCRB register.
> 
> Fixes: 73a47bd0da66 ("dmaengine: rcar-dmac: use TCRB instead of TCR for residue")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  This patch is based on the latest slave-dma / fixes branch.
> 
>  This issue can be reproduced by the following commands on r8a7795
> Salvator-XS and Windows Teraterm :) :
>  # stty 921600
>  (Change Teraterm baud rate)
>  # cat > rx.txt
>  (Send 5MiB file by Teraterm. After a few minutes later, we cannot
>   input any commands by the serial console.)

Ack/tested-by ..?

> 
>  drivers/dma/sh/rcar-dmac.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
> index 2a2ccd9..8305a1c 100644
> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -774,8 +774,9 @@ static void rcar_dmac_sync_tcr(struct rcar_dmac_chan *chan)
>  	/* make sure all remaining data was flushed */
>  	rcar_dmac_chcr_de_barrier(chan);
>  
> -	/* back DE */
> -	rcar_dmac_chan_write(chan, RCAR_DMACHCR, chcr);
> +	/* back DE if remain data exists */
> +	if (rcar_dmac_chan_read(chan, RCAR_DMATCR))
> +		rcar_dmac_chan_write(chan, RCAR_DMACHCR, chcr);
>  }
>  
>  static void rcar_dmac_chan_halt(struct rcar_dmac_chan *chan)
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe dmaengine" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
~Vinod
