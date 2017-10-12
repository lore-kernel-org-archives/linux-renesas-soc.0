Return-Path: <devicetree-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 07/13] ARM: dts: r8a7790: Add missing clocks for secondary CA15 CPU cores
Date: Thu, 12 Oct 2017 11:35:10 +0200
Message-Id: <1507800916-11509-8-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1507800916-11509-1-git-send-email-geert+renesas@glider.be>
References: <1507800916-11509-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Currently only the primary CPU in the CA15 cluster has a clocks
property, while the secondary CPU cores are driven by the same clock.
Add the missing clocks properties to fix this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7790.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index ffa57bfe4873415c..7f86cb9f634fbed7 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -71,6 +71,7 @@
 			compatible = "arm,cortex-a15";
 			reg = <1>;
 			clock-frequency = <1300000000>;
+			clocks = <&cpg CPG_CORE R8A7790_CLK_Z>;
 			power-domains = <&sysc R8A7790_PD_CA15_CPU1>;
 			next-level-cache = <&L2_CA15>;
 		};
@@ -80,6 +81,7 @@
 			compatible = "arm,cortex-a15";
 			reg = <2>;
 			clock-frequency = <1300000000>;
+			clocks = <&cpg CPG_CORE R8A7790_CLK_Z>;
 			power-domains = <&sysc R8A7790_PD_CA15_CPU2>;
 			next-level-cache = <&L2_CA15>;
 		};
@@ -89,6 +91,7 @@
 			compatible = "arm,cortex-a15";
 			reg = <3>;
 			clock-frequency = <1300000000>;
+			clocks = <&cpg CPG_CORE R8A7790_CLK_Z>;
 			power-domains = <&sysc R8A7790_PD_CA15_CPU3>;
 			next-level-cache = <&L2_CA15>;
 		};
-- 
2.7.4

