Return-Path: <horms@vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 35/47] ARM: dts: r8a7794: Reference both DMA controllers in QSPI node
Date: Mon,  4 Apr 2016 10:23:07 +0900
Message-Id: <c6db0133bb01f1ca789df0197c99afe87ee945fe.1459732726.git.horms+renesas@verge.net.au>
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
 arch/arm/boot/dts/r8a7794.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index 982f089f218e..4761849cb1f7 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -691,8 +691,9 @@
 		reg = <0 0xe6b10000 0 0x2c>;
 		interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp9_clks R8A7794_CLK_QSPI_MOD>;
-		dmas = <&dmac0 0x17>, <&dmac0 0x18>;
-		dma-names = "tx", "rx";
+		dmas = <&dmac0 0x17>, <&dmac0 0x18>,
+		       <&dmac1 0x17>, <&dmac1 0x18>;
+		dma-names = "tx", "rx", "tx", "rx";
 		power-domains = <&cpg_clocks>;
 		num-cs = <1>;
 		#address-cells = <1>;
-- 
2.1.4
