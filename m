Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:35010 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755210AbcLNOFv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Dec 2016 09:05:51 -0500
MIME-Version: 1.0
In-Reply-To: <1481286971-16667-7-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1481286971-16667-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1481286971-16667-7-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Dec 2016 15:04:56 +0100
Message-ID: <CAMuHMdVO=yawgj8TjMuGx=rBKMiohyDHh=zV5-P1RcX3KK_SWw@mail.gmail.com>
Subject: Re: [PATCH 6/7] serial: sh-sci: make RX FIFO parameters tunable via sysfs
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uli,

On Fri, Dec 9, 2016 at 1:36 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Allows tuning of the RX FIFO fill threshold and timeout. (The latter is
> only applicable to SCIFA and SCIFB).
>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c

> @@ -3193,6 +3262,19 @@ static int sci_probe(struct platform_device *dev)
>         if (ret)
>                 return ret;
>
> +       if (sp->port.fifosize > 1) {
> +               ret = sysfs_create_file(&dev->dev.kobj,
> +                               &dev_attr_rx_fifo_trigger.attr);
> +               if (ret)
> +                       return ret;
> +       }
> +       if (sp->port.type == PORT_SCIFA || sp->port.type ==  PORT_SCIFB) {
> +               ret = sysfs_create_file(&dev->dev.kobj,
> +                               &dev_attr_rx_fifo_timeout.attr);
> +               if (ret)
> +                       return ret;

Returning here may leak the rx_fifo_trigger file created above.

> +       }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
