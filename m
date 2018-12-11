Return-Path: <arndbergmann@gmail.com>
MIME-Version: 1.0
References: <20181210210033.3276054-1-arnd@arndb.de> <CAMuHMdU0fp5p1QoD=h6v=RW9V5NgMvhz-NpoK5_8NNsnMKtjhA@mail.gmail.com>
In-Reply-To: <CAMuHMdU0fp5p1QoD=h6v=RW9V5NgMvhz-NpoK5_8NNsnMKtjhA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 11 Dec 2018 09:37:59 +0100
Message-ID: <CAK8P3a3d_jTHrgfh1tv-FB2hj5oHf-s+VzJwCY3F8-_yFuQx-g@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: fix build regressions
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, biju.das@bp.renesas.com,
	fabrizio.castro@bp.renesas.com, yoshihiro.shimoda.uh@renesas.com,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Dec 11, 2018 at 9:22 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Arnd,
>
> On Mon, Dec 10, 2018 at 10:00 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > A number of Kconfig options have become available now to random ARM
> > platforms outside of ARCH_MULTIPLATFORM, which now causes Kconfig
> > warnings, and other build errors when those select options that
> > lack additonal dependencies, e.g.:
> >
> > WARNING: unmet direct dependencies detected for HAVE_ARM_ARCH_TIMER
> >   Depends on [n]: CPU_V7 [=n]
> >   Selected by [y]:
> >   - ARCH_RCAR_GEN2 [=y] && SOC_RENESAS [=y]
> >   - ARCH_R8A73A4 [=y] && SOC_RENESAS [=y] && ARM [=y]
> >
> > WARNING: unmet direct dependencies detected for SYS_SUPPORTS_EM_STI
> >   Depends on [n]: GENERIC_CLOCKEVENTS [=n]
> >   Selected by [y]:
> >   - ARCH_EMEV2 [=y] && SOC_RENESAS [=y] && ARM [=y]
> >
> > Put the old dependency on ARCH_RENESAS back for the moment to restore
> > the previous behavior.
>
> Thanks, the build bots must be lazy or overloaded these days...
> The ARM selects are indeed more troublesome than the ARM64 ones.
>
> BTW, did you see issues with the ARM64 Kconfig symbol move too,
> or is that mitigated by ARM64 always selecting GENERIC_CLOCKEVENTS?

I restarted my randconfig builder yesterday, and after a few hundred builds
on each architecture, I did not see any arm64 failures, so it's
probably ok there.
I have a clean build now (about to rebase to today's linux-next, which will
surely change that).

> > Fixes: 062887bf5ef7 ("ARM: shmobile: Move SoC Kconfig symbols to drivers/soc/renesas/")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks.

     Arnd
