Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41324 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754700AbdJJHXn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2017 03:23:43 -0400
Date: Tue, 10 Oct 2017 09:23:37 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v3 1/6] clk: renesas: rcar-gen3: Add Z clock divider
 support
Message-ID: <20171010072336.GH2518@verge.net.au>
References: <1507209837-16938-1-git-send-email-horms+renesas@verge.net.au>
 <1507209837-16938-2-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdUKEP1BvzLBBJmARUz2PcsmwHsruumXqt+csY5gkUDmcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUKEP1BvzLBBJmARUz2PcsmwHsruumXqt+csY5gkUDmcw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 09, 2017 at 10:02:34AM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Thu, Oct 5, 2017 at 3:23 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >
> > This patch adds Z clock divider support for R-Car Gen3 SoC.
> >
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> >
> > v2 [Simon Horman]
> > * Use DIV_ROUND_CLOSEST_ULL instead of open-coding the same behaviour
> >   using div_u64()
> > * Do not round rate to 100MHz in cpg_z_clk_recalc_rate
> > * Remove calculation for PLL post-divider, this is bogus.
> >   Instead do not round to closest in cpg_z_clk_round_rate()
> > * Drop check for !prate in cpg_z_clk_round_rate
> 
> Thanks for the updates!
> 
> > --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> > +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> 
> > +static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
> > +                                          unsigned long parent_rate)
> > +{
> > +       struct cpg_z_clk *zclk = to_z_clk(hw);
> > +       unsigned int mult;
> > +
> > +       mult = 32 - FIELD_GET(CPG_FRQCRC_ZFC_MASK, clk_readl(zclk->reg));
> > +       return DIV_ROUND_CLOSEST_ULL(parent_rate * mult, 32);
> 
> While parent_rate is unsigned long and thus 64-bit on arm64, this will work
> fine on R-Car Gen3.  However, if someone ever tries to reuse this on a
> 32-bit platform, the multiplication may overflow.
> Hence I recommend to make this a 64-bit multiplication explicitly, i.e.
> 
>     return DIV_ROUND_CLOSEST_ULL((u64)parent_rate * mult, 32);

Thanks, will do.

> > +}
> > +
> > +static long cpg_z_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> > +                                unsigned long *parent_rate)
> > +{
> > +       unsigned long prate = *parent_rate;
> > +       unsigned int mult;
> > +
> > +       mult = div_u64((u64)rate * 32, prate);
> 
> You can avoid the cast by making the constant 64-bit:
> 
>     mult = div_u64(rate * 32ULL, prate);

Thanks, that looks a bit nicer.

> > +       mult = clamp(mult, 1U, 32U);
> > +
> > +       return *parent_rate * mult / 32;
> 
> Again, *parent_rate is 64-bit on arm64, but not on 32-bit platforms.
> 
> > +       /*
> > +        * Note: There is no HW information about the worst case latency.
> > +        *
> > +        * Using experimental measurements, it seems that no more than
> > +        * ~10 iterations are needed, independently of the CPU rate.
> > +        * Since this value might be dependent of external xtal rate, pll1
> > +        * rate or even the other emulation clocks rate, use 1000 as a
> 
> another emulated clock rate?
> (Yeah, copied from Gen2 ;-)

It seem so.

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
