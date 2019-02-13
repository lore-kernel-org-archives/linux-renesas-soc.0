Return-Path: <SRS0=YTPq=QU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572FFC282C2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Feb 2019 09:59:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 286F0222C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Feb 2019 09:59:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732738AbfBMJ7K convert rfc822-to-8bit (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Feb 2019 04:59:10 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:39787 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729507AbfBMJ7K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Feb 2019 04:59:10 -0500
Received: by mail-ua1-f66.google.com with SMTP id s15so569556uap.6;
        Wed, 13 Feb 2019 01:59:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lda/5yBH4fyHEJRZpjaJyzHKLz2fobQMz6w0mMPkuNo=;
        b=VkUs5XL+eRniY9k5/XtkJe0Nzs3qWHuCWuNr3BvrVoClszZnKFewQ6qET+L/7tF7nh
         E4XPt3PBex7lcajKOudVg9vgCfMJ8MToMZEDtJLfrfj2k1xQ9XPlx2uqghmLg5GdhFRi
         64NdZCEycn26XolRCa+ldO/fkiSSyjp6okIHkPfwDBHx2wmRsEwXqnNkF1QecgsHi68y
         yja/Ax4rwgbUi2OjhoJgQDi3g+WaOLW8WnKWOfwRey7p2UgFryou1+jF5EN0BdeHNVN6
         Af26DPZNbyO6nMPGrL0gwCUKs9KQrvQYjtV3V9C1N2phQypz1y7RSmQuK5SDaf2iMyj6
         QCTA==
X-Gm-Message-State: AHQUAuY9J7lucXPdEexiRU1uN7OGma7PTI5P+AR1UWP0fkTUs2FYXjJL
        yXYUw0dvbBGu8VjGGYCkkFmk5lVMOpzQDY1PZHQ=
X-Google-Smtp-Source: AHgI3Iaca5ozuufJHAp4GYPl0Hf8etrqDwOrOA1dc9VQ+UMG2Wq7PwJ0kV7ST1vDxfe75cGuE74rkkbeTXIjfWCae2Y=
X-Received: by 2002:a9f:2726:: with SMTP id a35mr3351791uaa.75.1550051948949;
 Wed, 13 Feb 2019 01:59:08 -0800 (PST)
MIME-Version: 1.0
References: <20190212141715.3966-1-geert+renesas@glider.be> <CAMpxmJWcSkCBf+vcOg=ksjeSxvo7N+WQ2gNqxPe5BW01vPFH8w@mail.gmail.com>
In-Reply-To: <CAMpxmJWcSkCBf+vcOg=ksjeSxvo7N+WQ2gNqxPe5BW01vPFH8w@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Feb 2019 10:58:55 +0100
Message-ID: <CAMuHMdVYKdE68hgi=G-VmJZwTXS+ymu7qMTH41sHv4q2CCy0TA@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Add wake-up support
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Bartosz,

CC Thomas

On Tue, Feb 12, 2019 at 3:35 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> wt., 12 lut 2019 o 15:17 Geert Uytterhoeven <geert+renesas@glider.be> napisał(a):
> > Implement the irq_set_wake() method in the (optional) irq_chip of the
> > GPIO expander, and propagate wake-up settings to the upstream interrupt
> > controller.  This allows GPIOs connected to a PCA953X GPIO expander to
> > serve as wake-up sources.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/gpio/gpio-pca953x.c
> > +++ b/drivers/gpio/gpio-pca953x.c
> > @@ -151,6 +151,7 @@ struct pca953x_chip {
> >         u8 irq_trig_raise[MAX_BANK];
> >         u8 irq_trig_fall[MAX_BANK];
> >         struct irq_chip irq_chip;
> > +       unsigned int irq_parent;
> >  #endif
> >
> >         struct i2c_client *client;
> > @@ -513,6 +514,24 @@ static void pca953x_irq_unmask(struct irq_data *d)
> >         chip->irq_mask[d->hwirq / BANK_SZ] |= 1 << (d->hwirq % BANK_SZ);
> >  }
> >
> > +static int pca953x_irq_set_wake(struct irq_data *d, unsigned int on)
> > +{
> > +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> > +       struct pca953x_chip *chip = gpiochip_get_data(gc);
> > +       int error = 0;
> > +
> > +       if (chip->irq_parent) {
> > +               error = irq_set_irq_wake(chip->irq_parent, on);
> > +               if (error) {
> > +                       dev_dbg(&chip->client->dev,
> > +                               "irq %u doesn't support irq_set_wake\n",
> > +                               chip->irq_parent);
> > +                       chip->irq_parent = 0;
> > +               }
> > +       }
> > +       return error;
> > +}
> > +
> >  static void pca953x_irq_bus_lock(struct irq_data *d)
> >  {
> >         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> > @@ -732,6 +751,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
> >         irq_chip->name = dev_name(&chip->client->dev);
> >         irq_chip->irq_mask = pca953x_irq_mask;
> >         irq_chip->irq_unmask = pca953x_irq_unmask;
> > +       irq_chip->irq_set_wake = pca953x_irq_set_wake;
>
> Is it possible to assign this callback conditionally depending on
> client->irq and avoid the if (chip->irq_parent) in
> pca953x_irq_set_wake()?

Note that pca953x_irq_setup() already returns early if client->irq is not
a valid interrupt number.

chip->irq_parent is also used as a flag to indicate if the parent
interrupt controller supports wake-up.  If it doesn't, it is cleared
again.  See e.g. commit ffb8e44bd7617ede ("gpio: pcf857x: Check for
irq_set_irq_wake() failures").

Or would it better to clear irq_chip->irq_set_wake instead?
That's something we couldn't do before each instance started using its
own irq_chip instance (e.g. commit 5c4fee63c5ed8133 ("gpio: pca953x: use
a per instance irq_chip structure")).

[more hacking]

Yep, clearing irq_chip->irq_set_wake also works.

But given pca953x_irq_set_wake() doesn't do anything, besides forwarding
to the parent, it seems it can just call irq_set_irq_wake() unconditionally,
and propagate its error code.  I failed to realize that when fixing pcf857x,
where I used the solution for rcar-gpio, which does need to do other things.

Note that we can't use irq_chip_set_wake_parent() as the callback, as that
relies on CONFIG_IRQ_DOMAIN_HIERARCHY (which may not be set), and
setting up irq_data.parent_data (else it crashes).

Will send a v2, and will simplify pcf857x, after some more testing,...

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
