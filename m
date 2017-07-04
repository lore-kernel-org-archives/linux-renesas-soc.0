Return-Path: <devicetree-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/7] ARM: dts: renesas: Add Inter Connect RAM
Date: Tue,  4 Jul 2017 17:23:11 +0200
Message-Id: <1499181798-28859-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

R-Car Gen2 and RZ/G1 SoCs contain two or three blocks of SRAM, which can be
used for several purposes.  One such purpose is holding a jump stub for CPU
core bringup.

This patch series adds the SRAM blocks to the various DTS files, following
the generic DT bindings for "mmio-sram" in
Documentation/devicetree/bindings/sram/sram.txt.  Reserving SRAM for jump
stub for CPU core bringup will be handled in a follow-up series.

Thanks!

Geert Uytterhoeven (7):
  ARM: dts: r8a7743: Add Inter Connect RAM
  ARM: dts: r8a7745: Add Inter Connect RAM
  ARM: dts: r8a7790: Add Inter Connect RAM
  ARM: dts: r8a7791: Add Inter Connect RAM
  ARM: dts: r8a7792: Add Inter Connect RAM
  ARM: dts: r8a7793: Add Inter Connect RAM
  ARM: dts: r8a7794: Add Inter Connect RAM

 arch/arm/boot/dts/r8a7743.dtsi | 15 +++++++++++++++
 arch/arm/boot/dts/r8a7745.dtsi | 15 +++++++++++++++
 arch/arm/boot/dts/r8a7790.dtsi | 10 ++++++++++
 arch/arm/boot/dts/r8a7791.dtsi | 10 ++++++++++
 arch/arm/boot/dts/r8a7792.dtsi | 10 ++++++++++
 arch/arm/boot/dts/r8a7793.dtsi | 10 ++++++++++
 arch/arm/boot/dts/r8a7794.dtsi | 10 ++++++++++
 7 files changed, 80 insertions(+)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
