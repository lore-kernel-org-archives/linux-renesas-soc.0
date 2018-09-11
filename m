Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:3111 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727246AbeIKPSN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Sep 2018 11:18:13 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 00/10] Add RZ/G1N support.
Date: Tue, 11 Sep 2018 11:12:41 +0100
Message-Id: <1536660771-32278-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch series aims to add support for Renesas RZ/G1N (r8a7744) SoC.

RZ/G1N SoC is similar to RZ/G1M and R-Car Gen2 M2-W/M2-N SoC.

This patch set is based on renesas-devel-20180906-v4.19-rc2.

Biju Das (10):
  dt-bindings: power: rcar-sysc: Document r8a7744 SYSC binding
  dt-bindings: power: rcar-sysc: Add r8a7744 power domain index macros
  soc: renesas: rcar-sysc: Add r8a7744 support
  dt-bindings: reset: rcar-rst: Document r8a7744 reset module
  soc: renesas: rcar-rst: Add support for RZ/G1N
  dt-bindings: clock: renesas: cpg-mssr: Document r8a7744 binding
  clk: renesas: Add r8a7744 CPG Core Clock Definitions
  clk: renesas: r8a7743: Add r8a7744 support
  ARM: shmobile: r8a7744: Basic SoC support
  cpufreq: dt: Add support for r8a7744

 .../devicetree/bindings/clock/renesas,cpg-mssr.txt | 11 +++---
 .../bindings/power/renesas,rcar-sysc.txt           |  1 +
 .../devicetree/bindings/reset/renesas,rst.txt      |  1 +
 arch/arm/mach-shmobile/Kconfig                     |  5 +++
 arch/arm/mach-shmobile/setup-rcar-gen2.c           |  2 ++
 drivers/clk/renesas/Kconfig                        |  2 +-
 drivers/clk/renesas/r8a7743-cpg-mssr.c             | 13 +++++++-
 drivers/clk/renesas/renesas-cpg-mssr.c             |  5 +++
 drivers/cpufreq/cpufreq-dt-platdev.c               |  1 +
 drivers/soc/renesas/Kconfig                        |  2 +-
 drivers/soc/renesas/rcar-rst.c                     |  1 +
 drivers/soc/renesas/rcar-sysc.c                    |  2 ++
 include/dt-bindings/clock/r8a7744-cpg-mssr.h       | 39 ++++++++++++++++++++++
 include/dt-bindings/power/r8a7744-sysc.h           | 24 +++++++++++++
 14 files changed, 101 insertions(+), 8 deletions(-)
 create mode 100644 include/dt-bindings/clock/r8a7744-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a7744-sysc.h

-- 
2.7.4
