Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56475 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751021AbeFHH7i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jun 2018 03:59:38 -0400
Date: Fri, 8 Jun 2018 09:59:34 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: =?utf-8?Q?Myl=C3=A8ne?= Josserand <mylene.josserand@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] ARM: Always build secure_cntvoff.S on ARM V7 to fix
 shmobile !SMP build
Message-ID: <20180608075933.aukpeysbjifpypv2@verge.net.au>
References: <1528277116-14533-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1528277116-14533-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 06, 2018 at 11:25:16AM +0200, Geert Uytterhoeven wrote:
> If CONFIG_SMP=n, building a kernel for R-Car Gen2 fails with:
> 
>     arch/arm/mach-shmobile/setup-rcar-gen2.o: In function `rcar_gen2_timer_init':
>     setup-rcar-gen2.c:(.init.text+0x30): undefined reference to `secure_cntvoff_init'
> 
> Indeed, on R-Car Gen2 SoCs, secure_cntvoff_init() is not only needed for
> secondary CPUs, but also for the boot CPU.  This is most visible on SoCs
> with Cortex A7 cores (e.g. R-Car E2, cfr. commit 9ce3fa6816c2fb59 ("ARM:
> shmobile: rcar-gen2: Add CA7 arch_timer initialization for r8a7794")),
> but Cortex A15 is affected, too.
> 
> Fix this by always providing secure_cntvoff_init() when building for ARM
> V7.
> 
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 7c607944bc657616 ("ARM: smp: Add initialization of CNTVOFF")
> Fixes: cad160ed0a94927e ("ARM: shmobile: Convert file to use cntvoff")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> v2:
>   - Add Reviewed-by,
>   - Add a dependency on CPU_V7.
> ---
>  arch/arm/common/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/common/Makefile b/arch/arm/common/Makefile
> index 1e9f7af8f70ff6ba..3157be413297e5d2 100644
> --- a/arch/arm/common/Makefile
> +++ b/arch/arm/common/Makefile
> @@ -10,7 +10,7 @@ obj-$(CONFIG_DMABOUNCE)		+= dmabounce.o
>  obj-$(CONFIG_SHARP_LOCOMO)	+= locomo.o
>  obj-$(CONFIG_SHARP_PARAM)	+= sharpsl_param.o
>  obj-$(CONFIG_SHARP_SCOOP)	+= scoop.o
> -obj-$(CONFIG_SMP)		+= secure_cntvoff.o
> +obj-$(CONFIG_CPU_V7)		+= secure_cntvoff.o
>  obj-$(CONFIG_PCI_HOST_ITE8152)  += it8152.o
>  obj-$(CONFIG_MCPM)		+= mcpm_head.o mcpm_entry.o mcpm_platsmp.o vlock.o
>  CFLAGS_REMOVE_mcpm_entry.o	= -pg
> -- 
> 2.7.4
> 
