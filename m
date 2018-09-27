Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f193.google.com ([209.85.221.193]:45916 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbeI0NzY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Sep 2018 09:55:24 -0400
MIME-Version: 1.0
References: <20180830125404.21192-1-geert+renesas@glider.be>
In-Reply-To: <20180830125404.21192-1-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Sep 2018 09:38:19 +0200
Message-ID: <CAMuHMdWdByKxivbQwWL9yF9_r8XObnZuXEZvf_9ZWKYYLWr1bQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] serial: sh-sci: Fix earlycon on Renesas ARM platforms
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        uli+renesas@fpond.eu,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Greg,

On Thu, Aug 30, 2018 at 2:54 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Due to an unfortunate oversight, commit 2d4dd0da45401c7a ("serial: sh-sci:
> Allow for compressed SCIF address") broke earlycon on all Renesas ARM
> platforms using a SCIF port for the serial console (R-Car, RZ/A1, RZ/G1,
> RZ/G2 SoCs), due to an incorrect value of port->regshift.
>
> This patch series fixes that by reverting that commit, and a (reverse)
> dependency.
>
> Earlycon for RZ/A2 (which is a new platform) will be fixed later in a
> separate patch.
>
> Thanks for applying!
>
> Geert Uytterhoeven (2):
>   Revert "serial: sh-sci: Remove SCIx_RZ_SCIFA_REGTYPE"
>   Revert "serial: sh-sci: Allow for compressed SCIF address"
>
>  drivers/tty/serial/sh-sci.c | 56 +++++++++++++++++++++++++++----------
>  include/linux/serial_sci.h  |  1 +
>  2 files changed, 42 insertions(+), 15 deletions(-)

These are now in tty-next:

    10c63443b74d1ef5 Revert "serial: sh-sci: Remove SCIx_RZ_SCIFA_REGTYPE"
    a1c2fd7e1098ea49 Revert "serial: sh-sci: Allow for compressed SCIF address"

Can you please include them in v4.19-rc6, as they fix a regression introduced
in v4.19-rc1?

In addition:

    3d8b43ad9c0cf023 serial: sh-sci: Add earlycon for R7S9210

(also in tty-next) enables earlycon on RZ/A2 again, as it was disabled
by the two
reverts above.

Thanks a lot!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
