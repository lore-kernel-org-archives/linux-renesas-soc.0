Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f67.google.com ([209.85.222.67]:34794 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726319AbeKET2G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Nov 2018 14:28:06 -0500
MIME-Version: 1.0
References: <1540583850-30825-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CACRpkdahZAKWSPdMk=yp-GrSSAjFAzBijMK1ws3a4KUfzFmzgg@mail.gmail.com> <TY1PR01MB177079AA335A6017A66ED183C0CF0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB177079AA335A6017A66ED183C0CF0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Nov 2018 11:08:56 +0100
Message-ID: <CAMuHMdXNeRW6ZtUD65J9T5pZVmMz0wbVo-Q=DncPekZV-PrFsQ@mail.gmail.com>
Subject: Re: [RFC] gpio: rcar: Request GPIO before enabling interrupt
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fabrizio,

On Fri, Nov 2, 2018 at 8:00 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> I am sorry for the delay of my answer, I was hoping others
> would jump in the discussion as well.
>
> > > +       err = gc->request(gc, hwirq);
> >
> > This is done in some drivers when what you want is exactly
> > the work carried out by that callback. But can't you just call
> > gpio_rcar_request() directly in this case so it is clear that
> > the driver is meddling with the internal state of the hardware
> > and not really intending to loop out into the external
> > API or external callbacks?
>
> gpio_rcar_request is static unfortunately, maybe I should
> export the symbol?

I think Linus meant calling gpio_rcar_request() instead of gc->request()
from gpio_rcar_irq_set_type(), i.e. from the GPIO driver, not from the
HDMI driver. So static is fine.

> > You're not on one of these platforms that prefer setting up
> > the pin as GPIO using a pin control hog in the device tree?
>
> My personal preference would be to deal with this from
> within irqchip, as when you hook up a gpio as interrupt
> from the DT the kernel should do everything that's necessary
> to make it happen, but that is just a personal opinion.
> Anyway, I did give gpio-hog a try and it works for me.

Isn't the purpose of an input GPIO hog to configure the GPIO to not
drive the line, in the absence of any other driver with a need to read
the line value?

In this case there is another driver (via the interrupt subsystem), so using
an input GPIO doesn't look like the real solution to me.

> > Geert will know what is best.

People put way too much faith in me ;-)

> Yeah, I am really keen in hearing from him about this, in the meantime
> I went through a bunch of manuals, and moving the gpio request to the
> bottom of gpio_rcar_irq_set_type seems to be okay for RCar devices in
> general, but Geert knows definitely better.

Moving it down, after all other checks, is indeed better.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
