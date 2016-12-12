Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:35522 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932181AbcLLKV1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2016 05:21:27 -0500
Received: by mail-wm0-f45.google.com with SMTP id a197so54263968wmd.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Dec 2016 02:21:27 -0800 (PST)
Subject: Re: [PATCH 3/7] serial: sh-sci: implement FIFO threshold register
 setting
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org, wsa@the-dreams.de,
        geert@linux-m68k.org
References: <1481286971-16667-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1481286971-16667-4-git-send-email-ulrich.hecht+renesas@gmail.com>
Cc: linux-serial@vger.kernel.org, magnus.damm@gmail.com
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <35290320-6164-e2a9-ed70-7e7a526957b2@cogentembedded.com>
Date: Mon, 12 Dec 2016 13:21:24 +0300
MIME-Version: 1.0
In-Reply-To: <1481286971-16667-4-git-send-email-ulrich.hecht+renesas@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 12/9/2016 3:36 PM, Ulrich Hecht wrote:

> Sets the closest match for a desired RX trigger level.
>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  drivers/tty/serial/sh-sci.c | 55 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index de25db8..844288f 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -1103,6 +1103,61 @@ static int sci_handle_breaks(struct uart_port *port)
>  	return copied;
>  }
>
> +static int scif_set_rtrg(struct uart_port *port, int rx_trig)
> +{
> +	unsigned int bits;
> +
> +	if (rx_trig < 1)
> +		rx_trig = 1;
> +	if (rx_trig >= port->fifosize)
> +		rx_trig = port->fifosize;
> +
> +	/* HSCIF can be set to an arbitrary level. */
> +	if (sci_getreg(port, HSRTRGR)->size) {
> +		serial_port_out(port, HSRTRGR, rx_trig);
> +		return rx_trig;
> +	}
> +
> +	if (port->type == PORT_SCIF) {

    This is asking to be a *switch* statement instead.

> +		if (rx_trig < 4) {
> +			bits = 0;
> +			rx_trig = 1;
> +		} else if (rx_trig < 8) {
> +			bits = SCFCR_RTRG0;
> +			rx_trig = 4;
> +		} else if (rx_trig < 14) {
> +			bits = SCFCR_RTRG1;
> +			rx_trig = 8;
> +		} else {
> +			bits = SCFCR_RTRG0 | SCFCR_RTRG1;
> +			rx_trig = 14;
> +		}
> +	} else if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
> +		if (rx_trig < 16) {
> +			bits = 0;
> +			rx_trig = 1;
> +		} else if (rx_trig < 32) {
> +			bits = SCFCR_RTRG0;
> +			rx_trig = 16;
> +		} else if (rx_trig < 48) {
> +			bits = SCFCR_RTRG1;
> +			rx_trig = 32;
> +		} else {
> +			bits = SCFCR_RTRG0 | SCFCR_RTRG1;
> +			rx_trig = 48;
> +		}
> +	} else {
> +		WARN(1, "unknown FIFO configuration");
> +		return 1;
> +	}

[...]

MBR, Sergei
