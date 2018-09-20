Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:33018 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387502AbeITPuy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Sep 2018 11:50:54 -0400
MIME-Version: 1.0
References: <1537278478-1744-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537278478-1744-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdWuHumoTwWQ4d+ToY8+EvRqXjbXirk=osewg_Uw02_nnA@mail.gmail.com> <TY1PR01MB1770F22847E3159F651D08A9C01C0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1770F22847E3159F651D08A9C01C0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Sep 2018 12:07:59 +0200
Message-ID: <CAMuHMdXgo+T+tM20JuVCoZ8gTPF4SrtOOeR_eZwvNZJ6Gh7GZg@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sh-pfc: r8a77470: Add I2C4 pin groups
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fabrizio,

On Wed, Sep 19, 2018 at 11:50 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> > Subject: Re: [PATCH 1/5] pinctrl: sh-pfc: r8a77470: Add I2C4 pin groups
> > On Tue, Sep 18, 2018 at 3:48 PM Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com> wrote:
> > > Add I2C4 pin groups and function to the R8A77470 SoC.
> >
> > Thanks for your patch!
> >
> > Any specific reason you added I2C4 only, and not the other I2C instances?
> > Usually we add all of them in one run.
>
> The iwg23s is a very small Raspberry Pi like SBC, there isn't much on it, therefore we can't test all of the interfaces we would like to test.
> The plan is to start supporting what we can easily test/access, for everything else we would like to wait and see, maybe at a later stage?

If your target is just the iwg23s, this is indeed fine.
However, you may have customers who want to use this SoC in their own products,
and thus aren't limited to the pins available on iwg23s.
Including this support upstream makes their life easier. While not everything
can be tested, it will at least have received some review.

Anyway, I'll queue this series in sh-pfc-for-v4.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
