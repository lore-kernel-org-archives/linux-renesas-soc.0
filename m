Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:39236 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728903AbeG3OWV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jul 2018 10:22:21 -0400
MIME-Version: 1.0
References: <20180727210916.66642-1-chris.brandt@renesas.com>
 <20180727210916.66642-5-chris.brandt@renesas.com> <CAMuHMdVSF-qncCA4sMd8c0d28QaanvPTPqJZ1gtvAja_cf-dVg@mail.gmail.com>
 <TY1PR01MB1562C421079461E7CC3FA1208A2F0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1562C421079461E7CC3FA1208A2F0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Jul 2018 14:47:19 +0200
Message-ID: <CAMuHMdWyLzQ0f2jZiOCb_P6FO_A5f_iTkrABa5GR0AmQpzXiuQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] serial: sh-sci: Improve support for separate TEI and
 DRI interrupts
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Mon, Jul 30, 2018 at 2:33 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Monday, July 30, 2018, Geert Uytterhoeven wrote:
> > >         if (sci_port->irqs[0] < 0)
> > >                 return -ENXIO;
> > >
> > > -       if (sci_port->irqs[1] < 0) {
> > > -               sci_port->irqs[1] = sci_port->irqs[0];
> > > -               sci_port->irqs[2] = sci_port->irqs[0];
> > > -               sci_port->irqs[3] = sci_port->irqs[0];
> > > -       }
> > > +       if (sci_port->irqs[1] < 0)
> > > +               for (i = 1; i < ARRAY_SIZE(sci_port->irqs) - 1; i++)
> >
> > Shouldn't the "- 1" be dropped?
>
> In reality, the last entry of the array is 'SCIx_NR_IRQS', so it's not
> really used anywhere.
>
> The original array was:
> enum {
>         SCIx_ERI_IRQ,   (the only IRQ specified in DT)

=0

>         SCIx_RXI_IRQ,   << copy from irqs[0]

= 1

>         SCIx_TXI_IRQ,   << copy from irqs[0]

= 2

>         SCIx_BRI_IRQ,   << copy from irqs[0]

= 3

>         SCIx_NR_IRQS,   (didn’t' touch)

= 4

>
>         SCIx_MUX_IRQ = SCIx_NR_IRQS,    /* special case */
> };

That's not the array, but the enum.

The array is in struct sci_port:

        int                     irqs[SCIx_NR_IRQS];

It has four entries, at indices 0..3.

> So the new for loop used "- "1 in order to create the same outcome.
>
> But as far as I can tell irqs[SCIx_NR_IRQS] is never used anywhere, it
> doesn't really matter.

irqs[SCIx_NR_IRQS] does not exist!

sci_irq_desc[SCIx_NR_IRQS] aka sci_irq_desc[SCIx_MUX_IRQ] does exit,
but that's a different array.

> > With the above fixed:
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I have no problem taking the "- 1" out.
>
> But...here's the funny part: It was you that suggested the "- 1"  ;)
>
> On Thursday, July 26, 2018, Geert Uytterhoeven wrote:
> > > @@ -2809,6 +2845,8 @@ static int sci_init_single(struct platform_device
> > *dev,
> > >                 sci_port->irqs[1] = sci_port->irqs[0];
> > >                 sci_port->irqs[2] = sci_port->irqs[0];
> > >                 sci_port->irqs[3] = sci_port->irqs[0];
> > > +               sci_port->irqs[4] = sci_port->irqs[0];
> > > +               sci_port->irqs[5] = sci_port->irqs[0];
> >
> > You may want to start using a loop from 1 to ARRAY_SIZE(sci_port->irqs) - 1
> > instead.

Your loop is:

    for (i = 1; i < ARRAY_SIZE(sci_port->irqs) - 1; i++)

It loops over 1..ARRAY_SIZE(sci_port->irqs) - 2.
Note the "<" and the "- 1".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
