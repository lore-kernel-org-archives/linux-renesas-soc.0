Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f66.google.com ([209.85.217.66]:35122 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726274AbeKHT7y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 14:59:54 -0500
MIME-Version: 1.0
References: <1541075705-1333-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1541075705-1333-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20181102114946.5tqk2lyisaey475w@verge.net.au> <TY1PR01MB1770FA3764370E7AEA5D30C6C0C50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1770FA3764370E7AEA5D30C6C0C50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Nov 2018 11:24:54 +0100
Message-ID: <CAMuHMdX=L9d=1dq24WErcjYLv987=yKL2K7hxnS7hhsZpbKEBA@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: dts: r8a77470: Add QSPI support
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Richard Weinberger <richard@nod.at>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Brian Norris <computersforpeace@gmail.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-spi <linux-spi@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fabrizio,

On Thu, Nov 8, 2018 at 11:22 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> > From: Simon Horman <horms@verge.net.au>
> > Sent: 02 November 2018 11:50
> > Subject: Re: [PATCH 3/4] ARM: dts: r8a77470: Add QSPI support
> >
> > On Thu, Nov 01, 2018 at 12:35:04PM +0000, Fabrizio Castro wrote:
> > > Add QSPI[01] support to the RZ/G1C SoC specific device tree.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > ---
> > >  arch/arm/boot/dts/r8a77470.dtsi | 34 ++++++++++++++++++++++++++++++++++
> > >  1 file changed, 34 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
> > > index e6407e5..04a8877 100644
> > > --- a/arch/arm/boot/dts/r8a77470.dtsi
> > > +++ b/arch/arm/boot/dts/r8a77470.dtsi
> > > @@ -20,6 +20,8 @@
> > >  i2c2 = &i2c2;
> > >  i2c3 = &i2c3;
> > >  i2c4 = &i2c4;
> > > +spi0 = &qspi0;
> > > +spi1 = &qspi1;
> > >  };
> >
> > Geert can comment but I believe we are moving away from using aliases
> > in this way and that it would be best if the above hunk was dropped
> > from this patch.
> >
> > https://patchwork.kernel.org/patch/10644159/
>
> Geert, what do you want me to do here?

Please drop the aliases. Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
