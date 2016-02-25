Return-Path: <horms@penelope.isobedori.kobe.vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 01/19] ARM: dts: r8a7790: use fallback pcie compatibility string
Date: Fri, 26 Feb 2016 08:52:50 +0900
Message-Id: <e670be8d31b22b2bc2def8097c0a2ddf309c0ab8.1456443769.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1456443769.git.horms+renesas@verge.net.au>
References: <cover.1456443769.git.horms+renesas@verge.net.au>
List-ID: <linux-renesas-soc.vger.kernel.org>

Use recently added fallback compatibility string in r8a7790 device tree.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7790.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index c9583fa6cae7..db019f2619c7 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1590,7 +1590,7 @@
 	};
 
 	pciec: pcie@fe000000 {
-		compatible = "renesas,pcie-r8a7790";
+		compatible = "renesas,pcie-r8a7790", "renesas,pcie-rcar-gen2";
 		reg = <0 0xfe000000 0 0x80000>;
 		#address-cells = <3>;
 		#size-cells = <2>;
-- 
2.7.0.rc3.207.g0ac5344
