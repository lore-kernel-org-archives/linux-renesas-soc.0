Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.22]:34500 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728372AbeKHMjI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 07:39:08 -0500
Date: Thu, 8 Nov 2018 04:05:44 +0100 (CET)
From: Ulrich Hecht <uli@fpond.eu>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc: Ulrich Hecht <uli+renesas@fpond.eu>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Message-ID: <664805065.671511.1541646344907@webmail.strato.com>
In-Reply-To: <20181107133731.13058-1-geert+renesas@glider.be>
References: <20181107133731.13058-1-geert+renesas@glider.be>
Subject: Re: [PATCH] serial: sh-sci: Improve type-safety calling
 sci_receive_chars()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Thanks for your patch!

> On November 7, 2018 at 2:37 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
> 
> While ptr and port both point to the uart_port structure, the former is
> the untyped pointer cookie passed to interrupt handlers.
> Use the correctly typed port variable instead, to improve type-safety.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/tty/serial/sh-sci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 8863689a6eebcc72..f1ee992532717a34 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -1710,7 +1710,7 @@ static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
>  	 * of whether the I_IXOFF is set, otherwise, how is the interrupt
>  	 * to be disabled?
>  	 */
> -	sci_receive_chars(ptr);
> +	sci_receive_chars(port);
>  
>  	return IRQ_HANDLED;
>  }
> @@ -1766,7 +1766,7 @@ static irqreturn_t sci_er_interrupt(int irq, void *ptr)
>  	} else {
>  		sci_handle_fifo_overrun(port);
>  		if (!s->chan_rx)
> -			sci_receive_chars(ptr);
> +			sci_receive_chars(port);
>  	}
>  
>  	sci_clear_SCxSR(port, SCxSR_ERROR_CLEAR(port));
> -- 
> 2.17.1
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
