Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <OSBPR01MB210354AFAFCD7D1AF4FB5EF6B8A30@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1522161443-54428-1-git-send-email-biju.das@bp.renesas.com>
 <1522161443-54428-11-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdUWB8=hByJsoZhT1=7QncFexKgZQFiNaUPZrkzGgB-=tg@mail.gmail.com> <OSBPR01MB210354AFAFCD7D1AF4FB5EF6B8A30@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Mar 2018 15:49:43 +0200
Message-ID: <CAMuHMdXtp0JGuuoJ_m0MoEbwBFP5yC6q-vidjxNY73=0S4sp+w@mail.gmail.com>
Subject: Re: [PATCH 10/12] ARM: dts: iwg23s-sbc: Add support for iWave
 G23S-SBC based on RZ/G1C
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

On Wed, Mar 28, 2018 at 3:13 PM, Biju Das <biju.das@bp.renesas.com> wrote:
>> On Tue, Mar 27, 2018 at 4:37 PM, Biju Das <biju.das@bp.renesas.com> wrote:
>> > Add support for iWave iW-RainboW-G23S single board computer based on
>> > RZ/G1C.
>> >
>> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
>> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>>
>> Thanks for your patch!
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> One question below.
>>
>> > --- /dev/null
>> > +++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
>> > @@ -0,0 +1,30 @@
>> > +// SPDX-License-Identifier: GPL-2.0
>> > +/*
>> > + * Device Tree Source for the iWave-RZ/G1C single board computer
>> > + *
>> > + * Copyright (C) 2018 Renesas Electronics Corp.
>> > + */
>> > +
>> > +/dts-v1/;
>> > +#include "r8a77470.dtsi"
>> > +/ {
>> > +       model = "iWave iW-RainboW-G23S single board computer based on
>> RZ/G1C";
>> > +       compatible = "iwave,g23s", "renesas,r8a77470";
>> > +
>> > +       aliases {
>> > +               serial1 = &scif1;
>> > +       };
>>
>> No chosen / stdout-path?
>
> I am planning this later as part of ethernet patch submission.

But stdout-path is not related to Ethernet?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
