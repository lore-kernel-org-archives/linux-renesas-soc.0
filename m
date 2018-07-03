Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:43984 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753835AbeGCIOO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jul 2018 04:14:14 -0400
MIME-Version: 1.0
References: <20180702080544.22665-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdXV5BOoPCey3xyyzeuLSZeiH0XaaVo9sSzNkFrutf8sOA@mail.gmail.com> <20180702161542.GW5237@bigcity.dyn.berto.se>
In-Reply-To: <20180702161542.GW5237@bigcity.dyn.berto.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Jul 2018 10:14:02 +0200
Message-ID: <CAMuHMdWnWsaxMQn2z1jZUX=ozU_97CB9b2bvNWXTMAczFwmAew@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77970: remove SH_PFC_PIN_CFG_DRIVE_STRENGTH
 flag
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

CC LinusW

On Mon, Jul 2, 2018 at 6:15 PM Niklas Söderlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2018-07-02 15:03:02 +0200, Geert Uytterhoeven wrote:
> > CC Sergei,
> >
> > Thanks for your patch!
> >
> > On Mon, Jul 2, 2018 at 10:06 AM Niklas Söderlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > The datasheet do not document any registers to control drive strength,
> >
> > does
> >
> > > and no drive strength registers are for this reason described for this
> > > SoC. The flag indicating that drive strength can be controlled are
> >
> > flags
> >
> > > however set for some pins in the driver.
> > >
> > > This leads to a NULL pointer dereference when the sh-pfc core tries to
> > > access the struct describing the drive strength registers, for example
> > > when reading the sysfs file pinconf-pins.
> > >
> > > Fix this by removing the SH_PFC_PIN_CFG_DRIVE_STRENGTH from all pins.
> > >
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > I'll wait a bit for Sergei's response.
> > Perhaps his version of the datasheet does document drive strength registers?
>
> Do you wish for a v2 addressing the spelling above or can you fix that
> when applying?

Given this fixes a crash, I think this is a fix for v4.18.
So please send a v2 straight to LinusW, with

    Fixes: b92ac66a1819602b ("pinctrl: sh-pfc: Add R8A77970 PFC support")

Unfortunately the code has changed since the issue was introduced, so please
send an applicable fix for v4.16/v4.17 to stable after the fix has entered
upstream.

Thanks!

> > > --- a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
> > > +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
> > > @@ -21,15 +21,13 @@
> > >  #include "core.h"
> > >  #include "sh_pfc.h"
> > >
> > > -#define CFG_FLAGS SH_PFC_PIN_CFG_DRIVE_STRENGTH
> > > -
> > >  #define CPU_ALL_PORT(fn, sfx)                                          \
> > > -       PORT_GP_CFG_22(0, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE), \
> > > -       PORT_GP_CFG_28(1, fn, sfx, CFG_FLAGS),                          \
> > > -       PORT_GP_CFG_17(2, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE), \
> > > -       PORT_GP_CFG_17(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE), \
> > > -       PORT_GP_CFG_6(4,  fn, sfx, CFG_FLAGS),                          \
> > > -       PORT_GP_CFG_15(5, fn, sfx, CFG_FLAGS)
> > > +       PORT_GP_CFG_22(0, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),          \
> > > +       PORT_GP_28(1, fn, sfx),                                         \
> > > +       PORT_GP_CFG_17(2, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),          \
> > > +       PORT_GP_CFG_17(3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),          \
> > > +       PORT_GP_6(4,  fn, sfx),                                         \
> > > +       PORT_GP_15(5, fn, sfx)
> > >  /*
> > >   * F_() : just information
> > >   * FM() : macro for FN_xxx / xxx_MARK

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
