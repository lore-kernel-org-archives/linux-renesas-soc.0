Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33323 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752168AbeEOHgN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 May 2018 03:36:13 -0400
Date: Tue, 15 May 2018 09:35:54 +0200
From: Simon Horman <horms@verge.net.au>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-renesas-soc@vger.kernel.org,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org
Subject: Re: [PATCH 0/2] Revert explicit support for Renesas R-Car Gen 3
 r8a779[56] SoCs
Message-ID: <20180515073553.372uzwx4gvj5qpk4@verge.net.au>
References: <20180502095806.30341-1-horms+renesas@verge.net.au>
 <2473510.IAjYrYimeR@aspire.rjw.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2473510.IAjYrYimeR@aspire.rjw.lan>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, May 10, 2018 at 11:51:38AM +0200, Rafael J. Wysocki wrote:
> On Wednesday, May 2, 2018 11:58:04 AM CEST Simon Horman wrote:
> > Revert commits that added explicit support for Renesas R-Car Gen 3
> > r8a779[56] SoCs to the generic cpufreq driver.
> > 
> > This is no longer needed since the flowing commit and to the best of my
> > knowledge is not relied on by any upstream DTS: edeec420de24 ("cpufreq:
> > dt-platdev: Automatically create cpufreq device with OPP v2")
> > 
> > Simon Horman (2):
> >   Revert "cpufreq: dt: Add r8a7796 support to to use generic cpufreq
> >     driver"
> >   Revert "cpufreq: rcar: Add support for R8A7795 SoC"
> > 
> >  drivers/cpufreq/cpufreq-dt-platdev.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > 
> 
> Am I expected to pick up this series?

Hi Rafael,

that would be ideal from my point of view.
