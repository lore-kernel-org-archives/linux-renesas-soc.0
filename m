Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:46694 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750954AbeEBKDS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 May 2018 06:03:18 -0400
Received: by mail-pg0-f65.google.com with SMTP id z4-v6so10257964pgu.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 May 2018 03:03:18 -0700 (PDT)
Date: Wed, 2 May 2018 15:33:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org
Subject: Re: [PATCH 0/2] Revert explicit support for Renesas R-Car Gen 3
 r8a779[56] SoCs
Message-ID: <20180502100315.aydjezp4flmnwu2j@vireshk-i7>
References: <20180502095806.30341-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180502095806.30341-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02-05-18, 11:58, Simon Horman wrote:
> Revert commits that added explicit support for Renesas R-Car Gen 3
> r8a779[56] SoCs to the generic cpufreq driver.
> 
> This is no longer needed since the flowing commit and to the best of my

s/flowing/following ?

Same thing in the patches as well.

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

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
