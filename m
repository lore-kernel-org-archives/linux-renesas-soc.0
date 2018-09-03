Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58906 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbeICLgI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Sep 2018 07:36:08 -0400
Date: Mon, 3 Sep 2018 09:17:15 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: enable CMT/TMU support for Renesas SoC
Message-ID: <20180903071715.gim5ukqkmvxjp3vm@verge.net.au>
References: <ebd7d1f7-d99b-f0a1-f05e-d822254b2e86@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebd7d1f7-d99b-f0a1-f05e-d822254b2e86@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 31, 2018 at 10:54:42PM +0300, Sergei Shtylyov wrote:
> Renesas R-Car gen3 SoCs have both CMT and TMU timers, so we have to enable
> building them in Kconfig.platforms (as they don't normally have the prompts
> in Kconfig).
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thank Sergei,

this looks fine to me and I'd be happy to take it through the renesas tree,
after others have been given time for review, if that is the appropriate
path for this patch.

> 
> ---
> The patch is against the ARM64 repo's 'for-next/core' branch.
> 
>  arch/arm64/Kconfig.platforms |    2 ++
>  1 file changed, 2 insertions(+)
> 
> Index: linux/arch/arm64/Kconfig.platforms
> ===================================================================
> --- linux.orig/arch/arm64/Kconfig.platforms
> +++ linux/arch/arm64/Kconfig.platforms
> @@ -175,6 +175,8 @@ config ARCH_RENESAS
>  	select PM_GENERIC_DOMAINS
>  	select RENESAS_IRQC
>  	select SOC_BUS
> +	select SYS_SUPPORTS_SH_CMT
> +	select SYS_SUPPORTS_SH_TMU
>  	help
>  	  This enables support for the ARMv8 based Renesas SoCs.
>  
> 
