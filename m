Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f67.google.com ([209.85.222.67]:38110 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbeKHWNG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 17:13:06 -0500
MIME-Version: 1.0
References: <1541500533-21843-1-git-send-email-jacopo+renesas@jmondi.org>
 <1541500533-21843-5-git-send-email-jacopo+renesas@jmondi.org>
 <20181107103450.pdzknfafmbihkumf@verge.net.au> <20181107105638.GB24024@w540>
In-Reply-To: <20181107105638.GB24024@w540>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Nov 2018 13:37:36 +0100
Message-ID: <CAMuHMdW-xc6WxXZRDSegiRgEhnvYs5dLrzKY=K8X8XSHp=iGmw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] pinctrl: sh-pfc: r8a77990: Add VIN[4|5] groups/functions
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Simon Horman <horms@verge.net.au>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Wed, Nov 7, 2018 at 11:56 AM jacopo mondi <jacopo@jmondi.org> wrote:
> On Wed, Nov 07, 2018 at 11:34:50AM +0100, Simon Horman wrote:
> > On Tue, Nov 06, 2018 at 11:35:33AM +0100, Jacopo Mondi wrote:
> > > Add pin, mux and functions definitions for VIN4 and VIN5 for R-Car E3.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > >
> > > ---
> > > v3 -> v4:
> > > - Use new variadic version of VIN_DATA_PIN_GROUP macro
> >
> > I may be missing something but this patch seems to be the same as v3,
> > using the VIN_DATA_PIN_GROUP_VER macro.
> >
> Oooops, I forgot to add the changes and lost them while rebasing.
>
> Sorry about this, I'll resend.

Two quick comments below...

> > > v2 -> v3:
> > > - Rebased on v4.20-rc1
> > > - Use the newly introduced VIN_DATA_PIN_GROUP_VER macro
> > >
> > > Incorporate Geert's comments:
> > > - vin5_data8_b is only used with 8 pins: use regular SH_PFC_PIN_GROUP()
> > > - remove stf groups for vin4/vin5
> > > - confirmed that pins [23-8] of vin4's groups 'a' and 'b' are shared
> > > - confirmed with HW team the synchronism pins in vin5 are only for group 'a'

> > > --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> > > +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c

> > > +/* - VIN5 ------------------------------------------------------------------- */
> > > +static const union vin_data vin5_data_a_pins = {

union vin_data16

> > > +   .data16 = {
> > > +           RCAR_GP_PIN(1, 1),  RCAR_GP_PIN(1, 2),
> > > +           RCAR_GP_PIN(1, 19), RCAR_GP_PIN(1, 12),
> > > +           RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 16),
> > > +           RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
> > > +           RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
> > > +           RCAR_GP_PIN(0, 9),  RCAR_GP_PIN(0, 11),
> > > +           RCAR_GP_PIN(0, 8),  RCAR_GP_PIN(0, 10),
> > > +           RCAR_GP_PIN(0, 2),  RCAR_GP_PIN(0, 3),
> > > +   },
> > > +};
> > > +
> > > +static const union vin_data vin5_data_a_mux = {

union vin_data16

> > > +   .data16 = {
> > > +           VI5_DATA0_A_MARK,  VI5_DATA1_A_MARK,
> > > +           VI5_DATA2_A_MARK,  VI5_DATA3_A_MARK,
> > > +           VI5_DATA4_A_MARK,  VI5_DATA5_A_MARK,
> > > +           VI5_DATA6_A_MARK,  VI5_DATA7_A_MARK,
> > > +           VI5_DATA8_A_MARK,  VI5_DATA9_A_MARK,
> > > +           VI5_DATA10_A_MARK, VI5_DATA11_A_MARK,
> > > +           VI5_DATA12_A_MARK, VI5_DATA13_A_MARK,
> > > +           VI5_DATA14_A_MARK, VI5_DATA15_A_MARK,
> > > +   },
> > > +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
