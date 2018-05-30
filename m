Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:51566 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753480AbeE3PZT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 May 2018 11:25:19 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/6] ARM: shmobile: rcar: Drop lehacy SYSC fallbacks
Date: Wed, 30 May 2018 17:25:10 +0200
Message-Id: <1527693916-11215-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

When DT SYSC support was introduced in v4.7, legacy fallbacks were kept
to keep secondary CPUs working on R-Car H1, H2, and M2-W using old DTBs.
However, the time has come to drop these fallbacks, and clean up the
resulting code.

Most of this was written when I worked on DT SYSC support, but postponed
until the time was ripe.  So basically I've been running this during the
last +2 years.

I avoided touching drivers/soc/renesas and arch/arm/mach-shmobile code
in the same patch.  If you prefer some patches to be squashed, please
let me know.

Tested on Marzen (R-Car H1), Lager (R-Car H2), and Koelsch (R-Car M2-W).

Thanks!

Geert Uytterhoeven (6):
  ARM: shmobile: rcar-gen2: Remove explicit SYSC config and init
  ARM: shmobile: r8a7779: Stop powering down secondary CPUs during early
    boot
  soc: renesas: rcar-sysc: Provide helpers to power up/down CPUs
  ARM: shmobile: r8a7779: Use rcar_sysc_power_{down,up}_cpu()
  ARM: shmobile: r8a7779: Remove explicit SYSC config and init
  soc: renesas: rcar-sysc: Drop legacy handling

 arch/arm/mach-shmobile/Makefile       |  2 +-
 arch/arm/mach-shmobile/pm-r8a7779.c   | 41 ----------------------
 arch/arm/mach-shmobile/pm-rcar-gen2.c | 25 --------------
 arch/arm/mach-shmobile/r8a7779.h      |  2 --
 arch/arm/mach-shmobile/smp-r8a7779.c  | 54 ++++-------------------------
 drivers/soc/renesas/rcar-sysc.c       | 64 ++++++++++++++++++++++-------------
 include/linux/soc/renesas/rcar-sysc.h | 13 ++-----
 7 files changed, 50 insertions(+), 151 deletions(-)
 delete mode 100644 arch/arm/mach-shmobile/pm-r8a7779.c

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
