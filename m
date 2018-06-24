Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:39457 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751585AbeFXB1K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 23 Jun 2018 21:27:10 -0400
Received: by mail-lf0-f68.google.com with SMTP id t2-v6so11826752lfd.6
        for <linux-renesas-soc@vger.kernel.org>; Sat, 23 Jun 2018 18:27:09 -0700 (PDT)
Date: Sat, 23 Jun 2018 18:26:38 -0700
From: Olof Johansson <olof@lixom.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: =?iso-8859-1?Q?Myl=E8ne?= Josserand
        <mylene.josserand@bootlin.com>, Arnd Bergmann <arnd@arndb.de>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] ARM: Always build secure_cntvoff.S on ARM V7 to fix
 shmobile !SMP build
Message-ID: <20180624012638.dbqw5efzf6ubodgw@localhost>
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

Thanks, applied to fixes.


-Olof
