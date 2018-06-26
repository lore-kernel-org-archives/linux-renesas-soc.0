Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:38527 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932210AbeFZI6j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jun 2018 04:58:39 -0400
MIME-Version: 1.0
References: <20180529105847.15663-1-wsa+renesas@sang-engineering.com>
 <20180529105847.15663-2-wsa+renesas@sang-engineering.com> <TY2PR01MB2297BC5F12034143657590A7D86C0@TY2PR01MB2297.jpnprd01.prod.outlook.com>
 <CAMuHMdXaspHUg3LF1Jckg5CWHZWRL6gKOeCv-LHk4uzsji2W1Q@mail.gmail.com>
 <OSBPR01MB2293BBBFEBF58E8D90F3B516D8630@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSBPR01MB229354C6675F1185BD182C54D8640@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <CAMuHMdV-vLn-C6HcZBLwJWbXq2S3e-iQdmQXCEXm23+cEvk8gw@mail.gmail.com>
 <20180626030510.gq3xyejsrc5gd5wj@ninjato> <TY2PR01MB22973680E5B69BAD232C234DD8490@TY2PR01MB2297.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB22973680E5B69BAD232C234DD8490@TY2PR01MB2297.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Jun 2018 10:58:27 +0200
Message-ID: <CAMuHMdXfUjLPa9fGXAkBe6DjVx6jiuNiGN9m2v2bRQf2xurmxA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] i2c: rcar: handle RXDMA HW bug on Gen3
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san,

On Tue, Jun 26, 2018 at 10:38 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Wolfram Sang <wsa@the-dreams.de>, Sent: Tuesday, June 26, 2018 12:05 PM
> > > > I got information about this topic.
> > > >
> > > > < In CPG / MSSR point of view >
> > > >  - This needs 35 usec wait while asserting.
> > > >  - After deasserted a reset, no wait needs.
> > > >   - In other words, there is each hardware IP dependence.
> > >
> > > Let's call the above procedure A.
> > >
> > > > < In I2C point of view >
> > > >  - After deasserted the reset, this nees SRCR register polling.
> > >
> > > Let's call the above procedure B.
> > >
> > > > So, I don't think cpg_mssr_reset() checks the status bit after deasserted a reset.
> > > > But, what do you think?
> > >
> > > cpg_mssr_reset() indeed does not check the status bit after deasserting
> > > the reset, as it follows procedure A.
> > >
> > > Such a check could be added, though. Then it'll become
> > > (let's call this procedure C):
> > >
> > >         /* Reset module */
> > >         spin_lock_irqsave(&priv->rmw_lock, flags);
> > >         value = readl(priv->base + SRCR(reg));
> > >         value |= bitmask;
> > >         writel(value, priv->base + SRCR(reg));
> > >         spin_unlock_irqrestore(&priv->rmw_lock, flags);
> > >
> > >         /* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
> > >         udelay(35);
> > >
> > >         /* Release module from reset state */
> > >         writel(bitmask, priv->base + SRSTCLR(reg));
> > >
> > > +       /* Wait until deassertion has completed */
> > > +       while (readl(priv->base + SRCR(reg)) & bitmask)
> > > +               cpu_relax();
> > >
> > > Probably we need an upper limit on the number of loops, and call udelay(1)
> > > after each iteration?
> > >
> > >         for (i 0; i < 35; i++) {
> > >                 if (!(readl(priv->base + SRCR(reg)) & bitmask))
> > >                         return 0;
> > >                 udelay(1);
> > >         }
> > >         return -EIO;
> > >
> > > Any advice from the hardware team about that?
>
> The hardware team said:
>  - In CPG point of view:
>    - such polling doesn't need (because the reset pulse is generated correctly).
>    - About the interval after deassert the reset, this is depend on each hardware module.
>      (In other words, if each hardware module has a special handling about after the deassert interval,
>       we should follow the special handling.)
>  - The I2C controller needs an interval of reading SRCR at least (this is a special handling).
>
> So, I think adding this code is not good fit in CPG point of view.
>
> > > But according to procedure A, the check is not needed?
>
> As hardware team said, the check (that means procedure C) is not needed.
>
> > > Probably because 35µs is an upper limit satisfying all individual hardware
> > > modules?
> > >
> > > I'm wondering whether we could use procedure B in the general case,
> > > as it explicitly checks for completion?
> > >
> > > Procedure C is safest, though, so probably the way to go.
> >
> > Any news about this topic?
> >
> > And how to upstream all this? My I2C patch is clearly a bugfix, but the
> > necessary CPG update technically isn't? Not sure about this one...
>
> I think we have to add reset_control_status() calling into the i2c-rcar.c
> to follow procedure B.
> But, Geert-san, what do you think?

Calling reset_control_status() from i2c-rcar is fine for me.

Note that reset controller support is optional, so we want to add

        select RESET_CONTROLLER if ARCH_RENESAS && ARM64

to the I2C_RCAR section drivers/i2c/busses/Kconfig. Else reset will fail
silently.

This hardware bug is restricted to R-Car Gen3?
If it applies to R-Car Gen2, too, the "&& ARM64" has to be dropped.
If it applies to R-Car Gen1, too, we have to write an R-Car Gen1 reset
controller driver (R-Car Gen1 uses the legacy CPG and MSTP clock drivers,
and cannot be migrated to the CPG/MSSR driver, as its MSTP and RESET
functionalities are in separate modules).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
