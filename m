Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:49184 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755138AbdIRNsh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Sep 2017 09:48:37 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 00/12] ARM: dts: renesas: Update DTS for CMT DT binding rework
Date: Mon, 18 Sep 2017 15:48:23 +0200
Message-Id: <1505742515-31727-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

This patch series updates the CMT device nodes in the various Renesas DTS
files sh_cmt clocksource driver for the recent DT binding rework that was
merged in v4.14-rc1.

This series is an evolutionary improvement of Magnus Damm's series "[PATCH
v2 00/11] clocksource: sh_cmt: DT binding rework V2".
It complements Magnus' series "[PATCH v3 00/06] clocksource: sh_cmt: DT 
binding rework V3" and "[PATCH v4 00/06] clocksource: sh_cmt: DT binding 
rework V4", which included DT binding updates only.

  - Patches 1-5 update the compatible values for the CMT0 and CMT1 device
    nodes on R-Mobile APE6 and R-Car Gen2,
  - Patches 6-12 remove the now obsolete "renesas,channels-mask" properties
    from the CMT device nodes on all affected SoCs.

Changes compared to v2:
  - Take over from Magnus,
  - Update compatible values,
  - Split in per-SoC patches,

Dependencies:
  - This patch series has a runtime dependency on "[PATCH v3 0/7]
    clocksource: sh_cmt: Update driver for DT binding rework", and thus
    must not be applied yet,
  - Patches were created against renesas-devel-20170918-v4.14-rc1.

Thanks!

Magnus Damm (12):
  ARM: dts: r8a73a4: Update CMT compat string
  ARM: dts: r8a7790: Update CMT compat strings
  ARM: dts: r8a7791: Update CMT compat strings
  ARM: dts: r8a7793: Update CMT compat strings
  ARM: dts: r8a7794: Update CMT compat strings
  ARM: dts: r8a73a4: Remove CMT renesas,channels-mask
  ARM: dts: r8a7740: Remove CMT renesas,channels-mask
  ARM: dts: r8a7790: Remove CMT renesas,channels-mask
  ARM: dts: r8a7791: Remove CMT renesas,channels-mask
  ARM: dts: r8a7793: Remove CMT renesas,channels-mask
  ARM: dts: r8a7794: Remove CMT renesas,channels-mask
  ARM: dts: sh73a0: Remove CMT renesas,channels-mask

 arch/arm/boot/dts/r8a73a4.dtsi | 5 +----
 arch/arm/boot/dts/r8a7740.dtsi | 3 ---
 arch/arm/boot/dts/r8a7790.dtsi | 8 ++------
 arch/arm/boot/dts/r8a7791.dtsi | 8 ++------
 arch/arm/boot/dts/r8a7793.dtsi | 8 ++------
 arch/arm/boot/dts/r8a7794.dtsi | 8 ++------
 arch/arm/boot/dts/sh73a0.dtsi  | 3 ---
 7 files changed, 9 insertions(+), 34 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
