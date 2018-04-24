Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:36181 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750770AbeDXPPg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 11:15:36 -0400
MIME-Version: 1.0
In-Reply-To: <1522856931-6225-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1522856931-6225-1-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Apr 2018 17:15:33 +0200
Message-ID: <CAMuHMdUWQrHR0Ue3OYxAtvnV+rBFb4pG5TPTCYYJy0YN5CMw0Q@mail.gmail.com>
Subject: Re: [PATCH v2] serial: sh-sci: Support for HSCIF RX sampling point adjustment
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, linux-serial@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, Greg KH <greg@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On Wed, Apr 4, 2018 at 5:48 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> HSCIF has facilities that allow moving the RX sampling point by between
> -8 and 7 sampling cycles (one sampling cycles equals 1/15 of a bit
> by default) to improve the error margin in case of slightly mismatched
> bit rates between sender and receiver.
>
> This patch tries to determine if shifting the sampling point can improve
> the error margin and will enable it if so.
>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
> This revision dumps the sysfs interface and works out the optimal shift
> on its own. It also moves setting of the HSSRR register back to its
> original location.

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

One suggestion for improvement below.

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c

> @@ -2406,8 +2427,27 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
>                 serial_port_out(port, SCSCR, scr_val | s->hscif_tot);
>                 serial_port_out(port, SCSMR, smr_val);
>                 serial_port_out(port, SCBRR, brr);
> -               if (sci_getreg(port, HSSRR)->size)
> -                       serial_port_out(port, HSSRR, srr | HSCIF_SRE);
> +               if (sci_getreg(port, HSSRR)->size) {
> +                       unsigned int hssrr = srr | HSCIF_SRE;
> +                       /* Calculate deviation from intended rate at the
> +                        * center of the last stop bit in sampling clocks.
> +                        */
> +                       int last_stop = bits * 2 - 1;
> +                       int deviation = min_err * srr * last_stop / 2 / baud;

DIV_ROUND_CLOSEST()?

> +
> +                       if (abs(deviation) >= 2) {
> +                               /* At least two sampling clocks off at the
> +                                * last stop bit; we can increase the error
> +                                * margin by shifting the sampling point.
> +                                */
> +                               int shift = min(-8, max(7, deviation / 2));
> +
> +                               hssrr |= (shift << HSCIF_SRHP_SHIFT) &
> +                                        HSCIF_SRHP_MASK;
> +                               hssrr |= HSCIF_SRDE;
> +                       }
> +                       serial_port_out(port, HSSRR, hssrr);
> +               }
>
>                 /* Wait one bit interval */
>                 udelay((1000000 + (baud - 1)) / baud);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
