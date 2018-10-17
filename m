Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:39248 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbeJQRvw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 13:51:52 -0400
Received: by mail-vs1-f68.google.com with SMTP id m5so20358949vsk.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Oct 2018 02:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20181011085508.5234-1-geert+renesas@glider.be>
 <20181011085508.5234-2-geert+renesas@glider.be> <20181011135448.sah5unjhclllvqty@verge.net.au>
 <20181015154048.hkmht7cml272xbcg@verge.net.au>
In-Reply-To: <20181015154048.hkmht7cml272xbcg@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Oct 2018 11:56:43 +0200
Message-ID: <CAMuHMdWaXCu9KukLioxkcNoDQt4wKs2C9vrRbQRVJ+8+ux4PAQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] [RFC] arm64: renesas: Move SoC Kconfig symbols to drivers/soc/renesas/
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Mon, Oct 15, 2018 at 5:40 PM Simon Horman <horms@verge.net.au> wrote:
> On Thu, Oct 11, 2018 at 03:54:55PM +0200, Simon Horman wrote:
> > On Thu, Oct 11, 2018 at 10:55:07AM +0200, Geert Uytterhoeven wrote:
> > > For consistency with other vendors, which have a single Kconfig symbol
> > > in arch/arm64/Kconfig.platforms.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > Note that drivers/clk/ is included before drivers/soc/.  Hence when
> > > COMPILE_TEST=y, questions will be asked about clock drivers before they
> > > can be auto-selected by SoC support.
> > >
> > > Question: Should we introduce a family-specific Kconfig symbol for R-Car
> > >       Gen3 (ARCH_RCAR_GEN1), which could be used for enabling
> >
> > s/1/3/?

Sure.

> > >
> > >       RST_RCAR?
> >
> > Given that it would be consistent with R-Car Gen 1 and 2,
> > that seems like a good idea to me.
>
> there has been no other feedback on this series.
> How would you like to proceed?

I will add a new symbol ARCH_RCAR_GEN3 for v2?

Any comments about PATCH 2/2?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
