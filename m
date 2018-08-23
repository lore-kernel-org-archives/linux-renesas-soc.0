Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f68.google.com ([209.85.222.68]:44386 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbeHWNXR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Aug 2018 09:23:17 -0400
Received: by mail-ua1-f68.google.com with SMTP id l2-v6so2837794uaf.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Aug 2018 02:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20180819194455.25096-1-laurent.pinchart+renesas@ideasonboard.com> <20180822102950.v5bgqw52wuz6casn@verge.net.au>
In-Reply-To: <20180822102950.v5bgqw52wuz6casn@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Aug 2018 11:54:10 +0200
Message-ID: <CAMuHMdVkf+==3GN-h2fxomgnmPDkvQEvi1zwzwA+n65Wf10yEA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: salvator-common: Add GPIO keys support
To: Simon Horman <horms@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Wed, Aug 22, 2018 at 12:30 PM Simon Horman <horms@verge.net.au> wrote:
> On Sun, Aug 19, 2018 at 10:44:55PM +0300, Laurent Pinchart wrote:
> > The Salvator-X and XS boards have a 4 lines DIP switch and 3 push
> > buttons connected to SoC GPIOs, meant to be used as general-purpose test
> > keys. Add a corresponding node in DT, mapping (semi-randomly) the DIP
>
> Arbitrary may be a better word choice than random.
>
> > switch to keys 1-4 and the push buttons to keys A-C.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> > --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi

> > +             key-a {
> > +                     gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
> > +                     linux,code = <KEY_A>;
> > +                     label = "TSW0";
>
> What does the 'T' in 'TSW' stand for? Toggle?

Tact Switch, cfr. the schematics.

> > @@ -567,6 +625,11 @@
> >               function = "intc_ex";
> >       };
> >
> > +     keys_pins: keys {
> > +             pins = "GP_5_17", "GP_5_20", "GP_5_22";
>
> I am curious to know why only some of the pins used above appear here.

GP5_23 has an external 100K pull-up, GP5_{17,20,22} don't.
GP6_1[123] have external 1K + 2K pull-upps.

>
> > +             bias-pull-up;
> > +     };
> > +

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
