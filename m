Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1E4C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 12:48:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D768F206B6
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 12:48:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730112AbfAIMs4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 07:48:56 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:15728 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729732AbfAIMs4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 07:48:56 -0500
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp05-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.9 AUTH)
        with ESMTPSA id V028b8v09CmsIdo
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 9 Jan 2019 13:48:54 +0100 (CET)
Date:   Wed, 9 Jan 2019 13:48:54 +0100 (CET)
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
Message-ID: <1792061178.1196047.1547038134227@webmail.strato.com>
In-Reply-To: <20190107162320.15530-3-geert+renesas@glider.be>
References: <20190107162320.15530-1-geert+renesas@glider.be>
 <20190107162320.15530-3-geert+renesas@glider.be>
Subject: Re: [PATCH v5 2/4] serial: sh-sci: Extract
 sci_dma_rx_reenable_irq()
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
> Extract the functionality to direct new serial port interrupts back to
> the CPU into its own helper, to prepare for using it from a second
> callsite.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v5:
>   - New.
> ---
>  drivers/tty/serial/sh-sci.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 4c75468680cb547d..4d814c30c4189b56 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -1274,6 +1274,20 @@ static void start_hrtimer_us(struct hrtimer *hrt, unsigned long usec)
>  	hrtimer_start(hrt, t, HRTIMER_MODE_REL);
>  }
>  
> +static void sci_dma_rx_reenable_irq(struct sci_port *s)
> +{
> +	struct uart_port *port = &s->port;
> +	u16 scr;
> +
> +	/* Direct new serial port interrupts back to CPU */
> +	scr = serial_port_in(port, SCSCR);
> +	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
> +		scr &= ~SCSCR_RDRQE;
> +		enable_irq(s->irqs[SCIx_RXI_IRQ]);
> +	}
> +	serial_port_out(port, SCSCR, scr | SCSCR_RIE);
> +}
> +
>  static void sci_dma_rx_complete(void *arg)
>  {
>  	struct sci_port *s = arg;
> @@ -1453,7 +1467,6 @@ static enum hrtimer_restart rx_timer_fn(struct hrtimer *t)
>  	unsigned long flags;
>  	unsigned int read;
>  	int active, count;
> -	u16 scr;
>  
>  	dev_dbg(port->dev, "DMA Rx timed out\n");
>  
> @@ -1503,13 +1516,7 @@ static enum hrtimer_restart rx_timer_fn(struct hrtimer *t)
>  	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
>  		sci_submit_rx(s, true);
>  
> -	/* Direct new serial port interrupts back to CPU */
> -	scr = serial_port_in(port, SCSCR);
> -	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
> -		scr &= ~SCSCR_RDRQE;
> -		enable_irq(s->irqs[SCIx_RXI_IRQ]);
> -	}
> -	serial_port_out(port, SCSCR, scr | SCSCR_RIE);
> +	sci_dma_rx_reenable_irq(s);
>  
>  	spin_unlock_irqrestore(&port->lock, flags);
>  
> -- 
> 2.17.1
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
