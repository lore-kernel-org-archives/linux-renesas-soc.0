Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD2BC43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 12:51:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B20E6206B6
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 12:51:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730030AbfAIMvL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 07:51:11 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.168]:34674 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729955AbfAIMvL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 07:51:11 -0500
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp05-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.9 AUTH)
        with ESMTPSA id V028b8v09Cp8Iel
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 9 Jan 2019 13:51:08 +0100 (CET)
Date:   Wed, 9 Jan 2019 13:51:08 +0100 (CET)
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
Message-ID: <738673847.1196230.1547038268445@webmail.strato.com>
In-Reply-To: <20190107162320.15530-4-geert+renesas@glider.be>
References: <20190107162320.15530-1-geert+renesas@glider.be>
 <20190107162320.15530-4-geert+renesas@glider.be>
Subject: Re: [PATCH v5 3/4] serial: sh-sci: Fix fallback to PIO in
 sci_dma_rx_complete()
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
> v5:
>   - Call new helpers sci_dma_rx_chan_invalidate() and
>     sci_dma_rx_reenable_irq() instead of open-coding,
> 
> v4:
>   - No changes,
> 
> v3:
>   - Add missing definition of "u16 scr",
>   - Move call to dmaengine_terminate_async() inside the spinlock, for
>     symmetry with sci_submit_rx(),
>   - Split in multiple patches.
> ---
>  drivers/tty/serial/sh-sci.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 4d814c30c4189b56..891833315698b953 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -1337,8 +1337,9 @@ static void sci_dma_rx_complete(void *arg)
>  	dev_warn(port->dev, "Failed submitting Rx DMA descriptor\n");
>  	/* Switch to PIO */
>  	spin_lock_irqsave(&port->lock, flags);
> -	s->chan_rx = NULL;
> -	sci_start_rx(port);
> +	dmaengine_terminate_async(chan);
> +	sci_dma_rx_chan_invalidate(s);
> +	sci_dma_rx_reenable_irq(s);
>  	spin_unlock_irqrestore(&port->lock, flags);
>  }
>  
> -- 
> 2.17.1
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
