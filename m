Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <horms@penelope.isobedori.kobe.vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Kieran Bingham <kieran@ksquared.org.uk>,
	Kieran Bingham <kieran@bingham.xyz>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 02/30] arm64: dts: r8a7795: add FDP1 device nodes
Date: Thu,  8 Sep 2016 09:42:58 +0200
Message-Id: <bfb31459342701e0017f790ce675fcaf4df0d1c9.1473320411.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1473320411.git.horms+renesas@verge.net.au>
References: <cover.1473320411.git.horms+renesas@verge.net.au>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran@ksquared.org.uk>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran@bingham.xyz>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 8c85b50d306b..99953ca9a45e 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1294,5 +1294,32 @@
 			clocks = <&cpg CPG_MOD 613>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 		};
+
+		fdp1@fe940000 {
+			compatible = "renesas,fdp1";
+			reg = <0 0xfe940000 0 0x2400>;
+			interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 119>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+			renesas,fcp = <&fcpf0>;
+		};
+
+		fdp1@fe944000 {
+			compatible = "renesas,fdp1";
+			reg = <0 0xfe944000 0 0x2400>;
+			interrupts = <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 118>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+			renesas,fcp = <&fcpf1>;
+		};
+
+		fdp1@fe948000 {
+			compatible = "renesas,fdp1";
+			reg = <0 0xfe948000 0 0x2400>;
+			interrupts = <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 117>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+			renesas,fcp = <&fcpf2>;
+		};
 	};
 };
-- 
2.7.0.rc3.207.g0ac5344
