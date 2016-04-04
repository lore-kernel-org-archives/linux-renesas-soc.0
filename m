Return-Path: <horms@vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 02/47] ARM: dts: r8a7791: use fallback jpu compatibility string
Date: Mon,  4 Apr 2016 10:22:34 +0900
Message-Id: <9419933ba64bbba7887084f9727d31091042e5e4.1459732726.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1459732726.git.horms+renesas@verge.net.au>
References: <cover.1459732726.git.horms+renesas@verge.net.au>
List-ID: <linux-renesas-soc.vger.kernel.org>

Use recently added fallback compatibility string in r8a7791 device tree.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7791.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 6439f0569fe2..9bfd1dc054b3 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -1035,7 +1035,7 @@
 	};
 
 	jpu: jpeg-codec@fe980000 {
-		compatible = "renesas,jpu-r8a7791";
+		compatible = "renesas,jpu-r8a7791", "renesas,rcar-gen2-jpu";
 		reg = <0 0xfe980000 0 0x10300>;
 		interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp1_clks R8A7791_CLK_JPU>;
-- 
2.1.4
