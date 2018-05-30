Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:36028 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753784AbeE3PPc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 May 2018 11:15:32 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] ARM: shmobile: apmu: Cleanups after legacy SMP fallback removal
Date: Wed, 30 May 2018 17:15:25 +0200
Message-Id: <1527693328-10559-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

Now the legacy SMP fallbacks for R-Car H2 and M2-W have been removed, a
few more code cleanups can be applied.

The third patch is a bit larger than I had hoped, due to the need to
reshuffle a few functions in the absence of forward declarations.

Tested on Lager (R-Car H2) and Koelsch (R-Car M2-W).

Thanks!

Geert Uytterhoeven (3):
  ARM: shmobile: apmu: Move cpu_leave_lowpower() to SUSPEND section
  ARM: shmobile: apmu: Remove obsolete shmobile_smp_apmu_prepare_cpus()
  ARM: shmobile: apmu: Remove platsmp-apmu.h

 arch/arm/mach-shmobile/platsmp-apmu.c | 240 ++++++++++++++--------------------
 arch/arm/mach-shmobile/platsmp-apmu.h |  32 -----
 2 files changed, 100 insertions(+), 172 deletions(-)
 delete mode 100644 arch/arm/mach-shmobile/platsmp-apmu.h

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
