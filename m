Return-Path: <linux-i2c-owner@vger.kernel.org>
MIME-Version: 1.0
References: <20180529105847.15663-1-wsa+renesas@sang-engineering.com>
 <20180529105847.15663-2-wsa+renesas@sang-engineering.com> <TY2PR01MB2297BC5F12034143657590A7D86C0@TY2PR01MB2297.jpnprd01.prod.outlook.com>
 <CAMuHMdXaspHUg3LF1Jckg5CWHZWRL6gKOeCv-LHk4uzsji2W1Q@mail.gmail.com>
 <OSBPR01MB2293BBBFEBF58E8D90F3B516D8630@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSBPR01MB229354C6675F1185BD182C54D8640@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <CAMuHMdV-vLn-C6HcZBLwJWbXq2S3e-iQdmQXCEXm23+cEvk8gw@mail.gmail.com>
 <20180626030510.gq3xyejsrc5gd5wj@ninjato> <TY2PR01MB22973680E5B69BAD232C234DD8490@TY2PR01MB2297.jpnprd01.prod.outlook.com>
 <CAMuHMdXfUjLPa9fGXAkBe6DjVx6jiuNiGN9m2v2bRQf2xurmxA@mail.gmail.com> <20180627084421.zrtpsms5eyftqcfb@ninjato>
In-Reply-To: <20180627084421.zrtpsms5eyftqcfb@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Jun 2018 10:51:10 +0200
Message-ID: <CAMuHMdX6ON5o8TAap18BiKXdxMtTzpkJGU+Z1yAEhT587V05aA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] i2c: rcar: handle RXDMA HW bug on Gen3
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Wed, Jun 27, 2018 at 10:44 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > > The hardware team said:
> > >  - In CPG point of view:
> > >    - such polling doesn't need (because the reset pulse is generated correctly).
> > >    - About the interval after deassert the reset, this is depend on each hardware module.
> > >      (In other words, if each hardware module has a special handling about after the deassert interval,
> > >       we should follow the special handling.)
> > >  - The I2C controller needs an interval of reading SRCR at least (this is a special handling).
> > >
> > > So, I think adding this code is not good fit in CPG point of view.
> >
> > Calling reset_control_status() from i2c-rcar is fine for me.
> >
>
> Doesn't make this writing device drivers a bit harder, I wonder? If we
> follow the above, we need to know per driver (like i2c-rcar.c) if
> reset_control_reset() is enough or if we need to call
> reset_control_status() additionally. For a driver author, it would be
> much less error prone IMHO, if reset_control_reset() just does the right
> thing. It has also the advantage that we can handle special handling on
> different SoCs differently (if that is ever needed) because MSSR driver
> is per SoC.

True.

But this seems to be a bug in the R-Car Gen3 I2C controller implementation.

> > Note that reset controller support is optional, so we want to add
> >
> >         select RESET_CONTROLLER if ARCH_RENESAS && ARM64
> >
> > to the I2C_RCAR section drivers/i2c/busses/Kconfig. Else reset will fail
> > silently.
>
> Technically, it should also be "&& HAS_DMA". But this is maybe a tad too
> defensive?

s/HAS_DMA/RCAR_DMAC/ :-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
