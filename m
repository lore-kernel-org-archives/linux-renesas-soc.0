Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:47994 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935104AbdCJNTh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2017 08:19:37 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 00/13] arm: dts: renesas: Tidy-up status
Date: Fri, 10 Mar 2017 14:19:03 +0100
Message-Id: <1489151956-19270-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

This patch series performs some cleanups on the Renesas DT source files:
  - Patch 1 replaces "ok" by "okay" in statuses, as the latter is the
    recommended form,
  - Patches 2-13 drop superfluous status updates when overriding the
    clock frequencies of fixed-frequency clocks, as they have already
    been enabled in the SoC-specific DTS file.

Thanks!

Geert Uytterhoeven (13):
  ARM: dts: porter: Always use status "okay" to enable devices
  ARM: dts: bockw: Drop superfluous status update for frequency override
  ARM: dts: marzen: Drop superfluous status update for frequency
    override
  ARM: dts: lager: Drop superfluous status update for frequency override
  ARM: dts: koelsch: Drop superfluous status updates for frequency
    overrides
  ARM: dts: porter: Drop superfluous status update for frequency
    override
  ARM: dts: gose: Drop superfluous status update for frequency override
  ARM: dts: alt: Drop superfluous status update for frequency override
  ARM: dts: silk: Drop superfluous status update for frequency override
  arm64: dts: h3ulcb: Drop superfluous status update for frequency
    override
  arm64: dts: r8a7795: salvator-x: Drop superfluous status updates for
    frequency overrides
  arm64: dts: m3ulcb: Drop superfluous status update for frequency
    override
  arm64: dts: r8a7796: salvator-x: Drop superfluous status update for
    frequency override

 arch/arm/boot/dts/r8a7778-bockw.dts                | 1 -
 arch/arm/boot/dts/r8a7779-marzen.dts               | 1 -
 arch/arm/boot/dts/r8a7790-lager.dts                | 1 -
 arch/arm/boot/dts/r8a7791-koelsch.dts              | 2 --
 arch/arm/boot/dts/r8a7791-porter.dts               | 5 ++---
 arch/arm/boot/dts/r8a7793-gose.dts                 | 1 -
 arch/arm/boot/dts/r8a7794-alt.dts                  | 1 -
 arch/arm/boot/dts/r8a7794-silk.dts                 | 1 -
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts     | 1 -
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 2 --
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts     | 1 -
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 1 -
 12 files changed, 2 insertions(+), 16 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
