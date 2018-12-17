Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0A5C43612
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:29:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BB8DA21473
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:29:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="CtnW8Fsh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732785AbeLQN3m (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 08:29:42 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:40711 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732530AbeLQN3m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 08:29:42 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C24A125B781;
        Tue, 18 Dec 2018 00:29:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545053379; bh=xypDDjMg9YhIZ3visNpeM3MCAQPnHFx8ANqY3CCId5w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CtnW8FshpzbgY4UjPCT845TgFlpVkukyHcCn6/aiUVr4Iqjg6Av/3ZMKN5wtApHaP
         smE0td+TG1vCM+gmon6NVFFSOPUT0HqvChmpYClmUJwpeYrjnYhxIiyLdpJRNN9F4N
         dAG5CO4bdHWt1g/Dkl2xny3YCL6+0Yw3ku1CNsWU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C062D94048A; Mon, 17 Dec 2018 14:29:36 +0100 (CET)
Date:   Mon, 17 Dec 2018 14:29:36 +0100
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
Subject: Re: [PATCH v4 4/4] serial: sh-sci: Fix fallback to PIO in
 sci_dma_rx_complete()
Message-ID: <20181217132935.iacsscmao22wf4jx@verge.net.au>
References: <20181213184444.21904-1-geert+renesas@glider.be>
 <20181213184444.21904-5-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213184444.21904-5-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 07:44:44PM +0100, Geert Uytterhoeven wrote:
> When submitting a DMA request fails in sci_dma_rx_complete(), the driver
> tries to fall back to PIO, but that does not work: no more data will be
> received, or the kernel will even crash.
> 
> Fix this similar as in (but not identical to) sci_submit_rx():
>   - On SCIF, PIO cannot take over if any DMA transactions are pending,
>     hence they must be terminated first.
>   - All active cookies must be invalidated, else rx_timer_fn() may
>     trigger a NULL pointer dereference.
>   - Restarting the port is not needed, as it is already running, but
>     serial port interrupts must be directed back from the DMA engine to
>     the CPU.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4:
>   - No changes,
> 
> v3:
>   - Add missing definition of "u16 scr",
>   - Move call to dmaengine_terminate_async() inside the spinlock, for
>     symmetry with sci_submit_rx(),
>   - Split in multiple patches.
> ---
>  drivers/tty/serial/sh-sci.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 8df0fd8245203f8b..44c29ce3fcc5d894 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -1272,6 +1272,8 @@ static void sci_dma_rx_complete(void *arg)
>  	struct dma_async_tx_descriptor *desc;
>  	unsigned long flags;
>  	int active, count = 0;
> +	unsigned int i;
> +	u16 scr;
>  
>  	dev_dbg(port->dev, "%s(%d) active cookie %d\n", __func__, port->line,
>  		s->active_rx);
> @@ -1313,8 +1315,18 @@ static void sci_dma_rx_complete(void *arg)
>  	dev_warn(port->dev, "Failed submitting Rx DMA descriptor\n");
>  	/* Switch to PIO */
>  	spin_lock_irqsave(&port->lock, flags);
> +	dmaengine_terminate_async(chan);
> +	for (i = 0; i < 2; i++)
> +		s->cookie_rx[i] = -EINVAL;

Invalidating cookie_rx already appears twice, in two different forms.
Perhaps a helper is appropriate.

> +	s->active_rx = 0;
>  	s->chan_rx = NULL;
> -	sci_start_rx(port);
> +	/* Direct new serial port interrupts back to CPU */
> +	scr = serial_port_in(port, SCSCR);
> +	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
> +		scr &= ~SCSCR_RDRQE;
> +		enable_irq(s->irqs[SCIx_RXI_IRQ]);
> +	}
> +	serial_port_out(port, SCSCR, scr | SCSCR_RIE);

Likewise, logic ti redirect interrupts seems to already be present in
rx_timer_fn().

>  	spin_unlock_irqrestore(&port->lock, flags);
>  }
>  
> -- 
> 2.17.1
> 
