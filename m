Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:41716 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754556AbeBNI2s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 03:28:48 -0500
MIME-Version: 1.0
In-Reply-To: <20180214060547.bf6upib2mbgoexas@katana>
References: <20180213232948.31521-1-marek.vasut+renesas@gmail.com> <20180214060547.bf6upib2mbgoexas@katana>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Feb 2018 09:28:47 +0100
Message-ID: <CAMuHMdUYDWXF9uSzsYEOeOVysQKRSFhJ+bLbPhwFbMs-qBjbcA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: stout: Initial r8a7790 Stout board support
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Marek Vasut <marek.vasut@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Wed, Feb 14, 2018 at 7:05 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
>> +     chosen {
>> +             bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
>> +             stdout-path = "serial0:38400n8";
>
> Hmm, that would be our first board to not have 115200, or? We already
> have some other boards upstream where UBoot has 38400 and Linux 115200.
> I'd prefer consistency here a little, but no strong opinion and asking
> for other opinions.

The other R-Car Gen2 boards use 115200 bps for U-Boot and Linux, but some
other value (38400?) for the SPI loader that loads U-Boot.

What about U-Boot commit f40574e2d78c96a3 ("Kconfig: Migrate CONFIG_BAUDRATE"),
which says all R-Car Gen2 boards use 38400, before and after?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
