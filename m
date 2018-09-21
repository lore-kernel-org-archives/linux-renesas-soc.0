Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:51817 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388909AbeIUVrP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Sep 2018 17:47:15 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: RE: [PATCH 4/5] pinctrl: sh-pfc: r8a77470: Add SDHI2 pin groups
Date: Fri, 21 Sep 2018 15:57:28 +0000
Message-ID: <TY1PR01MB177016F137E3E469AF73223DC0120@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1537278478-1744-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537278478-1744-5-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdVaU3f=Vi=VZYZPhUxoPkDo5oBjDZFnPjY1i-P9xPbEQA@mail.gmail.com>
 <TY1PR01MB1770EE6046C6FD96C17DB829C01C0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdW2XGA_jUCOqZ5x5m7Vx_r0NeKJW=_zunVSvXX9sApXEQ@mail.gmail.com>
 <20180921154741.GB1124@kunai>
In-Reply-To: <20180921154741.GB1124@kunai>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Wolfram,

Thank you for your feedback!

> -----Original Message-----
> From: Wolfram Sang <wsa@the-dreams.de>
> Sent: 21 September 2018 16:48
> To: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>; Laurent Pinchart <l=
aurent.pinchart@ideasonboard.com>; Geert Uytterhoeven
> <geert+renesas@glider.be>; Linus Walleij <linus.walleij@linaro.org>; Linu=
x-Renesas <linux-renesas-soc@vger.kernel.org>; open
> list:GPIO SUBSYSTEM <linux-gpio@vger.kernel.org>; Simon Horman <horms@ver=
ge.net.au>; Chris Paterson
> <Chris.Paterson2@renesas.com>; Biju Das <biju.das@bp.renesas.com>; Wolfra=
m Sang <wsa+renesas@sang-engineering.com>
> Subject: Re: [PATCH 4/5] pinctrl: sh-pfc: r8a77470: Add SDHI2 pin groups
>
>
> > > 2) Specify SH_PFC_PIN_CFG_IO_VOLTAGE for every line that belongs to
> > > the interface, keep the SD card pin groups as specified by this
> > > patch, map all of the pins to the same bit in the POC register (as
> > > per pin_to_pocctrl is concerned), and the board specific device tree
> > > definitions would look like every other RZ/G1 or R-Car Gen2 boards
> > > that support SDR* The only downside would be that the kernel would
> > > read-modify-write the POC Control Register with the same value for
> > > every line in the interface.
>
> I don't think this multiple RMW is a problem.
>
> > This looks the most sensible solution to me: just map in your
> > .pin_to_pocctrl() method all pins of the interface to the single bit.
>
> I didn't fully get if this one bit controls only the CLK wire or all the
> relevant wires? I assume it is the latter one. For that, option 2) is
> totally fine with me.

It is not super clear what the intended behaviour is from the HW User's man=
ual indeed,
but I have tested SDR50 and it seems to be working fine, which would indica=
te that the
control bit in the POC Control Register is actually controlling all of the =
lines of the
interface, and not just the CLK pin.

Thanks,
Fab



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
