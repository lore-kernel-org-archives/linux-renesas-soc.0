Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36128 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753575AbeCPOvv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 10:51:51 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 04/69] arm64: dts: renesas: r8a7796: add thermal cooling management
Date: Fri, 16 Mar 2018 15:50:34 +0100
Message-Id: <479e5d70a9cee635d0feda260eed3719fb565ca8.1521206129.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1521206129.git.horms+renesas@verge.net.au>
References: <cover.1521206129.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Add nodes and properties for thermal cooling management support.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Acked-by: Eduardo Valentin <edubezval@gmail.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 38 ++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index e06bde6e2853..ef10fb548681 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -73,6 +73,7 @@
 			enable-method = "psci";
 			clocks =<&cpg CPG_CORE R8A7796_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
+			#cooling-cells = <2>;
 		};
 
 		a57_1: cpu@1 {
@@ -84,6 +85,7 @@
 			enable-method = "psci";
 			clocks =<&cpg CPG_CORE R8A7796_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
+			#cooling-cells = <2>;
 		};
 
 		a53_0: cpu@100 {
@@ -2060,12 +2062,24 @@
 			thermal-sensors = <&tsc 0>;
 
 			trips {
+				sensor1_passive: sensor1-passive {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
 				sensor1_crit: sensor1-crit {
 					temperature = <120000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&sensor1_passive>;
+					cooling-device = <&a57_0 5 5>;
+				};
+			};
 		};
 
 		sensor_thermal2: sensor-thermal2 {
@@ -2074,12 +2088,24 @@
 			thermal-sensors = <&tsc 1>;
 
 			trips {
+				sensor2_passive: sensor2-passive {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
 				sensor2_crit: sensor2-crit {
 					temperature = <120000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&sensor2_passive>;
+					cooling-device = <&a57_0 5 5>;
+				};
+			};
 		};
 
 		sensor_thermal3: sensor-thermal3 {
@@ -2088,12 +2114,24 @@
 			thermal-sensors = <&tsc 2>;
 
 			trips {
+				sensor3_passive: sensor3-passive {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
 				sensor3_crit: sensor3-crit {
 					temperature = <120000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&sensor3_passive>;
+					cooling-device = <&a57_0 5 5>;
+				};
+			};
 		};
 	};
 
-- 
2.11.0
