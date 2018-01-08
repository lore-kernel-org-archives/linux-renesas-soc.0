Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53626 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755852AbeAHIC3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jan 2018 03:02:29 -0500
Date: Mon, 8 Jan 2018 09:02:11 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH v4 2/6] clk: renesas: rcar-gen3: Add Z2 clock divider
 support
Message-ID: <20180108080210.2c4rrijezfsad55k@verge.net.au>
References: <20180103121840.29316-1-horms+renesas@verge.net.au>
 <20180103121840.29316-3-horms+renesas@verge.net.au>
 <CAMuHMdXcLhFD825Xi2Uk=6_OAgLd7BEp14rWpgb7pv6rOM2H2Q@mail.gmail.com>
 <20180105140401.7iitpzdrlyqtasvz@verge.net.au>
 <CAMuHMdWk3ke6GriUdxHp_62r-REYV3P4qNiNGOcGRiCQWCyKAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWk3ke6GriUdxHp_62r-REYV3P4qNiNGOcGRiCQWCyKAg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jan 05, 2018 at 03:35:13PM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Fri, Jan 5, 2018 at 3:04 PM, Simon Horman <horms@verge.net.au> wrote:
> > On Wed, Jan 03, 2018 at 01:47:08PM +0100, Geert Uytterhoeven wrote:
> >> On Wed, Jan 3, 2018 at 1:18 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> >> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >> >
> >> > This patch adds Z2 clock divider support for R-Car Gen3 SoC.
> >> >
> >> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> >> As the CPG/MSSR driver now has suspend/resume support, do we need
> >> a notifier to restore the Z or Z2 registers? Or is that handled automatically
> >> by cpufreq during system resume, for both the primary and the secondary
> >> CPU cores?
> >
> > I am a bit unsure.
> >
> > When using the A57 cores, which is the default case, the Z clk is queried
> > by CPUFreq on resume. It appears that on my system its already set to the
> > correct value but I assume if it was not then it would be reset. However,
> > this does not cover Z2 clk. So perhaps to be safe we need to register
> > notifiers and make sure they they play nicely with CPUFreq?
> 
> Of course the CPU is special: unlike many other devices, it must be running
> when the kernel is reentered upon system resume.
> It may be running using a different frequency setting, though.
> However, following "opp-suspend", the system will always suspend with the
> Z clock running at 1.5GHz, which is the default?
> So Z is probably OK.
> 
> It's more interesting to check what happens when the little cores are
> enabled as well (unfortunately that requires different firmware).
> 1. Does cpufreq handle them correctly when they are onlined again during
>    system resume?
> 2. What happens if you offline all big cores, and enter system suspend
>    running with little cores only?
>    Perhaps that's prevented by the "opp-suspend" property as well?

Thanks for clarifying the problem.

I should be able to install updated firmware on:
i* r8a7796 (M3-W) ES1.0 / Salvator-X; and
* r8a7795 (H3) ES2.0 / Salvator-XS.
* But not easily r8a7795 (H3) / Salvator-X

Do you know what the minimal / desired firmware version is to exercise the
scenarios you describe.
