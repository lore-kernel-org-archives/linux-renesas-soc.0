Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48851 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732321AbeGKO4h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jul 2018 10:56:37 -0400
Date: Wed, 11 Jul 2018 16:51:51 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: Re: [PATCH v2 2/3] serial: sh-sci: Stop TX DMA workqueue during port
 shutdown
Message-ID: <20180711145149.muwetfr2mzbd5dc4@verge.net.au>
References: <20180706090543.31625-1-geert+renesas@glider.be>
 <20180706090543.31625-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180706090543.31625-3-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jul 06, 2018 at 11:05:42AM +0200, Geert Uytterhoeven wrote:
> The transmit DMA workqueue is never stopped, hence the work function may
> be called after the port has been shut down.
> 
> Fix this race condition by cancelling queued work, if any, before DMA
> release.  Don't initialize the work if DMA initialization failed, as it
> won't be used anyway.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - No changes.
> ---
>  drivers/tty/serial/sh-sci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 674dc65454ae0684..939749073e7bdb11 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -1293,6 +1293,7 @@ static void sci_tx_dma_release(struct sci_port *s)
>  {
>  	struct dma_chan *chan = s->chan_tx_saved;
>  
> +	cancel_work_sync(&s->work_tx);
>  	s->chan_tx_saved = s->chan_tx = NULL;
>  	s->cookie_tx = -EINVAL;
>  	dmaengine_terminate_all(chan);
> @@ -1548,10 +1549,9 @@ static void sci_request_dma(struct uart_port *port)
>  				__func__, UART_XMIT_SIZE,
>  				port->state->xmit.buf, &s->tx_dma_addr);
>  
> +			INIT_WORK(&s->work_tx, work_fn_tx);
>  			s->chan_tx_saved = s->chan_tx = chan;

Is it ok that work_fn_tx reads and writes s->work_tx which
is set after the call to INIT_WORK() ?

>  		}
> -
> -		INIT_WORK(&s->work_tx, work_fn_tx);
>  	}
>  
>  	chan = sci_request_dma_chan(port, DMA_DEV_TO_MEM);
> -- 
> 2.17.1
> 
