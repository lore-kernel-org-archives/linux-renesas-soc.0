Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:39020 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755186AbcK1VKI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Nov 2016 16:10:08 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-pm@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hien Dang <hien.dang.eb@renesas.com>,
        Thao Nguyen <thao.nguyen.yb@rvc.renesas.com>
Subject: [PATCH v3 3/4] arm64: dts: r8a7795: Add R-Car Gen3 thermal support
Date: Mon, 28 Nov 2016 22:09:23 +0100
Message-Id: <20161128210924.2921-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20161128210924.2921-1-wsa+renesas@sang-engineering.com>
References: <20161128210924.2921-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Hien Dang <hien.dang.eb@renesas.com>
Signed-off-by: Thao Nguyen <thao.nguyen.yb@rvc.renesas.com>
Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes since last version:

* DTSI updates refactored to meet the above changes

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 58 ++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 8c15040f2540d6..0699e04fbdf264 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1541,5 +1541,63 @@
 				};
 			};
 		};
+
+		tsc: thermal@e6198000 {
+			compatible = "renesas,r8a7795-thermal";
+			reg = <0 0xe6198000 0 0x68>,
+			      <0 0xe61a0000 0 0x5c>,
+			      <0 0xe61a8000 0 0x5c>;
+			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 522>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
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
+						temperature = <90000>;
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
+						temperature = <90000>;
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
+						temperature = <90000>;
+						hysteresis = <2000>;
+						type = "critical";
+					};
+				};
+			};
+		};
 	};
 };
-- 
2.10.2
