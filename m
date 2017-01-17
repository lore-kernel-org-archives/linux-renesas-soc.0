Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:52694 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750892AbdAQMts (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jan 2017 07:49:48 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] ARM/arm64: dts: renesas: Link ARM GIC to clock and clock domain
Date: Tue, 17 Jan 2017 13:49:16 +0100
Message-Id: <1484657360-13101-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

This patch series improves the topology description in DT of the ARM GIC
on Renesas SoCs using the CPG/MSSR bindings (R-Car Gen3 and RZ/G).
It links the GIC to its module clock, and adds it to the SYSC "always
on" PM Domain.

Note that currently the GIC-400 driver doesn't support module clocks nor
Runtime PM, so this must be handled as a critical clock.
As the CPG/MSSR driver, unlike the legacy MSTP driver, is already aware
of critical clocks, this series can be applied right now.

Thanks!

Geert Uytterhoeven (4):
  ARM: dts: r8a7743: Link ARM GIC to clock and clock domain
  ARM: dts: r8a7745: Link ARM GIC to clock and clock domain
  arm64: dts: r8a7795: Link ARM GIC to clock and clock domain
  arm64: dts: r8a7796: Link ARM GIC to clock and clock domain

 arch/arm/boot/dts/r8a7743.dtsi           | 3 +++
 arch/arm/boot/dts/r8a7745.dtsi           | 3 +++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 3 +++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 3 +++
 4 files changed, 12 insertions(+)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
