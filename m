Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:54135 "EHLO pokefinder.org"
        rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
        id S1752069AbdATL1H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 06:27:07 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hien Dang <hien.dang.eb@renesas.com>,
        Thao Nguyen <thao.nguyen.yb@rvc.renesas.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Eduardo Valentin <edubezval@gmail.com>
Subject: [PATCH v7 2/2] arm64: dts: r8a7796: Add R-Car Gen3 thermal support
Date: Fri, 20 Jan 2017 12:26:43 +0100
Message-Id: <20170120112643.2282-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20170120112643.2282-1-wsa+renesas@sang-engineering.com>
References: <20170120112643.2282-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Hien Dang <hien.dang.eb@renesas.com>
Signed-off-by: Thao Nguyen <thao.nguyen.yb@rvc.renesas.com>
Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Acked-by: Eduardo Valentin <edubezval@gmail.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 58 ++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index eb446d96662137..67aa0e4fde77b4 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -680,5 +680,63 @@
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
+
+		tsc: thermal@e6198000 {
+			compatible = "renesas,r8a7796-thermal";
+			reg = <0 0xe6198000 0 0x68>,
+			      <0 0xe61a0000 0 0x5c>,
+			      <0 0xe61a8000 0 0x5c>;
+			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 522>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			#thermal-sensor-cells = <1>;
+			status = "okay";
+		};
+
+		thermal-zones {
+			sensor_thermal1: sensor-thermal1 {
+				polling-delay-passive = <250>;
+				polling-delay = <1000>;
+				thermal-sensors = <&tsc 0>;
+
+				trips {
+					sensor1_crit: sensor1-crit {
+						temperature = <120000>;
+						hysteresis = <2000>;
+						type = "critical";
+					};
+				};
+			};
+
+			sensor_thermal2: sensor-thermal2 {
+				polling-delay-passive = <250>;
+				polling-delay = <1000>;
+				thermal-sensors = <&tsc 1>;
+
+				trips {
+					sensor2_crit: sensor2-crit {
+						temperature = <120000>;
+						hysteresis = <2000>;
+						type = "critical";
+					};
+				};
+			};
+
+			sensor_thermal3: sensor-thermal3 {
+				polling-delay-passive = <250>;
+				polling-delay = <1000>;
+				thermal-sensors = <&tsc 2>;
+
+				trips {
+					sensor3_crit: sensor3-crit {
+						temperature = <120000>;
+						hysteresis = <2000>;
+						type = "critical";
+					};
+				};
+			};
+		};
 	};
 };
-- 
2.11.0
