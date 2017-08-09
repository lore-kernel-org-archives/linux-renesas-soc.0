Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:63317 "EHLO
        cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752047AbdHIXAX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Aug 2017 19:00:23 -0400
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Viresh Kumar <viresh.kumar@linaro.org>,
        Simon Horman <horms+renesas@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] cpufreq: rcar: Add support for R8A7795 SoC
Date: Thu, 10 Aug 2017 00:52:05 +0200
Message-ID: <250419201.CH3uKmuKZU@aspire.rjw.lan>
In-Reply-To: <20170807033705.GE28857@vireshk-i7>
References: <1501852680-21127-1-git-send-email-horms+renesas@verge.net.au> <20170807033705.GE28857@vireshk-i7>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Monday, August 7, 2017 5:37:05 AM CEST Viresh Kumar wrote:
> On 04-08-17, 15:18, Simon Horman wrote:
> > From: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
> > 
> > After the commit "a399dc9fc50 cpufreq: shmobile: Use generic platdev
> > driver", will use cpufreq-dt-platdev driver to enable cpufreq-dt support.
> > Hence, follow the implementation to support new R8A7795 SoC.
> > 
> > Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> >  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > This is identical to a patch posted by Khiem last year.
> > At the time it was asked if using opp-v2 was the preferred approach.
> > 
> > https://patchwork.kernel.org/patch/9054011/
> > 
> > An inspection of the current upstream kernel code seems to indicate
> > that adding a binding as this patch does is compatibile with using opp-v2
> > and I plan to post DTS patches separately which make use of the opp-v2
> > bindings - they depend on this driver change to work.
> > 
> > I have provided an integration patch with this patch, those DTS changes,
> > and Renesas clock updates also depended on by the DTS changes. The result
> > is working CPUFreq for the r8a7795 (R-Car H3) ES1.0.
> > 
> > If this work is acceptable I plan to follow up with patches to
> > enable CPUFreq on the r8a7796 (R-Car M3-W).
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/r8a7795-cpufreq
> > 
> > A description of steps taken to lightly exercise the above can be found here:
> > 
> > http://elinux.org/Tests:R-CAR-GEN3-CPUFreq
> > 
> > diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> > index 096aea7fcb67..13b72f3c420b 100644
> > --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> > +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> > @@ -67,6 +67,7 @@ static const struct of_device_id machines[] __initconst = {
> >  	{ .compatible = "renesas,r8a7792", },
> >  	{ .compatible = "renesas,r8a7793", },
> >  	{ .compatible = "renesas,r8a7794", },
> > +	{ .compatible = "renesas,r8a7795", },
> >  	{ .compatible = "renesas,sh73a0", },
> >  
> >  	{ .compatible = "rockchip,rk2928", },
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> 

Applied, thanks!
