Return-Path: <devicetree-owner@vger.kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH] ARM: dts: r7s72100: add power-domains to mmcif
Date: Mon, 23 Jan 2017 09:13:49 -0500
Message-Id: <20170123141349.29844-1-chris.brandt@renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s72100.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 3dd427d..354f4b6 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -466,6 +466,7 @@
 			      GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH
 			      GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp8_clks R7S72100_CLK_MMCIF>;
+		power-domains = <&cpg_clocks>;
 		reg-io-width = <4>;
 		bus-width = <8>;
 		status = "disabled";
-- 
2.10.1


