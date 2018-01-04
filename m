Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:38420 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753566AbeADQEb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Jan 2018 11:04:31 -0500
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/2] arm64: dts: r8a7796: add thermal cooling management
Date: Thu,  4 Jan 2018 17:03:20 +0100
Message-Id: <20180104160320.11514-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180104160320.11514-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180104160320.11514-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add nodes and properties for thermal cooling management support.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Acked-by: Eduardo Valentin <edubezval@gmail.com>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 38 ++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index e06bde6e28532b3a..ef10fb548681d36a 100644
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
2.15.1
