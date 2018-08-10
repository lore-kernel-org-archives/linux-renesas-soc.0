Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38881 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbeHJO1I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Aug 2018 10:27:08 -0400
Date: Fri, 10 Aug 2018 13:57:28 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH V2] ARM: dts: silk: Add DA9063 PMIC node
Message-ID: <20180810115727.r4iqqrkujzhih4vo@verge.net.au>
References: <20180804163818.23360-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdU8=pb1V9gPxTe6JX5waXr0aRg5PW6t_bDY2fij0PVr5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU8=pb1V9gPxTe6JX5waXr0aRg5PW6t_bDY2fij0PVr5A@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 07, 2018 at 10:16:16AM +0200, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Sat, Aug 4, 2018 at 6:38 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> > Add DA9063 PMIC node to the I2C bus.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Cc: Simon Horman <horms+renesas@verge.net.au>
> > Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Cc: linux-renesas-soc@vger.kernel.org
> > ---
> > V2: - Replace shmobile with dts since it's a DT patch in subject
> >     - Connect the 9063_IRQ# line to GP3_31
> >     - Since the DA9063 is connected to both i2c1 and i2c7, connect
> >       it to i2c7, which is the dedicated dvfs i2c.
> 
> Thanks for the update!
> 
> > --- a/arch/arm/boot/dts/r8a7794-silk.dts
> > +++ b/arch/arm/boot/dts/r8a7794-silk.dts
> > @@ -405,6 +405,23 @@
> >         clock-frequency = <400000>;
> >  };
> >
> > +&i2c7 {
> > +       status = "okay";
> > +       clock-frequency = <100000>;
> > +
> > +       pmic@58 {
> > +               compatible = "dlg,da9063";
> > +               reg = <0x58>;
> > +               interrupt-parent = <&gpio3>;
> > +               interrupts = <31 IRQ_TYPE_LEVEL_LOW>;
> > +               interrupt-controller;
> > +
> > +               wdt {
> > +                       compatible = "dlg,da9063-watchdog";
> > +               };
> 
> Given Silk has the full da9063 (unlike the "L" version on Porter), shouldn't
> you add an rtc subnode?
> 
> Oh, Silk also has the onkey pin wired, so perhaps you want to add an onkey
> subnode, too? Does that feature work?
> 
> BTW, Stout also has the onkey wired, but lacks the onkey subnode.
> 
> > +       };
> > +};
> > +
> 
> Nevertheless:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I have applied this patch for v4.20.

Marek,

please consider some follow-up patches to address the issues
raised by Geert.
