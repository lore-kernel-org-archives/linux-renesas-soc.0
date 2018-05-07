Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:57704 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751794AbeEGNkH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 May 2018 09:40:07 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] ARM: dts: renesas: Add missing interrupt-affinity to PMU
Date: Mon,  7 May 2018 15:40:03 +0200
Message-Id: <1525700405-7993-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

The Cortex-A9 PMU nodes on SH-Mobile AG5 and Emma Mobile EV2 reference
two interrupts, but lack interrupt-affinity properties, leading to:

    hw perfevents: no interrupt-affinity property for /pmu, guessing.

This series adds the missing properties to fix this.

Thanks!

Geert Uytterhoeven (2):
  ARM: dts: sh73a0: Add missing interrupt-affinity to PMU node
  ARM: dts: emev2: Add missing interrupt-affinity to PMU node

 arch/arm/boot/dts/emev2.dtsi  | 5 +++--
 arch/arm/boot/dts/sh73a0.dtsi | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
