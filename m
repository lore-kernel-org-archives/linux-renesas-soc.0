Return-Path: <devicetree-owner@vger.kernel.org>
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
To: horms@verge.net.au, magnus.damm@gmail.com, geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCHv2 05/31] ARM: dts: r8a7790: Reference both DMA controllers in MSIOF nodes
Date: Tue, 15 Mar 2016 13:41:42 +0100
Message-Id: <1458045728-4758-6-git-send-email-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <1458045728-4758-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
References: <1458045728-4758-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

R-Car Gen2 have two DMA controllers, which are equivalent. Add
references to both dmac0 and dmac1 so the driver can fallback to the
later if the first one is unavailable.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7790.dtsi | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index fe1e995..102973c 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1508,8 +1508,9 @@
 		reg = <0 0xe6e20000 0 0x0064>;
 		interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks R8A7790_CLK_MSIOF0>;
-		dmas = <&dmac0 0x51>, <&dmac0 0x52>;
-		dma-names = "tx", "rx";
+		dmas = <&dmac0 0x51>, <&dmac0 0x52>,
+		       <&dmac1 0x51>, <&dmac1 0x52>;
+		dma-names = "tx", "rx", "tx", "rx";
 		power-domains = <&cpg_clocks>;
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -1521,8 +1522,9 @@
 		reg = <0 0xe6e10000 0 0x0064>;
 		interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7790_CLK_MSIOF1>;
-		dmas = <&dmac0 0x55>, <&dmac0 0x56>;
-		dma-names = "tx", "rx";
+		dmas = <&dmac0 0x55>, <&dmac0 0x56>,
+		       <&dmac1 0x55>, <&dmac1 0x56>;
+		dma-names = "tx", "rx", "tx", "rx";
 		power-domains = <&cpg_clocks>;
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -1534,8 +1536,9 @@
 		reg = <0 0xe6e00000 0 0x0064>;
 		interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7790_CLK_MSIOF2>;
-		dmas = <&dmac0 0x41>, <&dmac0 0x42>;
-		dma-names = "tx", "rx";
+		dmas = <&dmac0 0x41>, <&dmac0 0x42>,
+		       <&dmac1 0x41>, <&dmac1 0x42>;
+		dma-names = "tx", "rx", "tx", "rx";
 		power-domains = <&cpg_clocks>;
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -1547,8 +1550,9 @@
 		reg = <0 0xe6c90000 0 0x0064>;
 		interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp2_clks R8A7790_CLK_MSIOF3>;
-		dmas = <&dmac0 0x45>, <&dmac0 0x46>;
-		dma-names = "tx", "rx";
+		dmas = <&dmac0 0x45>, <&dmac0 0x46>,
+		       <&dmac1 0x45>, <&dmac1 0x46>;
+		dma-names = "tx", "rx", "tx", "rx";
 		power-domains = <&cpg_clocks>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.7.2

