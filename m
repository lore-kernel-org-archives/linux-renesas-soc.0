Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from leibniz.telenet-ops.be ([195.130.137.77]:47833 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755148AbcHVOp4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2016 10:45:56 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by leibniz.telenet-ops.be (Postfix) with ESMTP id 3sHxFV4x7SzMqjSj
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2016 16:45:34 +0200 (CEST)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Hisashi Nakamura <hisashi.nakamura.ak@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFT 0/4] ARM: shmobile: R-Car Gen2: Allow booting secondary CPU cores in debug mode
Date: Mon, 22 Aug 2016 16:44:25 +0200
Message-Id: <1471877069-4157-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

This patch series is an attempt to allow booting secondary CPU cores on
R-Car Gen2 when hardware debug mode is enabled. In this mode, reset
requests derived from power-shutoff to the AP-system CPU cores must be
enabled before the AP-system cores first resume from power-shutoff. Else
resume may fail, causing the system to hang during boot. Currently we
avoid the hang by prohibiting booting secondary CPU cores when hardware
debug mode is enabled.

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

This series has been boot-tested on r8a7791/koelsch (both debug mode and
normal mode), on r8a7790/lager and r8a7793/gose (normal mode only), and
on r8a7794/alt (normal mode UP only).

Thanks!

Geert Uytterhoeven (4):
  ARM: shmobile: apmu: Add more register documentation
  ARM: shmobile: apmu: Add debug resource reset for secondary CPU boot
  ARM: shmobile: apmu: Allow booting secondary CPU cores in debug mode
  ARM: shmobile: r8a7791: Allow booting secondary CPU cores in debug
    mode

 arch/arm/mach-shmobile/platsmp-apmu.c | 41 ++++++++++++++++++++---------------
 arch/arm/mach-shmobile/smp-r8a7791.c  | 14 +-----------
 2 files changed, 25 insertions(+), 30 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
