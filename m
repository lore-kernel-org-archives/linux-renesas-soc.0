Return-Path: <horms@vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/2] ARM: dts: r8a7791: use fallback jpu compatibility string
Date: Wed, 24 Feb 2016 11:29:06 +0900
Message-Id: <1456280946-14859-3-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1456280946-14859-1-git-send-email-horms+renesas@verge.net.au>
References: <1456280946-14859-1-git-send-email-horms+renesas@verge.net.au>
List-ID: <linux-renesas-soc.vger.kernel.org>

Use recently added fallback compatibility string in r8a7791 device tree.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
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
