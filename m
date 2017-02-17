Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:36890 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934222AbdBQPai (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2017 10:30:38 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] arm64: dts: r8a7796: Add Secondary CPU Cores
Date: Fri, 17 Feb 2017 16:30:32 +0100
Message-Id: <1487345435-1088-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

This patch series adds the second Cortex-A57 CPU core, and the
Cortex-A53 L2 cache-controller and CPU nodes on the Renesas R-Car M3-W
SoC to its DTS file.

Note that these patches add hardware description; actual enabling of the
CPU depends on the PSCI firmware.

With the current firmware version (v2.16.0), only the CA57 CPU cores are
enabled, hence the last patch does not introduce undeterministic
scheduling behavior due to migration between big and LITTLE cores.

Tested on r8a7796/salvator-x, with CPU hot(un)plug and system suspend.

Thanks for applying!

Geert Uytterhoeven (2):
  arm64: dts: r8a7796: Add CA53 L2 cache-controller node
  arm64: dts: r8a7796: Add Cortex-A53 CPU cores

Takeshi Kihara (1):
  arm64: dts: r8a7796: Add Cortex-A57 CPU cores

 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 64 +++++++++++++++++++++++++++++---
 1 file changed, 58 insertions(+), 6 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
