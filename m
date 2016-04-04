Return-Path: <horms@vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 07/47] ARM: dts: r8a7790: Reference both DMA controllers in SCIFA nodes
Date: Mon,  4 Apr 2016 10:22:39 +0900
Message-Id: <f6daccce8850251f757e2739072118b7b430c4dc.1459732726.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1459732726.git.horms+renesas@verge.net.au>
References: <cover.1459732726.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

R-Car Gen2 have two DMA controllers, which are equivalent. Add
references to both dmac0 and dmac1 so the driver can fallback to the
later if the first one is unavailable.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7790.dtsi | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 0077de70b6a4..7d9ff0bde857 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -633,8 +633,9 @@
 		interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7790_CLK_SCIFA0>;
 		clock-names = "fck";
-		dmas = <&dmac0 0x21>, <&dmac0 0x22>;
-		dma-names = "tx", "rx";
+		dmas = <&dmac0 0x21>, <&dmac0 0x22>,
+		       <&dmac1 0x21>, <&dmac1 0x22>;
+		dma-names = "tx", "rx", "tx", "rx";
 		power-domains = <&cpg_clocks>;
 		status = "disabled";
 	};
@@ -646,8 +647,9 @@
 		interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7790_CLK_SCIFA1>;
 		clock-names = "fck";
-		dmas = <&dmac0 0x25>, <&dmac0 0x26>;
-		dma-names = "tx", "rx";
+		dmas = <&dmac0 0x25>, <&dmac0 0x26>,
+		       <&dmac1 0x25>, <&dmac1 0x26>;
+		dma-names = "tx", "rx", "tx", "rx";
 		power-domains = <&cpg_clocks>;
 		status = "disabled";
 	};
@@ -659,8 +661,9 @@
 		interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7790_CLK_SCIFA2>;
 		clock-names = "fck";
-		dmas = <&dmac0 0x27>, <&dmac0 0x28>;
-		dma-names = "tx", "rx";
+		dmas = <&dmac0 0x27>, <&dmac0 0x28>,
+		       <&dmac1 0x27>, <&dmac1 0x28>;
+		dma-names = "tx", "rx", "tx", "rx";
 		power-domains = <&cpg_clocks>;
 		status = "disabled";
 	};
-- 
2.1.4
