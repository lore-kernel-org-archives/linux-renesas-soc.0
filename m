Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:45920 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753930AbdCFQ6c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2017 11:58:32 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/6] ARM: dts: renesas: Add INTC-SYS clock to device tree
Date: Mon,  6 Mar 2017 17:58:05 +0100
Message-Id: <1488819491-26097-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

This patch series improves the topology description in DT of the ARM GIC
on Renesas SoCs using the legacy CPG/MSTP bindings (R-Mobile APE6 and
R-Car Gen2).  It describes the INTC-SYS clock, links the GIC to its
module clock, and adds the GIC to the SYSC "always on" PM Domain.

Note that currently the GIC-400 driver doesn't support module clocks nor
Runtime PM, so this must be handled as a critical clock.  Hence this
series depends on commit e34084fb9a023d1d ("clk: renesas: mstp: Make
INTC-SYS a critical clock"), which is in v4.11-rc1.

This series is the counterpart of "[PATCH 0/4] ARM/arm64: dts: renesas:
Link ARM GIC to clock and clock domain" for SoCs not yet migrated to the
new CPG/MSSR driver.  The latter is already part of v4.11-rc1 as it had
less dependencies.

Changes compared to v1:
  - Add missing "power-domains" property,
  - Add clock-names property,
  - Rebased on top of CPG Clock Domain and R-Car SYSC PM Domain support,
  - Add r8a7792 patch,
  - Please refer to the individual patch changelogs for more details
    (v1 dates back to 2014).

Thanks for applying!

Geert Uytterhoeven (6):
  ARM: dts: r8a73a4: Add INTC-SYS clock to device tree
  ARM: dts: r8a7790: Add INTC-SYS clock to device tree
  ARM: dts: r8a7791: Add INTC-SYS clock to device tree
  ARM: dts: r8a7792: Add INTC-SYS clock to device tree
  ARM: dts: r8a7793: Add INTC-SYS clock to device tree
  ARM: dts: r8a7794: Add INTC-SYS clock to device tree

 arch/arm/boot/dts/r8a73a4.dtsi            | 13 +++++++++----
 arch/arm/boot/dts/r8a7790.dtsi            |  9 ++++++---
 arch/arm/boot/dts/r8a7791.dtsi            |  9 ++++++---
 arch/arm/boot/dts/r8a7792.dtsi            | 11 ++++++++---
 arch/arm/boot/dts/r8a7793.dtsi            | 11 ++++++++---
 arch/arm/boot/dts/r8a7794.dtsi            |  9 ++++++---
 include/dt-bindings/clock/r8a73a4-clock.h |  1 +
 include/dt-bindings/clock/r8a7790-clock.h |  1 +
 include/dt-bindings/clock/r8a7791-clock.h |  1 +
 include/dt-bindings/clock/r8a7792-clock.h |  1 +
 include/dt-bindings/clock/r8a7793-clock.h |  5 +++--
 include/dt-bindings/clock/r8a7794-clock.h |  1 +
 12 files changed, 51 insertions(+), 21 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
