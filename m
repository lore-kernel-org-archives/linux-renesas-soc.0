Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48912 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732461AbeGKO7S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jul 2018 10:59:18 -0400
Date: Wed, 11 Jul 2018 16:54:30 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: Re: [PATCH v2 3/3] serial: sh-sci: Stop using deprecated
 dmaengine_terminate_all()
Message-ID: <20180711145429.ns433oiw2nvjkt3g@verge.net.au>
References: <20180706090543.31625-1-geert+renesas@glider.be>
 <20180706090543.31625-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180706090543.31625-4-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jul 06, 2018 at 11:05:43AM +0200, Geert Uytterhoeven wrote:
> As of commit b36f09c3c441a6e5 ("dmaengine: Add transfer termination
> synchronization support"), dmaengine_terminate_all() is deprecated.
> 
> Replace calls to dmaengine_terminate_all() in DMA release code by calls
> to dmaengine_terminate_sync(), as the latter waits until all running
> completion callbacks have finished.
> 
> Replace calls to dmaengine_terminate_all() in DMA failure paths by calls
> to dmaengine_terminate_async(), as these are usually done in atomic
> context.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

I see this series has been applied, but FWIW

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>


> ---
> v2:
>   - No changes.
> ---
>  drivers/tty/serial/sh-sci.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 939749073e7bdb11..360664a9adf66632 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -1220,7 +1220,7 @@ static void sci_rx_dma_release(struct sci_port *s)
>  
>  	s->chan_rx_saved = s->chan_rx = NULL;
>  	s->cookie_rx[0] = s->cookie_rx[1] = -EINVAL;
> -	dmaengine_terminate_all(chan);
> +	dmaengine_terminate_sync(chan);
>  	dma_free_coherent(chan->device->dev, s->buf_len_rx * 2, s->rx_buf[0],
>  			  sg_dma_address(&s->sg_rx[0]));
>  	dma_release_channel(chan);
> @@ -1296,7 +1296,7 @@ static void sci_tx_dma_release(struct sci_port *s)
>  	cancel_work_sync(&s->work_tx);
>  	s->chan_tx_saved = s->chan_tx = NULL;
>  	s->cookie_tx = -EINVAL;
> -	dmaengine_terminate_all(chan);
> +	dmaengine_terminate_sync(chan);
>  	dma_unmap_single(chan->device->dev, s->tx_dma_addr, UART_XMIT_SIZE,
>  			 DMA_TO_DEVICE);
>  	dma_release_channel(chan);
> @@ -1334,7 +1334,7 @@ static void sci_submit_rx(struct sci_port *s)
>  
>  fail:
>  	if (i)
> -		dmaengine_terminate_all(chan);
> +		dmaengine_terminate_async(chan);
>  	for (i = 0; i < 2; i++)
>  		s->cookie_rx[i] = -EINVAL;
>  	s->active_rx = -EINVAL;
> @@ -1452,7 +1452,7 @@ static enum hrtimer_restart rx_timer_fn(struct hrtimer *t)
>  	}
>  
>  	/* Handle incomplete DMA receive */
> -	dmaengine_terminate_all(s->chan_rx);
> +	dmaengine_terminate_async(s->chan_rx);
>  	read = sg_dma_len(&s->sg_rx[active]) - state.residue;
>  
>  	if (read) {
> -- 
> 2.17.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-sh" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
