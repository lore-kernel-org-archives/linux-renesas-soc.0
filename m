Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:58920 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935391AbeEIPX1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 May 2018 11:23:27 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] arm64: dts: renesas: r8a77970: Add SMP Support
Date: Wed,  9 May 2018 17:23:21 +0200
Message-Id: <1525879403-12207-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

        Hi Simon, Magnus,

This patch series enables SMP support on the R-Car V3M SoC, by adding
the second Cortex-A53 CPU core.  It also adds the performance monitor
unit, and links it to both CPU cores.

Changes compared to v1:
  - Adjust GIC_CPU_MASK_SIMPLE(),
  - Use symbolic core clock and power domain indices,
  - Move the pmu node from the soc subnode to the root node, as it
    doesn't have registers.

Note that the PSCI implementation on Eagle may be a preliminary version
with some familiar quirks:
  - SMP bringup works, and both CPUs can be used,
  - Offlining CPU0 crashes the system,
  - CPU1 can be offlined, but trying to bring it online again crashes
    the system, too.

I'm confident these will be fixed in future firmware versions, just like
on H3/Salvator-X.  Note that
git@github.com:renesas-rcar/arm-trusted-firmware.git does not have
support for R-Car V3M, V3H, and D3.

Thanks!

Geert Uytterhoeven (2):
  arm64: dts: renesas: r8a77970: Add secondary CA53 CPU core
  arm64: dts: renesas: r8a77970: Add Cortex-A53 PMU node

 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
