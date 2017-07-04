Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:50134 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752415AbdGDRDC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jul 2017 13:03:02 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] ARM: renesas: Enable SMP on R-Car E2
Date: Tue,  4 Jul 2017 19:02:11 +0200
Message-Id: <1499187733-1430-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Magnus, Mar[ck], Sergei, Simon,

This patch series enables SMP on R-Car E2 (r8a7794).

  - The first patch initializes CNTVOFF for secondary CPU cores, like is
    already done for the boot CPU core.  Without this, the ARM arch
    timer doesn't work on secondary CPU cores.
  - The second patch adds the required infrastructure (APMU device node
    and corresponding enable-method) to DT.
    This must not be applied on a branch that doesn't have the first
    patch!

According to the original comments, the CNTVOFF initialization is needed
on Cortex-A7 only, hence affects R-Car E2, which has a dual Cortex-A7
cluster.
Apparently it's not needed on other R-Car Gen2 members that have (only)
Cortex-A15 clusters.
Perhaps it's also needed on R-Car H2, which has a big.LITTLE
quad Cortex-A15 + quad Cortex-A7 configuration, when running Linux on
the Cortex-A7 cores?  How can I test that?

Thanks for your comments!

Geert Uytterhoeven (1):
  ARM: shmobile: Add CA7 arch_timer initialization for secondary CPUs

Sergei Shtylyov (1):
  ARM: dts: r8a7794: Add SMP support

 arch/arm/boot/dts/r8a7794.dtsi        |  7 +++++++
 arch/arm/mach-shmobile/Makefile       |  1 +
 arch/arm/mach-shmobile/common.h       |  1 +
 arch/arm/mach-shmobile/headsmp-apmu.S | 38 +++++++++++++++++++++++++++++++++++
 arch/arm/mach-shmobile/platsmp-apmu.c |  2 +-
 5 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/mach-shmobile/headsmp-apmu.S

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
