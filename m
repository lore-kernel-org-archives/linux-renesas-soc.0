Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:47000 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733254AbeKOVcX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Nov 2018 16:32:23 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] ARM: shmobile: Restrict SCU/TWD support to SoCs that have it
Date: Thu, 15 Nov 2018 10:56:37 +0100
Message-Id: <20181115095639.17206-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

When Renesas ARM multi-platform support was conceived in commit
efacfce5f8a52345 ("ARM: shmobile: Introduce ARCH_SHMOBILE_MULTI"),
support for the ARM Cortex-A9 Snoop Control Unit and the Timer and
Watchdog Unit was enabled unconditionally.

However, only some Renesas multicore Cortex-A9 SoCs have these units,
and in the modern world, the share of Cortex-A9 SoCs is decreasing.

Hence only enable support for the SCU and TWD when building a kernel
that includes support for SoCs that have these units.

Thanks!

Geert Uytterhoeven (2):
  ARM: shmobile: Restrict SCU support to SoCs that have it
  ARM: shmobile: Restrict TWD support to SoCs that have it

 arch/arm/mach-shmobile/Kconfig | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
