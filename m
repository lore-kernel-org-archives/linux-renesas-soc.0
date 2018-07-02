Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:37243 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751931AbeGBQPp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Jul 2018 12:15:45 -0400
Received: by mail-lf0-f65.google.com with SMTP id j8-v6so2858479lfb.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Jul 2018 09:15:44 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Mon, 2 Jul 2018 18:15:42 +0200
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77970: remove
 SH_PFC_PIN_CFG_DRIVE_STRENGTH flag
Message-ID: <20180702161542.GW5237@bigcity.dyn.berto.se>
References: <20180702080544.22665-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdXV5BOoPCey3xyyzeuLSZeiH0XaaVo9sSzNkFrutf8sOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXV5BOoPCey3xyyzeuLSZeiH0XaaVo9sSzNkFrutf8sOA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thanks for your feedback.

On 2018-07-02 15:03:02 +0200, Geert Uytterhoeven wrote:
> CC Sergei,
> 
> Thanks for your patch!
> 
> On Mon, Jul 2, 2018 at 10:06 AM Niklas S�derlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > The datasheet do not document any registers to control drive strength,
> 
> does
> 
> > and no drive strength registers are for this reason described for this
> > SoC. The flag indicating that drive strength can be controlled are
> 
> flags
> 
> > however set for some pins in the driver.
> >
> > This leads to a NULL pointer dereference when the sh-pfc core tries to
> > access the struct describing the drive strength registers, for example
> > when reading the sysfs file pinconf-pins.
> >
> > Fix this by removing the SH_PFC_PIN_CFG_DRIVE_STRENGTH from all pins.
> >
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> I'll wait a bit for Sergei's response.
> Perhaps his version of the datasheet does document drive strength registers?

Do you wish for a v2 addressing the spelling above or can you fix that 
when applying?

> 
> > --- a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
> > +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
> > @@ -21,15 +21,13 @@
> >  #include "core.h"
> >  #include "sh_pfc.h"
> >
> > -#define CFG_FLAGS SH_PFC_PIN_CFG_DRIVE_STRENGTH
> > -
> >  #define CPU_ALL_PORT(fn, sfx)                                          \
> > -       PORT_GP_CFG_22(0, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE), \
> > -       PORT_GP_CFG_28(1, fn, sfx, CFG_FLAGS),                          \
> > -       PORT_GP_CFG_17(2, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE), \
> > -       PORT_GP_CFG_17(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE), \
> > -       PORT_GP_CFG_6(4,  fn, sfx, CFG_FLAGS),                          \
> > -       PORT_GP_CFG_15(5, fn, sfx, CFG_FLAGS)
> > +       PORT_GP_CFG_22(0, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),          \
> > +       PORT_GP_28(1, fn, sfx),                                         \
> > +       PORT_GP_CFG_17(2, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),          \
> > +       PORT_GP_CFG_17(3, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),          \
> > +       PORT_GP_6(4,  fn, sfx),                                         \
> > +       PORT_GP_15(5, fn, sfx)
> >  /*
> >   * F_() : just information
> >   * FM() : macro for FN_xxx / xxx_MARK
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

-- 
Regards,
Niklas S�derlund
