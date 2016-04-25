Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:57592 "EHLO
	xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754679AbcDYOIj (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 25 Apr 2016 10:08:39 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/6] arm64/ARM: dts: renesas: Don't disable referenced optional clocks
Date: Mon, 25 Apr 2016 16:08:29 +0200
Message-Id: <1461593315-21307-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

clk_get() on a disabled clock node will return -EPROBE_DEFER, which can
cause drivers to be deferred forever if such clocks are referenced in
their devices' clocks properties. Disabled clock nodes show this
behavior as of commit 3e5dd6f6e690048d ("clk: Ignore disabled DT clock
providers"), which is in v4.6-rc1.

Commit ac6908b3049397b1 ("ARM: dts: r8a7791: Don't disable referenced
optional clocks") fixed this for the Porter development board, which
doesn't have the SCIF_CLK crystal populated.  This patch series fixes
the same problem for the remaining Renesas DTSes, by updating disabled
external clock nodes to default to a frequency of 0, but not disabling
them.

None of these should show up with in-tree supported boards, but Jürg
Billeter <j@bitron.ch> reported seeing the problem with v4.6-rc5 on a
custom R-Car H3 board. Hence you may want to queue at least the arm64
fix for v4.6.

Thanks!

Geert Uytterhoeven (6):
  arm64: dts: r8a7795: Don't disable referenced optional clocks
  ARM: dts: r8a7778: Don't disable referenced optional clocks
  ARM: dts: r8a7779: Don't disable referenced optional clocks
  ARM: dts: r8a7790: Don't disable referenced optional clocks
  ARM: dts: r8a7793: Don't disable referenced optional clocks
  ARM: dts: r8a7794: Don't disable referenced optional clocks

 arch/arm/boot/dts/r8a7778.dtsi                     | 1 -
 arch/arm/boot/dts/r8a7779.dtsi                     | 1 -
 arch/arm/boot/dts/r8a7790.dtsi                     | 5 +----
 arch/arm/boot/dts/r8a7793.dtsi                     | 2 --
 arch/arm/boot/dts/r8a7794.dtsi                     | 2 --
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 1 +
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 5 +----
 7 files changed, 3 insertions(+), 14 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
