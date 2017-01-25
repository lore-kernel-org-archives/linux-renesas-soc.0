Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:34440 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751386AbdAYNTa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 08:19:30 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: Mark EthernetAVB device nodes disabled
Date: Wed, 25 Jan 2017 14:19:29 +0100
Message-Id: <1485350371-16091-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

This patch series marks the EthernetAVB device nodes in the R-Car H3 and
M3-W DTSes disabled.
Device nodes representing I/O devices should be marked disabled in the
SoC-specific DTSes, and overridden by board-specific DTSes where needed.

Thanks for applying!

Geert Uytterhoeven (2):
  arm64: dts: r8a7795: Mark EthernetAVB device node disabled
  arm64: dts: r8a7796: Mark EthernetAVB device node disabled

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 1 +
 2 files changed, 2 insertions(+)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
