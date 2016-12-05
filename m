Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:52018 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750816AbcLEKjn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2016 05:39:43 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/5] ARM: shmobile: R-Car Gen2: Allow booting secondary CPU cores in debug mode
Date: Mon,  5 Dec 2016 11:39:36 +0100
Message-Id: <1480934381-32126-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

This patch series allows booting secondary CPU cores on R-Car Gen2 when
hardware debug mode is enabled. In this mode, reset requests derived
from power-shutoff to the AP-system CPU cores must be enabled before the
AP-system CPU cores resume from power-shutoff for the first time.
Else resume may fail, causing the system to hang during boot.
Currently we avoid the hang by prohibiting booting secondary CPU cores
when hardware debug mode is enabled (except on legacy r8a7790, see
below).

On all R-Car Gen2 SoCs, hardware debug mode is enabled by setting
MD21=1.  On both Koelsch and Lager, this is done by setting mode switch
SW8-4 to OFF.

Unfortunately the hang is not easy to reproduce: I only saw it (on
Koelsch) during real cold boot (power off during the night), and even
then it's not guaranteed to trigger. Pressing the reset button
afterwards recovers the system, and a subsequent boot will succeed
(incl. secondary CPU core boot).

This series configures the reset requests as documented in the R-Car
Gen2 datasheet, and removes the check for MD21 during secondary CPU
bringup.  It was inspired by CPU-specific patches in the BSP by
Nakamura-san.

And finally, we get rid of reading the Mode Monitoring register using
hardcoded addresses in platform code!

This series also fixes a minor regression introduced by adding the
"renesas,apmu" enable-method on Lager, where secondary CPU cores are no
longer available when hardware debug mode is enabled.

This has been boot-tested on r8a7791/koelsch (both debug mode and normal
mode), on r8a7790/lager, r8a7792/blanche, and r8a7793/gose (normal mode
only), and on r8a7794/alt (normal mode UP only).  Its core parts have
been in renesas-drivers since renesas-drivers-2016-09-06-v4.8-rc5.

Changes compared to v1:
  - Add Tested-by,
  - New patch "ARM: shmobile: rcar-gen2: Remove unused
    rcar_gen2_read_mode_pins()".

This series is against renesas-devel-20161202-v4.9-rc7, with my
"rcar-rst" branch merged in, which resulted in a merge conflict.
The latter dependency is present in clk-next, and expected to land
upstream in v4.10-rc1.

For your convenience (and for conflict resolution), this series is also
available in the topic/rcar-secondary-booting-in-debug-mode-v2 branch of
my renesas-drivers git repository at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git

Thanks for applying!

Geert Uytterhoeven (5):
  ARM: shmobile: apmu: Add more register documentation
  ARM: shmobile: apmu: Add debug resource reset for secondary CPU boot
  ARM: shmobile: apmu: Allow booting secondary CPU cores in debug mode
  ARM: shmobile: r8a7791: Allow booting secondary CPU cores in debug
    mode
  ARM: shmobile: rcar-gen2: Remove unused rcar_gen2_read_mode_pins()

 arch/arm/mach-shmobile/platsmp-apmu.c    | 41 +++++++++++++++++++-------------
 arch/arm/mach-shmobile/rcar-gen2.h       |  2 --
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 18 --------------
 arch/arm/mach-shmobile/smp-r8a7791.c     | 14 +----------
 4 files changed, 25 insertions(+), 50 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
