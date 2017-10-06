Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52703 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751832AbdJFJj0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Oct 2017 05:39:26 -0400
Date: Fri, 6 Oct 2017 11:39:21 +0200
From: Simon Horman <horms@verge.net.au>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: shmobile: rcar-gen2: fix non-SMP build
Message-ID: <20171006093921.GK7734@verge.net.au>
References: <20171005120914.465582-1-arnd@arndb.de>
 <CAMuHMdXjD-MpW9sqKtdUasizN8YkWuzChNyduyHz7p-cz38VBg@mail.gmail.com>
 <CAK8P3a1BkwquyVgRAsRgt2d5jv7TGoKPhA_gA0p+UQ9Spu_g2w@mail.gmail.com>
 <20171006092856.GI7734@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171006092856.GI7734@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Oct 06, 2017 at 11:28:56AM +0200, Simon Horman wrote:
> On Thu, Oct 05, 2017 at 10:29:47PM +0200, Arnd Bergmann wrote:
> > On Thu, Oct 5, 2017 at 2:25 PM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Thu, Oct 5, 2017 at 2:09 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> > >>  arch/arm/mach-shmobile/headsmp-apmu.S | 2 ++
> > >>  1 file changed, 2 insertions(+)
> > >>
> > >> diff --git a/arch/arm/mach-shmobile/headsmp-apmu.S b/arch/arm/mach-shmobile/headsmp-apmu.S
> > >> index db4743d2bf91..5672b5849401 100644
> > >> --- a/arch/arm/mach-shmobile/headsmp-apmu.S
> > >> +++ b/arch/arm/mach-shmobile/headsmp-apmu.S
> > >
> > > As this hasn't been pulled into arm-soc yet (pull request sent though),
> > > perhaps Simon should squash this fix into the original commit?
> > > Should we rename headsmp-apmu.S to head-apmu.S?
> > 
> > I'm fine with it either way, just do whatever works best for you here.
> 
> My preference is to send a second pull request with this patch on top of the
> previous pull request. Arnd does that work for you?

In the mean time I pushed the patch to the next branch of the renesas
tree so it should appear in linux-next in the not to distant future.
