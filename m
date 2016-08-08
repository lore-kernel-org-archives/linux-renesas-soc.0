Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60848 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751979AbcHHLBR (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 8 Aug 2016 07:01:17 -0400
Date: Mon, 8 Aug 2016 13:01:11 +0200
From: Simon Horman <horms@verge.net.au>
To: Olof Johansson <olof@lixom.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Russell King - ARM Linux <linux@armlinux.org.uk>,
	Magnus Damm <magnus.damm@gmail.com>,
	"arm@kernel.org" <arm@kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] Fix shmobile build with CONFIG_SMP=n
Message-ID: <20160808110111.GI17838@verge.net.au>
References: <20160719115703.GJ1041@n2100.armlinux.org.uk>
 <CAMuHMdWfqbv4MXuThRPL2hsdN4Hq53Ng=1cp8DBB7o7XGzM9Zw@mail.gmail.com>
 <20160720231416.GC9599@verge.net.au>
 <20160802193524.GA6423@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160802193524.GA6423@localhost>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 02, 2016 at 12:35:24PM -0700, Olof Johansson wrote:
> Hi,
> 
> On Thu, Jul 21, 2016 at 08:14:17AM +0900, Simon Horman wrote:
> > On Tue, Jul 19, 2016 at 02:02:53PM +0200, Geert Uytterhoeven wrote:
> > > Hi Russell,
> > > 
> > > On Tue, Jul 19, 2016 at 1:57 PM, Russell King - ARM Linux
> > > <linux@armlinux.org.uk> wrote:
> > > > Shmobile currently fails to build when CONFIG_SMP is disabled:
> > > >
> > > > arch/arm/mach-shmobile/built-in.o: In function `shmobile_smp_init_fallback_ops':
> > > > pm-rcar-gen2.c:(.init.text+0x744): undefined reference to `platform_can_secondary_boot'
> > > > make[1]: *** [vmlinux] Error 1
> > > >
> > > > Fix this by providing a stub for this function.
> > > >
> > > > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> > > 
> > > Arnd send a smaller one https://patchwork.kernel.org/patch/9207413/,
> > > which seems have fallen through the cracks.
> > 
> > Sorry for missing that. I have queued up Arnd's patch as a fix for v4.8
> > with Acked-by Geert and a Reported-by Russel tags.
> 
> Since I haven't seen this patch yet, I've applied it (Arnd's version) directly
> to our fixes branch.

Thanks. The progression through my tree got delayed by me taking
a holiday last week. I'll drop it from my tree as you have picked it up.
