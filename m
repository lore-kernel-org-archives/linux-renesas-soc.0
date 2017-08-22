Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:45580 "EHLO
        cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932833AbdHVNiL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2017 09:38:11 -0400
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Viresh Kumar <viresh.kumar@linaro.org>,
        Simon Horman <horms+renesas@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
Subject: Re: [PATCH] cpufreq: dt: Add r8a7796 support to to use generic cpufreq driver
Date: Tue, 22 Aug 2017 15:29:39 +0200
Message-ID: <300711551.YezXHKMQbv@aspire.rjw.lan>
In-Reply-To: <20170816032518.GA4233@vireshk-i7>
References: <1502465817-19804-1-git-send-email-horms+renesas@verge.net.au> <20170816032518.GA4233@vireshk-i7>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wednesday, August 16, 2017 5:25:18 AM CEST Viresh Kumar wrote:
> On 11-08-17, 17:36, Simon Horman wrote:
> > From: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
> > 
> > This patch adds the r8a7796 support the generic cpufreq driver
> > by adding an appropriate compat string. This is in keeping
> > with support for other Renesas ARM and arm64 based SoCs.
> > 
> > Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
> > [simon: new changelog]
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> >  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > This is a follow-up for a similar change that has already been accepted
> > for the r8a7795.
> > 
> > 
> > I have provided an integration branch that includes with this patch, those
> > DTS updates that make use of opp-v2 bindings that depend on this change,
> > and Renesas clock updates also depended on by the DTS changes.  The result
> > is working CPUFreq for the r8a7796 (R-Car M3-W).
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/r8a7796-cpufreq
> > 
> > A description of steps taken to lightly exercise the same feature for the
> > r88a7795 the above can be found at the link below. The results are the same
> > for the r8a7796 with the exception that it has two active CPU cores rather
> > than four.
> > 
> > http://elinux.org/Tests:R-CAR-GEN3-CPUFreq
> > 
> > diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> > index bcee384b3251..233e18ad3948 100644
> > --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> > +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> > @@ -68,6 +68,7 @@ static const struct of_device_id machines[] __initconst = {
> >  	{ .compatible = "renesas,r8a7793", },
> >  	{ .compatible = "renesas,r8a7794", },
> >  	{ .compatible = "renesas,r8a7795", },
> > +	{ .compatible = "renesas,r8a7796", },
> >  	{ .compatible = "renesas,sh73a0", },
> >  
> >  	{ .compatible = "rockchip,rk2928", },
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> 

Applied, thanks!
