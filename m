Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:36401 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934125AbdAFK5w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jan 2017 05:57:52 -0500
MIME-Version: 1.0
In-Reply-To: <20170103230639.19660-18-laurent.pinchart+renesas@ideasonboard.com>
References: <20170103230639.19660-1-laurent.pinchart+renesas@ideasonboard.com> <20170103230639.19660-18-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Jan 2017 11:57:48 +0100
Message-ID: <CAMuHMdVw+1n=yNm7mDhDmdgShKQ5Ef74=k-i+kgaDL8VKBuqCg@mail.gmail.com>
Subject: Re: [PATCH 17/19] serial: sh-sci: Remove manual break debouncing
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jan 4, 2017 at 12:06 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The sh-sci driver implements manual break debouncing for a few SH
> platforms by reading the value of the RX pin port register. This feature
> is optional and the driver considers all negative or zero values of the
> platform data port_reg field as invalid. As the four platforms that set
> the field to a register address all use an address higher than
> 0x7fffffff, the driver will always consider the value as invalid and
> never perform debouncing. The feature is unused, remove it.
>
> Debouncing could be implemented properly in the future using the pinctrl
> and GPIO APIs if desired.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/include/linux/serial_sci.h
> +++ b/include/linux/serial_sci.h

> @@ -41,8 +39,6 @@ enum {
>         SCIx_NR_REGTYPES,
>  };
>
> -struct device;
> -

<ignore_me>
Unrelated change (missed in commit 937bb6e4c676 ("serial: sh-sci: don't
filter on DMA device, use only channel ID")
</ignore_me>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
