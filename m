Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:38980 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbeHDLZr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Aug 2018 07:25:47 -0400
MIME-Version: 1.0
References: <1533219087-33695-1-git-send-email-biju.das@bp.renesas.com>
 <1533219087-33695-2-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdW7rY9Vho4qpo=K9qoqR1bfn=6Xqb9h=T0CGfb+v=X11Q@mail.gmail.com> <OSBPR01MB21039FF2E727B7E9CFC43E9DB8230@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB21039FF2E727B7E9CFC43E9DB8230@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 4 Aug 2018 11:25:29 +0200
Message-ID: <CAMuHMdX8wsky2EiESFe4y_JeMengPgjTeXCyFh1TwcFCJkTD7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] gpio: rcar: Add GPIO hole support
To: Biju Das <biju.das@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju

On Fri, Aug 3, 2018 at 6:47 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v2 1/5] gpio: rcar: Add GPIO hole support
> > On Thu, Aug 2, 2018 at 4:17 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > > GPIO hole is present in RZ/G1C SoC. Valid GPIO pins on bank3 are in
> > > the range GP3_0 to GP3_16 and GP3_27 to GP3_29. The GPIO pins
> > between
> > > GP3_17 to GP3_26 are unused. Add support for handling unused GPIO's.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> > > @@ -414,6 +422,22 @@ static int gpio_rcar_parse_dt(struct gpio_rcar_priv
> > *p, unsigned int *npins)
> > >                 *npins = RCAR_MAX_GPIO_PER_BANK;
> > >         }
> > >
> > > +       p->bank_info.gpiomsk = 0;
> > > +       len = of_property_count_u32_elems(np,  "gpio-reserved-ranges");
> > > +       if (len < 0 || len % 2 != 0)
> > > +               return 0;
> > > +
> > > +       for (i = 0; i < len; i += 2) {
> > > +               of_property_read_u32_index(np, "gpio-reserved-ranges",
> > > +                                          i, &start);
> > > +               of_property_read_u32_index(np, "gpio-reserved-ranges",
> > > +                                          i + 1, &count);
> > > +               if (start >= *npins || start + count >= *npins)
> > > +                       continue;
> > > +
> > > +               p->bank_info.gpiomsk = GENMASK(start + count - 1, start);
> > > +       }
> >
> > of_gpiochip_init_valid_mask() already does the same, for chip->valid_mask.
>
> Currently we are not setting   "gpio_chip.of_node" variable  in the driver.
> So the below  function in gpiochip_init_valid_mask()   will return negative value and won't allocate memory for valid_mask.
> size = of_property_count_u32_elems(np,  "gpio-reserved-ranges");

Nice catch, I had missed that!

> We need to either set  " of_node"  variable  or  parse "gpio-reserved-ranges" and set " need_valid_mask=true ;"
> so that  gpiochip_init_valid_mask() will allocate the valid_mask.

Agreed.

>
> > > +
> > >         return 0;
> > >  }
> > >
> > > @@ -471,6 +495,7 @@ static int gpio_rcar_probe(struct platform_device
> > *pdev)
> > >         gpio_chip->owner = THIS_MODULE;
> > >         gpio_chip->base = -1;
> > >         gpio_chip->ngpio = npins;
> > > +       gpio_chip->need_valid_mask = p->bank_info.gpiomsk ? true :
> > > + false;
> >
> > gpiochip_init_valid_mask() already sets gpio_chip->need_valid_mask to true
> > if "gpio-reserved-ranges" is detected.
>
> The plan is  to set  "of_node"  variable in driver. So that  gpiochip_init_valid_mask() sets gpio_chip->need_valid_mask to true.
> What is your opinion on this?

Sounds fine to me.

You said on IRC that it currently crashes when "gpio-reserved-ranges" is used.
IMHO that's something that should be fixed separately, possibly for v4.19.

Looks like all other Renesas gpio drivers (some combined pinctrl/gpio), except
for gpio-em.c, also fail to set gpio_chip.of_node. Will have a closer look...

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
