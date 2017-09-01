Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60041 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751547AbdIAInE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Sep 2017 04:43:04 -0400
Date: Fri, 1 Sep 2017 10:42:44 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/3] ARM: renesas: Enable SMP on R-Car E2
Message-ID: <20170901084243.GB14918@verge.net.au>
References: <1504255066-5103-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1504255066-5103-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 01, 2017 at 10:37:43AM +0200, Geert Uytterhoeven wrote:
>         Hi all,
> 
> This patch series enables SMP on R-Car E2 (r8a7794).
> The main hurdle here is that R-Car Gen2 boot loaders do not initialize the
> arch_timer CNTVOFF register, which thus needs workarounds on Linux.
> 
>   - The first patch adds a definition for MON_MODE, as suggested by Marc
>     Zyngier,
>   - The second patch makes sure CNTVOFF is initialized for boot and
>     secondary Cortex-A15 and Cortex-A7 CPU cores, like is already done
>     for the boot Cortex-A7 CPU core.  Without this, the ARM arch timer
>     does not work on secondary CPU cores.
>     This patch depends on "[PATCH v2] ARM: shmobile: rcar-gen2: Correct
>     arch timer frequency on RZ/G1E".
>   - The third patch adds the required infrastructure (APMU device node
>     and corresponding enable-method) to DT.
>     Obviously this must not be applied on a branch that does not contain
>     the first two patches!
> 
> Due to dependencies, I think it is easiest if the ARM maintainers provide
> their Acked-by for patch 1, so the whole series can go in through Simon's
> Renesas tree.

Thanks Geert, this merge strategy is fine by me.

> 
> Changes compared to v2:
>   - Replace "isb" by "instr_sync" to fix the arm v6 build (e.g.
>     allmodconfig),
> 
> Changes compared to v1:
>   - New patch "[PATCH v2 1/3] ARM: Add definition for monitor mode",
>   - Initialize CNTVOFF on Cortex-A15, too,
>   - Use *_MODE definitions instead of hardcoded values,
>   - Reduce duplication by calling the asm version from C,
>   - Always build headsmp-apmu.o on R-Car Gen2.
> 
> This has been tested on r8a7794/alt (dual Cortex-A7), and regression-tested
> on r8a7790/lager (quad Cortex-A15), and r8a7791/koelsch, r8a7791/porter,
> r8a7792/blanche, and r8a7793/gose (dual Cortex-A15).
> 
> Thanks!
> 
> Geert Uytterhoeven (2):
>   ARM: Add definition for monitor mode
>   ARM: shmobile: rcar-gen2: Make sure CNTVOFF is initialized on CA7/15
> 
> Sergei Shtylyov (1):
>   ARM: dts: r8a7794: Add SMP support
> 
>  arch/arm/boot/dts/r8a7794.dtsi           |  7 ++++++
>  arch/arm/include/uapi/asm/ptrace.h       |  1 +
>  arch/arm/mach-shmobile/Makefile          |  1 +
>  arch/arm/mach-shmobile/common.h          |  2 ++
>  arch/arm/mach-shmobile/headsmp-apmu.S    | 37 ++++++++++++++++++++++++++++++++
>  arch/arm/mach-shmobile/platsmp-apmu.c    |  2 +-
>  arch/arm/mach-shmobile/setup-rcar-gen2.c | 20 ++---------------
>  7 files changed, 51 insertions(+), 19 deletions(-)
>  create mode 100644 arch/arm/mach-shmobile/headsmp-apmu.S
> 
> -- 
> 2.7.4
> 
