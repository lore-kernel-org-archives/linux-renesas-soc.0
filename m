Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726288AbeK1I6k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Nov 2018 03:58:40 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Jiada Wang <jiada_wang@mentor.com>, geert+renesas@glider.be,
        horms@verge.net.au, magnus.damm@gmail.com, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <7f8827a5-c65d-0e1e-a0f9-23b31305d26a@mentor.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, kuninori.morimoto.gx@renesas.com
References: <20181025072349.15173-1-jiada_wang@mentor.com>
 <20181025072349.15173-3-jiada_wang@mentor.com>
 <154083775062.98144.11157403961171783929@swboyd.mtv.corp.google.com>
 <9f9fbf3a-4455-bdf3-0438-b39b9cdda112@mentor.com>
 <154130125117.88331.5969014008610987799@swboyd.mtv.corp.google.com>
 <7f8827a5-c65d-0e1e-a0f9-23b31305d26a@mentor.com>
Message-ID: <154335596100.88331.410483221336228399@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH linux-next v1 2/4] clk: renesas: Add binding document for AVB
 Counter Clock
Date: Tue, 27 Nov 2018 13:59:21 -0800
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Quoting Jiada Wang (2018-11-21 23:06:10)
> On 2018/11/04 12:14, Stephen Boyd wrote:
> > Quoting Jiada Wang (2018-10-31 05:00:49)
> >> On 2018/10/30 3:29, Stephen Boyd wrote:
> >>> Quoting jiada_wang@mentor.com (2018-10-25 00:23:47)
> >>>> +Required Properties:
> >>>> +  - compatible: Must be "renesas,clk-avb"
> >>>> +  - reg: Base address and length of the memory resource used by the=
 AVB
> >>>> +  - #clock-cells: Must be 1
> >>>> +
> >>>> +Example
> >>>> +-------
> >>>> +
> >>>> +       clk_avb: avb-clock@ec5a011c {
> >>>> +               compatible =3D "renesas,clk-avb";
> >>>> +               reg =3D <0 0xec5a011c 0 0x24>;
> >>> This is an odd register offset. Is this just one clk inside of a larg=
er
> >>> clk controller?
> >>>
> >> Yes, avb_counter clock is part of Audio Clock Generator reg: <0
> >> 0xec5a0000 0 0x140>,
> >> but "adg" has already been declared in R-Car GEN2/GEN3 SoC .dtsi file,
> >> with reg: <0 0xec5a0000 0 0x100>,
> >> which leaves <0 0xec5a0100 0 0x140> currently not used by any module.
> >>
> > So why can't we expand the register size in the dts file and update the
> > audio clock generator driver to register this avb clock too? Presumably
> > the mapping is large enough to cover the clk registers already so it is
> > more of a formality to expand the register size than a requirement.
> I am working on ver2 to expend register size to cover <0 0xec5a0100 0 0x1=
40>
> in audio clock generator (ADG) driver, but as provider of newly added =

> "AVB_COUNTER" clock,
> ADG driver also uses these clocks if necessary, so it keeps itself BUSY,
> and cause ADG driver can't be unloaded.
> my question is, is such use case allowed? (clock provider is also client =

> of clocks).

Yes, a clock provider can also be a client of clocks.
