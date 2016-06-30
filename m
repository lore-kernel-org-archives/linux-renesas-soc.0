Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Sender: Kieran Bingham <kieran@ksquared.org.uk>
From: Kieran Bingham <kieran@bingham.xyz>
To: horms@verge.net.au,
	linux-renesas-soc@vger.kernel.org
Cc: magnus.damm@gmail.com,
	robh+dt@kernel.org,
	mark.rutland@arm.com,
	catalin.marinas@arm.com,
	will.deacon@arm.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kieran@bingham.xyz
Subject: [PATCH 1/2] arm64: dts: r8a7795: add FCPF device nodes
Date: Thu, 30 Jun 2016 14:32:42 +0100
Message-Id: <1467293563-940-2-git-send-email-kieran@bingham.xyz>
In-Reply-To: <1467293563-940-1-git-send-email-kieran@bingham.xyz>
References: <1467293563-940-1-git-send-email-kieran@bingham.xyz>
List-ID: <linux-renesas-soc.vger.kernel.org>

Provide nodes for the FCP devices dedicated to the FDP device channels.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Kieran Bingham <kieran@bingham.xyz>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index fff92acc5d2e..a451bd217f05 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1422,5 +1422,26 @@
 				};
 			};
 		};
+
+		fcpf0: fcp@fe950000 {
+			compatible = "renesas,r8a7795-fcpf", "renesas,fcpf";
+			reg = <0 0xfe950000 0 0x200>;
+			clocks = <&cpg CPG_MOD 615>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+		};
+
+		fcpf1: fcp@fe951000 {
+			compatible = "renesas,r8a7795-fcpf", "renesas,fcpf";
+			reg = <0 0xfe951000 0 0x200>;
+			clocks = <&cpg CPG_MOD 614>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+		};
+
+		fcpf2: fcp@fe952000 {
+			compatible = "renesas,r8a7795-fcpf", "renesas,fcpf";
+			reg = <0 0xfe952000 0 0x200>;
+			clocks = <&cpg CPG_MOD 613>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+		};
 	};
 };
-- 
2.7.4
