Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:37796 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752065AbdJFMF6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Oct 2017 08:05:58 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] arm64: dts: renesas: Add INTC-EX device node on R-Car M3-W, V3M, and D3
Date: Fri,  6 Oct 2017 14:05:50 +0200
Message-Id: <1507291553-24396-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

This patch series adds device nodes for the Interrupt Controller for
External Devices (INTC-EX) to the DT sources for the R-Car M3-W, V3M, and
D3 SoCs.

This has been tested on Salvator-X with R-Car M3-W.
(FWIW, I also tested on Salvator-XS with H3 ES2.0).

The compatible values used depend on the DT binding update "[PATCH]
dt-bindings: irqchip: renesas-irqc: Document R-Car M3-W, V3M, D3 support",
but they are non-controversial.

Actual use may depend on pinctrl patches (e.g. "[PATCH 2/3] pinctrl:
sh-pfc: r8a7796: Add support for INTC-EX IRQ pins").

Thanks!

Geert Uytterhoeven (3):
  arm64: dts: r8a7796: Add INTC-EX device node
  arm64: dts: r8a77970: Add INTC-EX device node
  arm64: dts: r8a77995: Add INTC-EX device node

 arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 16 ++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 16 ++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 16 ++++++++++++++++
 3 files changed, 48 insertions(+)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
