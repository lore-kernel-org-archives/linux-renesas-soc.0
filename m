Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:54462 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751262AbeDZTtR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 15:49:17 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Simon Horman <horms@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] arm64: dts: r8a77965: Add R-Car Gen3 thermal support
Date: Thu, 26 Apr 2018 21:49:06 +0200
Message-Id: <20180426194906.338-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Based on previous work by Ryo Kataoka <ryo.kataoka.wt@renesas.com>.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

---

Hi Simon,

The compatibility string 'renesas,r8a77965-thermal' is accepted but not 
yet picked up, see '[PATCH v2 0/2] thermal: rcar_gen3_thermal: add 
r8a77965 support'.

* Changes since v1
- Rebased to devel branch of Simons tree.
- Switch to R8A77965_PD_ALWAYS_ON instead of 32 in power-domains as the
  constant is present in v4.17-rc1. This makes this patch depend on
  '[PATCH] arm64: dts: renesas: r8a77965: use r8a77965-sysc binding
  definitions' which adds the r8a77965-sysc.h include to the dtsi file.
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 59 +++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 054ac6be43fac6f3..37c38b0f8f435645 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -136,6 +136,21 @@
 			/* placeholder */
 		};
 
+		tsc: thermal@e6198000 {
+			compatible = "renesas,r8a77965-thermal";
+			reg = <0 0xe6198000 0 0x100>,
+			      <0 0xe61a0000 0 0x100>,
+			      <0 0xe61a8000 0 0x100>;
+			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 522>;
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			resets = <&cpg 522>;
+			#thermal-sensor-cells = <1>;
+			status = "okay";
+		};
+
 		gpio0: gpio@e6050000 {
 			compatible = "renesas,gpio-r8a77965",
 				     "renesas,rcar-gen3-gpio";
@@ -1062,6 +1077,50 @@
 				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	thermal-zones {
+		sensor_thermal1: sensor-thermal1 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsc 0>;
+
+			trips {
+				sensor1_crit: sensor1-crit {
+					temperature = <120000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		sensor_thermal2: sensor-thermal2 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsc 1>;
+
+			trips {
+				sensor2_crit: sensor2-crit {
+					temperature = <120000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		sensor_thermal3: sensor-thermal3 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsc 2>;
+
+			trips {
+				sensor3_crit: sensor3-crit {
+					temperature = <120000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	/* External USB clocks - can be overridden by the board */
 	usb3s0_clk: usb3s0 {
 		compatible = "fixed-clock";
-- 
2.17.0
