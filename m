Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from cloudserver094114.home.pl ([79.96.170.134]:63864 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753944AbeEJJwF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 May 2018 05:52:05 -0400
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org
Subject: Re: [PATCH 0/2] Revert explicit support for Renesas R-Car Gen 3 r8a779[56] SoCs
Date: Thu, 10 May 2018 11:51:38 +0200
Message-ID: <2473510.IAjYrYimeR@aspire.rjw.lan>
In-Reply-To: <20180502095806.30341-1-horms+renesas@verge.net.au>
References: <20180502095806.30341-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wednesday, May 2, 2018 11:58:04 AM CEST Simon Horman wrote:
> Revert commits that added explicit support for Renesas R-Car Gen 3
> r8a779[56] SoCs to the generic cpufreq driver.
> 
> This is no longer needed since the flowing commit and to the best of my
> knowledge is not relied on by any upstream DTS: edeec420de24 ("cpufreq:
> dt-platdev: Automatically create cpufreq device with OPP v2")
> 
> Simon Horman (2):
>   Revert "cpufreq: dt: Add r8a7796 support to to use generic cpufreq
>     driver"
>   Revert "cpufreq: rcar: Add support for R8A7795 SoC"
> 
>  drivers/cpufreq/cpufreq-dt-platdev.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> 

Am I expected to pick up this series?

Thanks,
Rafael
