Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f67.google.com ([209.85.217.67]:44606 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbeKIFhj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Nov 2018 00:37:39 -0500
MIME-Version: 1.0
References: <20181028212457.1017-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181028212457.1017-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Nov 2018 21:00:26 +0100
Message-ID: <CAMuHMdW0LH+D0QrswYT9=Kt3m1DCc2ZcvOi7yLz-ryPo8OY_wA@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: sh-pfc: gen2: initialize TDSEL register
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

CC Chris Paterson

On Sun, Oct 28, 2018 at 10:25 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> During our SDHI hackathon, we found that Lager was the only Gen2 board
> having issues with a stubborn SD card. The issue went away when setting
> TDSEL to the expected value mentioned in the H2 documentation which is
> sadly not the default value. M2-W, M2-N, and V2H have an expected value
> of 0 for TDSEL, so this is why they likely work out of the box (V2H has
> non-zero drive strength bit, though). I can't verify those SoCs here, no

But the default non-zero drive strength bit does match the required value
on V2H.

> boards. E2 has a non-zero expected value as well, so we fix it in this
> patch series as well (although on my board the bootloader prepares TDSEL
> correctly, but let's not rely on that).

Probably we should program TDSEL regardless, to avoid any dependency on
reset state or boot loader.

Note that all RZ/G1 SoCs requires zero TDSEL values, except for RZ/G1C
(which doesn't document required values, just the initial values).
So we need some soc_device_match() handling to obtain the required value.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
