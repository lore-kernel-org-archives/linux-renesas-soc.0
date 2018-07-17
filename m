Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54346 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729046AbeGQKa5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 06:30:57 -0400
Date: Tue, 17 Jul 2018 11:59:05 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH/RFC] ARM: shmobile: Always enable ARCH_TIMER on SoCs with
 A7 and/or A15
Message-ID: <20180717095904.eik3sko64zqymzts@verge.net.au>
References: <20180712160857.31471-1-geert+renesas@glider.be>
 <20180713080823.l4tng6oclhr6nxrh@verge.net.au>
 <CAMuHMdUrgP=YOrgeEnpQ0XVOoC_8Dz9Lt2FJ4P5GKb53KRNpNw@mail.gmail.com>
 <CAMuHMdUsHHDo_2unzUZN9W0kY2p5YW+yGkfsdXE-8ZHuBAuxnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUsHHDo_2unzUZN9W0kY2p5YW+yGkfsdXE-8ZHuBAuxnA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jul 13, 2018 at 10:33:17AM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Fri, Jul 13, 2018 at 10:19 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Fri, Jul 13, 2018 at 10:08 AM Simon Horman <horms@verge.net.au> wrote:
> > > On Thu, Jul 12, 2018 at 06:08:57PM +0200, Geert Uytterhoeven wrote:
> > > > R-Mobile APE6, R-Car Gen2, and RZ/G1 SoCs have Cortex-A7 and/or
> > > > Cortex-A15 CPU cores, all of which have ARM architectured timers.
> > > >
> > > > Force use of the ARM architectured timer on these SoCs.
> > > > This allows to:
> > > >   - Remove the calls to shmobile_init_delay() from the corresponding
> > > >     machine vectors,
> > > >   - Remove a check in timer setup specific to R-Car Gen2,
> > > >   - Remove a check in shmobile_init_delay().
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > on which boards did you test this?
> >
> > On APE6EVM and Koelsch (R-Car M2-W).
> > I can give it a spin on a few more remote R-Car Gen2 boards if you want.
> 
> I don't expect any issues, as shmobile_defconfig already enables
> CONFIG_HAVE_ARM_ARCH_TIMER, and shmobile_init_delay() was already
> a no-op in that case.

I am happy if you are happy.
Shall I go ahead and apply this?

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
