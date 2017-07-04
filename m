Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:40582 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752292AbdGDPlv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jul 2017 11:41:51 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/9] ARM: renesas: Use SMP jump stub SRAM region from DT
Date: Tue,  4 Jul 2017 17:41:34 +0200
Message-Id: <1499182903-31339-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Magnus, Mark, Rob, Simon,

The R-Car Gen2 platform code for CPU core bringup needs to copy a jump
stub to on-SoC SRAM.  Currently it uses a hardcoded address pointing to
ICRAM1.

This patch series adds support to specify this region from DT.  It
consists of 3 parts:
  - DT binding documentation for reserving SRAM for the jump stub,
  - A platform code update to retrieve the information from DT, if
    present (of course backwards-compatibility with old DTBs is
    preserved),
  - DT updates to reserve an SRAM region in DT on all R-Car Gen2 and
    RZ/G1 SoCs.

The DT patches in this series depend on "[PATCH 0/7] ARM: dts: renesas:
Add Inter Connect RAM".

Note that the current jump stub in Linux is 12 bytes long.  The patches
reserve 16 bytes of SRAM.  Should this be increased?  The mapping
granularity is PAGE_SIZE anyway.

Thanks for your comments!

Geert Uytterhoeven (9):
  dt-bindings: sram: Document renesas,smp-sram
  ARM: shmobile: rcar-gen2: Obtain jump stub region from DT
  ARM: dts: r8a7743: Reserve SRAM for the SMP jump stub
  ARM: dts: r8a7745: Reserve SRAM for the SMP jump stub
  ARM: dts: r8a7790: Reserve SRAM for the SMP jump stub
  ARM: dts: r8a7791: Reserve SRAM for the SMP jump stub
  ARM: dts: r8a7792: Reserve SRAM for the SMP jump stub
  ARM: dts: r8a7793: Reserve SRAM for the SMP jump stub
  ARM: dts: r8a7794: Reserve SRAM for the SMP jump stub

 .../devicetree/bindings/sram/renesas,smp-sram.txt  | 27 ++++++++++++++++++
 arch/arm/boot/dts/r8a7743.dtsi                     |  8 ++++++
 arch/arm/boot/dts/r8a7745.dtsi                     |  8 ++++++
 arch/arm/boot/dts/r8a7790.dtsi                     |  8 ++++++
 arch/arm/boot/dts/r8a7791.dtsi                     |  8 ++++++
 arch/arm/boot/dts/r8a7792.dtsi                     |  8 ++++++
 arch/arm/boot/dts/r8a7793.dtsi                     |  8 ++++++
 arch/arm/boot/dts/r8a7794.dtsi                     |  8 ++++++
 arch/arm/mach-shmobile/pm-rcar-gen2.c              | 33 ++++++++++++++++++++--
 9 files changed, 113 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sram/renesas,smp-sram.txt

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
