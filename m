Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f196.google.com ([209.85.221.196]:40704 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbeITPq4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Sep 2018 11:46:56 -0400
MIME-Version: 1.0
References: <1537278478-1744-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537278478-1744-5-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdVaU3f=Vi=VZYZPhUxoPkDo5oBjDZFnPjY1i-P9xPbEQA@mail.gmail.com> <TY1PR01MB1770EE6046C6FD96C17DB829C01C0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1770EE6046C6FD96C17DB829C01C0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Sep 2018 12:04:02 +0200
Message-ID: <CAMuHMdW2XGA_jUCOqZ5x5m7Vx_r0NeKJW=_zunVSvXX9sApXEQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: sh-pfc: r8a77470: Add SDHI2 pin groups
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fabrizio,

CC wolfram

On Wed, Sep 19, 2018 at 12:19 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Although this patch is pretty much standard, I would like to start a discussion as while testing SDHI2 (which goes on the uSD connector on the bottom side of the iwg23s) I have come across an issue. The POC Control Register (IOCTRL6) of the RZ/G1C is structured in a completely different way from the other members of the RZ/G1 family, only one bit is used to control the interface, as opposed to the usual one bit per pin layout.
>
> There are 3 possible ways to fix this:
> 1) keep the clk pin of the interface in a pin group on its own in the PFC driver (which means I would need to drop this patch or rework the pin groups with an additional patch), specify SH_PFC_PIN_CFG_IO_VOLTAGE for the clock line alone, keep the clk pin in a device tree node on its own in the board specific device tree and specify power-source only within the device tree node containing the clk line. The SD card device tree node in the board specific device tree would look like the following:
> ...
> pinctrl-0 = <&sdhi2_pins>, <&sdhi2_pins_clk>;
> pinctrl-1 = <&sdhi2_pins>, <&sdhi2_pins_clk_uhs>;
> pinctrl-names = "default", "state_uhs";
> ....

That matches the datasheet, which says the bit is for the CLK line,
but that can't
be true, as the voltage selection should affect other lines, too.

> 2) Specify SH_PFC_PIN_CFG_IO_VOLTAGE for every line that belongs to the interface, keep the SD card pin groups as specified by this patch, map all of the pins to the same bit in the POC register (as per pin_to_pocctrl is concerned), and the board specific device tree definitions would look like every other RZ/G1 or R-Car Gen2 boards that support SDR*
> The only downside would be that the kernel would read-modify-write the POC Control Register with the same value for every line in the interface.

This looks the most sensible solution to me: just map in your
.pin_to_pocctrl() method
all pins of the interface to the single bit.

> 3) specify SH_PFC_PIN_CFG_IO_VOLTAGE for the clock line alone, come up with another macro for the other lines, keep the pin groups as specified by this patch, modify the logic of sh_pfc_pinconf_set and sh_pfc_pinconf_validate, and the board specific device tree would look like any other RZ/G1 or R-Car Gen2 board that supports SDR*

This looks overly complex.
So .pin_to_pocctrl() would need to return "ignore" for the other pins,
which can work easily for the "set" case, but not for the "get" case.

> I am not particularly enthusiastic about option 3), but option 1) and option 2) seem equally sound to me.
>
> What do you think about this?

I'd go for option 2.

Wolfram: what do you think?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
