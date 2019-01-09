Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 035FAC43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 14:42:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 12159206BA
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 14:42:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="Xh0yR+9m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731687AbfAIOmc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 09:42:32 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:34025 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731544AbfAIOmc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 09:42:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1547044948;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=KjF7NHYVq2H5Rjlgc7Ponf7tX/iRoYC7Hmc16WB3vgU=;
        b=Xh0yR+9merQG3QD6F5ksCL+aWABBIcXF7uvzoxdDmEEpyCcO40C5GGe79xv08zN24s
        LQfOiE0u26iOEB1bq6g262OJLhWfyfdRbQo43DforvpuanKMRPciOSxuA8QWj/J4uFFd
        HdL/cUP6O5wKHPE/8Ps+N9CzFwF0R+DwhwzxaQNnRCqOTrSICQjVu+KBinO/T/986GQA
        TRLJSMOVPoyfJ4J65DuHnQzwLGVPetszVHSnegt2gljTfh2TxlgcRXEBUv9NkYRkjR7u
        cJYbkj2QJJLly86xXRhgyvQ6j3Z5Pv9nYbrwrWZT/udSrCcfdNO7P09Di3XSX6cigplq
        IlqA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp05-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.9 AUTH)
        with ESMTPSA id V028b8v09EgQJ7p
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 9 Jan 2019 15:42:26 +0100 (CET)
Date:   Wed, 9 Jan 2019 15:42:26 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org
Message-ID: <1121423889.1222568.1547044946442@webmail.strato.com>
In-Reply-To: <20190107162320.15530-5-geert+renesas@glider.be>
References: <20190107162320.15530-1-geert+renesas@glider.be>
 <20190107162320.15530-5-geert+renesas@glider.be>
Subject: Re: [PATCH v5 4/4] serial: sh-sci: Make RX/TX DMA function names
 consistent
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev47
X-Originating-IP: 85.212.162.185
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On January 7, 2019 at 5:23 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
> 
> Most RX/TX-specific DMA functions are prefixed with "sci_dma_[rt]x_".
> Rename the exceptions to increase consistency.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v5:
>   - New.
> ---
>  drivers/tty/serial/sh-sci.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 891833315698b953..cb3d5d37674f56f2 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -1253,7 +1253,7 @@ static void sci_dma_rx_chan_invalidate(struct sci_port *s)
>  	s->active_rx = 0;
>  }
>  
> -static void sci_rx_dma_release(struct sci_port *s)
> +static void sci_dma_rx_release(struct sci_port *s)
>  {
>  	struct dma_chan *chan = s->chan_rx_saved;
>  
> @@ -1343,7 +1343,7 @@ static void sci_dma_rx_complete(void *arg)
>  	spin_unlock_irqrestore(&port->lock, flags);
>  }
>  
> -static void sci_tx_dma_release(struct sci_port *s)
> +static void sci_dma_tx_release(struct sci_port *s)
>  {
>  	struct dma_chan *chan = s->chan_tx_saved;
>  
> @@ -1356,7 +1356,7 @@ static void sci_tx_dma_release(struct sci_port *s)
>  	dma_release_channel(chan);
>  }
>  
> -static int sci_submit_rx(struct sci_port *s, bool port_lock_held)
> +static int sci_dma_rx_submit(struct sci_port *s, bool port_lock_held)
>  {
>  	struct dma_chan *chan = s->chan_rx;
>  	struct uart_port *port = &s->port;
> @@ -1399,7 +1399,7 @@ static int sci_submit_rx(struct sci_port *s, bool port_lock_held)
>  	return -EAGAIN;
>  }
>  
> -static void work_fn_tx(struct work_struct *work)
> +static void sci_dma_tx_work_fn(struct work_struct *work)
>  {
>  	struct sci_port *s = container_of(work, struct sci_port, work_tx);
>  	struct dma_async_tx_descriptor *desc;
> @@ -1458,7 +1458,7 @@ static void work_fn_tx(struct work_struct *work)
>  	return;
>  }
>  
> -static enum hrtimer_restart rx_timer_fn(struct hrtimer *t)
> +static enum hrtimer_restart sci_dma_rx_timer_fn(struct hrtimer *t)
>  {
>  	struct sci_port *s = container_of(t, struct sci_port, rx_timer);
>  	struct dma_chan *chan = s->chan_rx;
> @@ -1515,7 +1515,7 @@ static enum hrtimer_restart rx_timer_fn(struct hrtimer *t)
>  	}
>  
>  	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
> -		sci_submit_rx(s, true);
> +		sci_dma_rx_submit(s, true);
>  
>  	sci_dma_rx_reenable_irq(s);
>  
> @@ -1595,7 +1595,7 @@ static void sci_request_dma(struct uart_port *port)
>  				__func__, UART_XMIT_SIZE,
>  				port->state->xmit.buf, &s->tx_dma_addr);
>  
> -			INIT_WORK(&s->work_tx, work_fn_tx);
> +			INIT_WORK(&s->work_tx, sci_dma_tx_work_fn);
>  			s->chan_tx_saved = s->chan_tx = chan;
>  		}
>  	}
> @@ -1630,12 +1630,12 @@ static void sci_request_dma(struct uart_port *port)
>  		}
>  
>  		hrtimer_init(&s->rx_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> -		s->rx_timer.function = rx_timer_fn;
> +		s->rx_timer.function = sci_dma_rx_timer_fn;
>  
>  		s->chan_rx_saved = s->chan_rx = chan;
>  
>  		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
> -			sci_submit_rx(s, false);
> +			sci_dma_rx_submit(s, false);
>  	}
>  }
>  
> @@ -1644,9 +1644,9 @@ static void sci_free_dma(struct uart_port *port)
>  	struct sci_port *s = to_sci_port(port);
>  
>  	if (s->chan_tx_saved)
> -		sci_tx_dma_release(s);
> +		sci_dma_tx_release(s);
>  	if (s->chan_rx_saved)
> -		sci_rx_dma_release(s);
> +		sci_dma_rx_release(s);
>  }
>  
>  static void sci_flush_buffer(struct uart_port *port)
> @@ -1684,7 +1684,7 @@ static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
>  			disable_irq_nosync(irq);
>  			scr |= SCSCR_RDRQE;
>  		} else {
> -			if (sci_submit_rx(s, false) < 0)
> +			if (sci_dma_rx_submit(s, false) < 0)
>  				goto handle_pio;
>  
>  			scr &= ~SCSCR_RIE;
> -- 
> 2.17.1
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
