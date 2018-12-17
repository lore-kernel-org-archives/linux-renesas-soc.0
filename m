Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1003BC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:17:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D30E32133F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:17:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="O3TwbRU7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732688AbeLQNR5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 08:17:57 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:40484 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727464AbeLQNR5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 08:17:57 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9A64325B781;
        Tue, 18 Dec 2018 00:17:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545052674; bh=ZQPTUCkkipnCyPUN7mERJVxjh8EvNYId1ISKWtHgR88=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O3TwbRU7su/FarWB2MNakpje8qs09tccJmDDidWD/ZWaQwY53wWxlMu/ZB9W54IaJ
         czKCUHQHYsFNBrQ4pBoog3CDmLPs5TEqdcAxNNH2Jzm08Xet9FJHoC8Nf8q8jsvNLv
         DFgCgleL4RZ8ZxA9Rfnv4gKi4uof73542X//PBG4=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 96BF394048A; Mon, 17 Dec 2018 14:17:52 +0100 (CET)
Date:   Mon, 17 Dec 2018 14:17:52 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 1/4] serial: sh-sci: Fix locking in sci_submit_rx()
Message-ID: <20181217131751.pyhstvri6yustm6v@verge.net.au>
References: <20181213184444.21904-1-geert+renesas@glider.be>
 <20181213184444.21904-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213184444.21904-2-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 07:44:41PM +0100, Geert Uytterhoeven wrote:
> Some callers of sci_submit_rx() hold the port spinlock, others don't.
> During fallback to PIO, the driver needs to obtain the port spinlock.
> If the lock was already held, spinlock recursion is detected, causing a
> deadlock: BUG: spinlock recursion on CPU#0.
> 
> Fix this by adding a flag parameter to sci_submit_rx() for the caller to
> indicate the port spinlock is already held, so spinlock recursion can be
> avoided.
> 
> Move the spin_lock_irqsave() up, so all DMA disable steps are protected,
> which is safe as the recently introduced dmaengine_terminate_async() can
> be called in atomic context.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> v4:
>   - No changes,
> 
> v3:
>   - Split in multiple patches.
> ---
>  drivers/tty/serial/sh-sci.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 8146d9cef0cbe2d0..2a08039f792235e5 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -1331,7 +1331,7 @@ static void sci_tx_dma_release(struct sci_port *s)
>  	dma_release_channel(chan);
>  }
>  
> -static void sci_submit_rx(struct sci_port *s)
> +static void sci_submit_rx(struct sci_port *s, bool port_lock_held)
>  {
>  	struct dma_chan *chan = s->chan_rx;
>  	struct uart_port *port = &s->port;
> @@ -1362,16 +1362,18 @@ static void sci_submit_rx(struct sci_port *s)
>  	return;
>  
>  fail:
> +	/* Switch to PIO */
> +	if (!port_lock_held)
> +		spin_lock_irqsave(&port->lock, flags);
>  	if (i)
>  		dmaengine_terminate_async(chan);
>  	for (i = 0; i < 2; i++)
>  		s->cookie_rx[i] = -EINVAL;
>  	s->active_rx = -EINVAL;
> -	/* Switch to PIO */
> -	spin_lock_irqsave(&port->lock, flags);
>  	s->chan_rx = NULL;
>  	sci_start_rx(port);
> -	spin_unlock_irqrestore(&port->lock, flags);
> +	if (!port_lock_held)
> +		spin_unlock_irqrestore(&port->lock, flags);
>  }
>  
>  static void work_fn_tx(struct work_struct *work)
> @@ -1491,7 +1493,7 @@ static enum hrtimer_restart rx_timer_fn(struct hrtimer *t)
>  	}
>  
>  	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
> -		sci_submit_rx(s);
> +		sci_submit_rx(s, true);
>  
>  	/* Direct new serial port interrupts back to CPU */
>  	scr = serial_port_in(port, SCSCR);
> @@ -1617,7 +1619,7 @@ static void sci_request_dma(struct uart_port *port)
>  		s->chan_rx_saved = s->chan_rx = chan;
>  
>  		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
> -			sci_submit_rx(s);
> +			sci_submit_rx(s, false);
>  	}
>  }
>  
> @@ -1667,7 +1669,7 @@ static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
>  			scr |= SCSCR_RDRQE;
>  		} else {
>  			scr &= ~SCSCR_RIE;
> -			sci_submit_rx(s);
> +			sci_submit_rx(s, false);
>  		}
>  		serial_port_out(port, SCSCR, scr);
>  		/* Clear current interrupt */
> -- 
> 2.17.1
> 
