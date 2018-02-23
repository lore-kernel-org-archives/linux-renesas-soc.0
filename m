Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53897 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751366AbeBWQpW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Feb 2018 11:45:22 -0500
Date: Fri, 23 Feb 2018 17:45:17 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Steve Twiss <stwiss.opensource@diasemi.com>
Subject: Re: [PATCH] ARM: dts: porter: Add missing PMIC nodes
Message-ID: <20180223164517.aboazzeuujgtkh7q@verge.net.au>
References: <20180217020756.21474-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdUiGAV7r55mqRH549BufDsh8_j8_S-BD_49sCM=aO9hZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUiGAV7r55mqRH549BufDsh8_j8_S-BD_49sCM=aO9hZQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Feb 18, 2018 at 04:07:51PM +0100, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> CC Steve Twiss
> 
> On Sat, Feb 17, 2018 at 3:07 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
> > Add PMIC nodes to Porter and connect CPU DVFS supply. There is
> > one DA9063 and one DA9210 on Porter, the only difference from
> > the other boards is that DA9063 is at I2C address 0x5a rather
> > than 0x58 .
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Thanks for your patch!
> 
> > --- a/arch/arm/boot/dts/r8a7791-porter.dts
> > +++ b/arch/arm/boot/dts/r8a7791-porter.dts
> > @@ -354,10 +354,47 @@
> >         clock-frequency = <400000>;
> >  };
> >
> > +&i2c6 {
> > +       status = "okay";
> > +       clock-frequency = <100000>;
> > +
> > +       pmic@5a {
> > +               compatible = "dlg,da9063";
> 
> Does it matter that this is a DA9063L ("Variant 6B")?
> Do we need a new compatible value, or can this be detected at runtime?

Hi Marek,

could you follow up on this?

> > +               reg = <0x5a>;
> > +               interrupt-parent = <&irqc0>;
> > +               interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> > +               interrupt-controller;
> > +
> > +               rtc {
> > +                       compatible = "dlg,da9063-rtc";
> > +               };
> > +
> > +               wdt {
> > +                       compatible = "dlg,da9063-watchdog";
> > +               };
> > +       };
> > +
> > +       vdd_dvfs: regulator@68 {
> > +               compatible = "dlg,da9210";
> > +               reg = <0x68>;
> > +               interrupt-parent = <&irqc0>;
> > +               interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +               regulator-min-microvolt = <1000000>;
> > +               regulator-max-microvolt = <1000000>;
> > +               regulator-boot-on;
> > +               regulator-always-on;
> > +       };
> > +};
> > +
> >  &sata0 {
> >         status = "okay";
> >  };
> >
> > +&cpu0 {
> > +       cpu0-supply = <&vdd_dvfs>;
> > +};
> > +
> >  /* composite video input */
> >  &vin0 {
> >         status = "okay";
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
