Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:58802 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751438AbcISOTA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Sep 2016 10:19:00 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] ARM: dts: rcar-gen2: Correct SCIFB reg properties to cover all
Date: Mon, 19 Sep 2016 16:18:52 +0200
Message-Id: <1474294736-24339-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

Several SCIFB registers reside outside the register ranges as specified
by the "reg" properties of the various R-Car Gen2 DTSes.  Fortunately
this works (on Linux), due to the PAGE_SIZE granularity of ioremap().

Extend the sizes from 64 to 0x100 bytes to fix this, like is done on
SH/R-Mobile SoCs.

Thanks for applying!

Geert Uytterhoeven (4):
  ARM: dts: r8a7790: Correct SCIFB reg properties to cover all registers
  ARM: dts: r8a7791: Correct SCIFB reg properties to cover all registers
  ARM: dts: r8a7793: Correct SCIFB reg properties to cover all registers
  ARM: dts: r8a7794: Correct SCIFB reg properties to cover all registers

 arch/arm/boot/dts/r8a7790.dtsi | 6 +++---
 arch/arm/boot/dts/r8a7791.dtsi | 6 +++---
 arch/arm/boot/dts/r8a7793.dtsi | 6 +++---
 arch/arm/boot/dts/r8a7794.dtsi | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
