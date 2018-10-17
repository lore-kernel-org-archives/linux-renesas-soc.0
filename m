Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46245 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726691AbeJQR6y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 13:58:54 -0400
Date: Wed, 17 Oct 2018 12:03:53 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/2] [RFC] arm64: renesas: Move SoC Kconfig symbols to
 drivers/soc/renesas/
Message-ID: <20181017100351.hisqesa3psw4pb5h@verge.net.au>
References: <20181011085508.5234-1-geert+renesas@glider.be>
 <20181011085508.5234-2-geert+renesas@glider.be>
 <20181011135448.sah5unjhclllvqty@verge.net.au>
 <20181015154048.hkmht7cml272xbcg@verge.net.au>
 <CAMuHMdWaXCu9KukLioxkcNoDQt4wKs2C9vrRbQRVJ+8+ux4PAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWaXCu9KukLioxkcNoDQt4wKs2C9vrRbQRVJ+8+ux4PAQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 17, 2018 at 11:56:43AM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Mon, Oct 15, 2018 at 5:40 PM Simon Horman <horms@verge.net.au> wrote:
> > On Thu, Oct 11, 2018 at 03:54:55PM +0200, Simon Horman wrote:
> > > On Thu, Oct 11, 2018 at 10:55:07AM +0200, Geert Uytterhoeven wrote:
> > > > For consistency with other vendors, which have a single Kconfig symbol
> > > > in arch/arm64/Kconfig.platforms.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > Note that drivers/clk/ is included before drivers/soc/.  Hence when
> > > > COMPILE_TEST=y, questions will be asked about clock drivers before they
> > > > can be auto-selected by SoC support.
> > > >
> > > > Question: Should we introduce a family-specific Kconfig symbol for R-Car
> > > >       Gen3 (ARCH_RCAR_GEN1), which could be used for enabling
> > >
> > > s/1/3/?
> 
> Sure.
> 
> > > >
> > > >       RST_RCAR?
> > >
> > > Given that it would be consistent with R-Car Gen 1 and 2,
> > > that seems like a good idea to me.
> >
> > there has been no other feedback on this series.
> > How would you like to proceed?
> 
> I will add a new symbol ARCH_RCAR_GEN3 for v2?

Good plan.

> Any comments about PATCH 2/2?

Thanks, I have now commented.
