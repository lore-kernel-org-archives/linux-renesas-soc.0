Return-Path: <horms@vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/2] arm64: dts: r8a7795: use fallback etheravb compatibility string
Date: Tue, 23 Feb 2016 10:17:46 +0900
Message-Id: <1456190266-3781-3-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1456190266-3781-1-git-send-email-horms+renesas@verge.net.au>
References: <1456190266-3781-1-git-send-email-horms+renesas@verge.net.au>
List-ID: <linux-renesas-soc.vger.kernel.org>

Use recently added fallback compatibility string in r8a7795 device tree.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index c2bffd160c18..39d6dc104206 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -473,7 +473,8 @@
 		};
 
 		avb: ethernet@e6800000 {
-			compatible = "renesas,etheravb-r8a7795";
+			compatible = "renesas,etheravb-r8a7795",
+				     "renesas,etheravb-rcar-gen3",
 			reg = <0 0xe6800000 0 0x800>, <0 0xe6a00000 0 0x10000>;
 			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.1.4
