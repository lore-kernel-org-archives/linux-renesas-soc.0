Return-Path: <devicetree-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 06/13] ARM: dts: r8a7779: Add clocks for CA9 CPU cores
Date: Thu, 12 Oct 2017 11:35:09 +0200
Message-Id: <1507800916-11509-7-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1507800916-11509-1-git-send-email-geert+renesas@glider.be>
References: <1507800916-11509-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Improve hardware description by adding clocks properties to the device
nodes corresponding to the CA9 CPU cores.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7779.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
index 8ee0b2ca5d39a265..2cc9be4c13cda333 100644
--- a/arch/arm/boot/dts/r8a7779.dtsi
+++ b/arch/arm/boot/dts/r8a7779.dtsi
@@ -29,12 +29,14 @@
 			compatible = "arm,cortex-a9";
 			reg = <0>;
 			clock-frequency = <1000000000>;
+			clocks = <&cpg_clocks R8A7779_CLK_Z>;
 		};
 		cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <1>;
 			clock-frequency = <1000000000>;
+			clocks = <&cpg_clocks R8A7779_CLK_Z>;
 			power-domains = <&sysc R8A7779_PD_ARM1>;
 		};
 		cpu@2 {
@@ -42,6 +44,7 @@
 			compatible = "arm,cortex-a9";
 			reg = <2>;
 			clock-frequency = <1000000000>;
+			clocks = <&cpg_clocks R8A7779_CLK_Z>;
 			power-domains = <&sysc R8A7779_PD_ARM2>;
 		};
 		cpu@3 {
@@ -49,6 +52,7 @@
 			compatible = "arm,cortex-a9";
 			reg = <3>;
 			clock-frequency = <1000000000>;
+			clocks = <&cpg_clocks R8A7779_CLK_Z>;
 			power-domains = <&sysc R8A7779_PD_ARM3>;
 		};
 	};
-- 
2.7.4

