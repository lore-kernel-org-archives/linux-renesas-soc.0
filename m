Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:42900 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752005AbdJ3QHV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Oct 2017 12:07:21 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a77970: Add SMP Support
Date: Mon, 30 Oct 2017 17:07:11 +0100
Message-Id: <1509379633-25823-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

This patch series enables SMP support on the R-Car V3M SoC, by adding
the second Cortex-A53 CPU core.  It also adds the performance monitor
unit, and links it to both CPU cores.

Note that the PSCI implementation on Eagle may be a preliminary version
with some familiar quirks:
  - SMP bringup works, and both CPUs can be used,
  - Offlining CPU0 crashes the system,
  - CPU1 can be offlined, but trying to bring it online again crashes
    the system, too.

I'm confident these will be fixed in future firmware versions, just like
on H3/Salvator-X.

Thanks!

Geert Uytterhoeven (2):
  arm64: dts: renesas: r8a77970: Add secondary CA53 CPU core
  arm64: dts: renesas: r8a77970: Add Cortex-A53 PMU node

 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
