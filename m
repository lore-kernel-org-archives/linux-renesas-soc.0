Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:60490 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932213AbeFKOtw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jun 2018 10:49:52 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/3] arch: convert to SPDX identifiers
Date: Mon, 11 Jun 2018 23:49:34 +0900
Message-Id: <20180611144937.9554-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

So, here are the first patches to convert files copyright by Renesas to the
SPDX format. I have way more pending, but these are the easiest ones for now.

In 'mach-shmobile', there are a few files left which don't have a clear GPL2
only statement. I want to leave them for now, group the problematic cases
later, and fix those in batches per group.

But for now, let's fix ARM DTS, ARM64 DTS, and mach-shmobile first.

I used scripts and macros to assist me and to double check, but in the end this
was still a somewhat manual process.

Stress testing welcome :)

Thanks,

   Wolfram

Wolfram Sang (3):
  arm64: dts: renesas: convert to SPDX identifiers
  ARM: dts: convert to SPDX identifier for Renesas boards
  ARM: shmobile: convert to SPDX identifier

 arch/arm/boot/dts/emev2-kzm9d.dts                      |  5 +----
 arch/arm/boot/dts/emev2.dtsi                           |  5 +----
 arch/arm/boot/dts/iwg20d-q7-common.dtsi                |  5 +----
 arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi               |  5 +----
 arch/arm/boot/dts/r7s72100-genmai.dts                  |  5 +----
 arch/arm/boot/dts/r7s72100-gr-peach.dts                |  5 +----
 arch/arm/boot/dts/r7s72100-rskrza1.dts                 |  5 +----
 arch/arm/boot/dts/r7s72100.dtsi                        |  5 +----
 arch/arm/boot/dts/r8a73a4-ape6evm.dts                  |  5 +----
 arch/arm/boot/dts/r8a73a4.dtsi                         |  5 +----
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts          |  5 +----
 arch/arm/boot/dts/r8a7740.dtsi                         |  5 +----
 arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts        |  5 +----
 arch/arm/boot/dts/r8a7743-iwg20d-q7.dts                |  5 +----
 arch/arm/boot/dts/r8a7743-iwg20m.dtsi                  |  5 +----
 arch/arm/boot/dts/r8a7743-sk-rzg1m.dts                 |  5 +----
 arch/arm/boot/dts/r8a7743.dtsi                         |  5 +----
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts    |  5 +----
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts            |  5 +----
 arch/arm/boot/dts/r8a7745-iwg22m.dtsi                  |  5 +----
 arch/arm/boot/dts/r8a7745-sk-rzg1e.dts                 |  5 +----
 arch/arm/boot/dts/r8a7745.dtsi                         |  5 +----
 arch/arm/boot/dts/r8a7778-bockw.dts                    |  5 +----
 arch/arm/boot/dts/r8a7778.dtsi                         |  5 +----
 arch/arm/boot/dts/r8a7779-marzen.dts                   |  5 +----
 arch/arm/boot/dts/r8a7779.dtsi                         |  5 +----
 arch/arm/boot/dts/r8a7790-lager.dts                    |  5 +----
 arch/arm/boot/dts/r8a7790.dtsi                         |  5 +----
 arch/arm/boot/dts/r8a7791-koelsch.dts                  |  5 +----
 arch/arm/boot/dts/r8a7791-porter.dts                   |  5 +----
 arch/arm/boot/dts/r8a7791.dtsi                         |  5 +----
 arch/arm/boot/dts/r8a7792-blanche.dts                  |  5 +----
 arch/arm/boot/dts/r8a7792-wheat.dts                    |  5 +----
 arch/arm/boot/dts/r8a7792.dtsi                         |  5 +----
 arch/arm/boot/dts/r8a7793-gose.dts                     |  5 +----
 arch/arm/boot/dts/r8a7793.dtsi                         |  5 +----
 arch/arm/boot/dts/r8a7794-alt.dts                      |  5 +----
 arch/arm/boot/dts/r8a7794-silk.dts                     |  5 +----
 arch/arm/boot/dts/r8a7794.dtsi                         |  5 +----
 arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi         |  5 +----
 arch/arm/boot/dts/r8a77xx-aa121td01-panel.dtsi         |  5 +----
 arch/arm/boot/dts/sh73a0-kzm9g.dts                     |  5 +----
 arch/arm/boot/dts/sh73a0.dtsi                          |  5 +----
 arch/arm/include/debug/renesas-scif.S                  |  5 +----
 arch/arm/mach-shmobile/headsmp-apmu.S                  |  5 +----
 arch/arm/mach-shmobile/platsmp-apmu.c                  |  5 +----
 arch/arm/mach-shmobile/platsmp-apmu.h                  | 10 +---------
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c     | 10 +---------
 arch/arm/mach-shmobile/setup-emev2.c                   | 10 +---------
 arch/arm/mach-shmobile/setup-r7s72100.c                | 10 +---------
 arch/arm/mach-shmobile/setup-r8a73a4.c                 | 10 +---------
 arch/arm/mach-shmobile/setup-r8a7740.c                 | 10 +---------
 arch/arm/mach-shmobile/setup-r8a7778.c                 | 10 +---------
 arch/arm/mach-shmobile/setup-r8a7779.c                 | 10 +---------
 arch/arm/mach-shmobile/setup-r8a7790.c                 | 10 +---------
 arch/arm/mach-shmobile/setup-r8a7791.c                 | 10 +---------
 arch/arm/mach-shmobile/setup-rcar-gen2.c               | 10 +---------
 arch/arm/mach-shmobile/setup-sh73a0.c                  | 10 +---------
 arch/arm/mach-shmobile/smp-emev2.c                     | 10 +---------
 arch/arm/mach-shmobile/smp-r8a7779.c                   | 10 +---------
 arch/arm/mach-shmobile/smp-r8a7790.c                   | 10 +---------
 arch/arm/mach-shmobile/smp-r8a7791.c                   | 10 +---------
 arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts  |  5 +----
 arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts     |  5 +----
 arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts |  5 +----
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi           |  5 +----
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dts      |  5 +----
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts         |  5 +----
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts     |  5 +----
 arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts    |  5 +----
 arch/arm64/boot/dts/renesas/r8a7795.dtsi               |  5 +----
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts      |  5 +----
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts         |  5 +----
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts     |  5 +----
 arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts    |  5 +----
 arch/arm64/boot/dts/renesas/r8a7796.dtsi               |  5 +----
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts         |  5 +----
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts         |  5 +----
 arch/arm64/boot/dts/renesas/r8a77970.dtsi              |  5 +----
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts         |  5 +----
 arch/arm64/boot/dts/renesas/r8a77995.dtsi              |  5 +----
 arch/arm64/boot/dts/renesas/salvator-common.dtsi       |  5 +----
 arch/arm64/boot/dts/renesas/salvator-x.dtsi            |  5 +----
 arch/arm64/boot/dts/renesas/salvator-xs.dtsi           |  5 +----
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi               |  5 +----
 arch/arm64/boot/dts/renesas/ulcb.dtsi                  |  5 +----
 86 files changed, 86 insertions(+), 424 deletions(-)

-- 
2.11.0
