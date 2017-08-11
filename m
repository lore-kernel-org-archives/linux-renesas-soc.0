Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52999 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752850AbdHKPpZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Aug 2017 11:45:25 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Dien Pham <dien.pham.ry@rvc.renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] arm64: dts: r8a7796: Add OPPs table for cpu devices
Date: Fri, 11 Aug 2017 17:45:19 +0200
Message-Id: <1502466319-20578-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Dien Pham <dien.pham.ry@rvc.renesas.com>

Current, OPP tables are defined temporary,
they are being evaluated and adjust in future.

Signed-off-by: Dien Pham <dien.pham.ry@rvc.renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[simon: consolidated several patches into one]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 341 +++++++++++++++++++++++++++++++
 1 file changed, 341 insertions(+)

This patch is based on renesas-arm64-dt-for-v4.14

I am not aware of any build-time dependencies of this patch.

This patch has run-time dependencies on:
* [PATCH] cpufreq: dt: Add r8a7796 support to to use generic cpufreq driver
* [PATCH 0/2] r8a7796: Add Z and Z2 clock support

I have provided an integration series with this patch and the above
dependencies.  The result is working CPUFreq for the r8a7795 (R-Car M3-W).

https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/r8a7796-cpufreq

A description of steps taken to lightly exercise the same feature for the
r88a7795 the above can be found at the link below. The results are the same
for the r8a7796 with the exception that it has two active CPU cores rather
than four.

http://elinux.org/Tests:R-CAR-GEN3-CPUFreq

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index ef1120f4e561..f8582846ceb3 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -46,6 +46,12 @@
 			power-domains = <&sysc R8A7796_PD_CA57_CPU0>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
+			clocks =<&cpg CPG_CORE R8A7796_CLK_Z>;
+			operating-points-v2 = <&cluster0_opp_tb0>,
+				<&cluster0_opp_tb1>, <&cluster0_opp_tb2>,
+				<&cluster0_opp_tb3>, <&cluster0_opp_tb4>,
+				<&cluster0_opp_tb5>, <&cluster0_opp_tb6>,
+				<&cluster0_opp_tb7>;
 		};
 
 		a57_1: cpu@1 {
@@ -55,6 +61,11 @@
 			power-domains = <&sysc R8A7796_PD_CA57_CPU1>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
+			operating-points-v2 = <&cluster0_opp_tb0>,
+				<&cluster0_opp_tb1>, <&cluster0_opp_tb2>,
+				<&cluster0_opp_tb3>, <&cluster0_opp_tb4>,
+				<&cluster0_opp_tb5>, <&cluster0_opp_tb6>,
+				<&cluster0_opp_tb7>;
 		};
 
 		a53_0: cpu@100 {
@@ -64,6 +75,8 @@
 			power-domains = <&sysc R8A7796_PD_CA53_CPU0>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			clocks =<&cpg CPG_CORE R8A7796_CLK_Z2>;
+			operating-points-v2 = <&cluster1_opp_tb0>;
 		};
 
 		a53_1: cpu@101 {
@@ -73,6 +86,7 @@
 			power-domains = <&sysc R8A7796_PD_CA53_CPU1>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			operating-points-v2 = <&cluster1_opp_tb0>;
 		};
 
 		a53_2: cpu@102 {
@@ -82,6 +96,7 @@
 			power-domains = <&sysc R8A7796_PD_CA53_CPU2>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			operating-points-v2 = <&cluster1_opp_tb0>;
 		};
 
 		a53_3: cpu@103 {
@@ -91,6 +106,7 @@
 			power-domains = <&sysc R8A7796_PD_CA53_CPU3>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			operating-points-v2 = <&cluster1_opp_tb0>;
 		};
 
 		L2_CA57: cache-controller-0 {
@@ -108,6 +124,331 @@
 		};
 	};
 
+	cluster0_opp_tb0: opp_table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp@500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1500000000 {
+			opp-hz = /bits/ 64 <1500000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1600000000 {
+			opp-hz = /bits/ 64 <1600000000>;
+			opp-microvolt = <900000>;
+			clock-latency-ns = <300000>;
+			turbo-mode;
+		};
+		opp@1700000000 {
+			opp-hz = /bits/ 64 <1700000000>;
+			opp-microvolt = <900000>;
+			clock-latency-ns = <300000>;
+			turbo-mode;
+		};
+		opp@1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <960000>;
+			clock-latency-ns = <300000>;
+			turbo-mode;
+		};
+	};
+
+	cluster0_opp_tb1: opp_table1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp@500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1500000000 {
+			opp-hz = /bits/ 64 <1500000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1600000000 {
+			opp-hz = /bits/ 64 <1600000000>;
+			opp-microvolt = <900000>;
+			clock-latency-ns = <300000>;
+			turbo-mode;
+		};
+		opp@1700000000 {
+			opp-hz = /bits/ 64 <1700000000>;
+			opp-microvolt = <900000>;
+			clock-latency-ns = <300000>;
+			turbo-mode;
+		};
+		opp@1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <960000>;
+			clock-latency-ns = <300000>;
+			turbo-mode;
+		};
+	};
+
+	cluster0_opp_tb2: opp_table2 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp@500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1500000000 {
+			opp-hz = /bits/ 64 <1500000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1600000000 {
+			opp-hz = /bits/ 64 <1600000000>;
+			opp-microvolt = <900000>;
+			clock-latency-ns = <300000>;
+			turbo-mode;
+		};
+		opp@1700000000 {
+			opp-hz = /bits/ 64 <1700000000>;
+			opp-microvolt = <900000>;
+			clock-latency-ns = <300000>;
+			turbo-mode;
+		};
+		opp@1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <960000>;
+			clock-latency-ns = <300000>;
+			turbo-mode;
+		};
+	};
+
+	cluster0_opp_tb3: opp_table3 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp@500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <790000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <790000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1500000000 {
+			opp-hz = /bits/ 64 <1500000000>;
+			opp-microvolt = <790000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1600000000 {
+			opp-hz = /bits/ 64 <1600000000>;
+			opp-microvolt = <870000>;
+			clock-latency-ns = <300000>;
+			turbo-mode;
+		};
+		opp@1700000000 {
+			opp-hz = /bits/ 64 <1700000000>;
+			opp-microvolt = <870000>;
+			clock-latency-ns = <300000>;
+			turbo-mode;
+		};
+		opp@1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <910000>;
+			clock-latency-ns = <300000>;
+			turbo-mode;
+		};
+	};
+
+	cluster0_opp_tb4: opp_table4 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp@500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <790000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <790000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1500000000 {
+			opp-hz = /bits/ 64 <1500000000>;
+			opp-microvolt = <790000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1600000000 {
+			opp-hz = /bits/ 64 <1600000000>;
+			opp-microvolt = <870000>;
+			clock-latency-ns = <300000>;
+			turbo-mode;
+		};
+		opp@1700000000 {
+			opp-hz = /bits/ 64 <1700000000>;
+			opp-microvolt = <870000>;
+			clock-latency-ns = <300000>;
+			turbo-mode;
+		};
+		opp@1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <890000>;
+			clock-latency-ns = <300000>;
+			turbo-mode;
+		};
+	};
+
+	cluster0_opp_tb5: opp_table5 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp@500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <770000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <770000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1500000000 {
+			opp-hz = /bits/ 64 <1500000000>;
+			opp-microvolt = <770000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1600000000 {
+			opp-hz = /bits/ 64 <1600000000>;
+			opp-microvolt = <850000>;
+			clock-latency-ns = <300000>;
+			turbo-mode;
+		};
+		opp@1700000000 {
+			opp-hz = /bits/ 64 <1700000000>;
+			opp-microvolt = <850000>;
+			clock-latency-ns = <300000>;
+			turbo-mode;
+		};
+		opp@1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <870000>;
+			clock-latency-ns = <300000>;
+			turbo-mode;
+		};
+	};
+
+	cluster0_opp_tb6: opp_table6 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp@500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <750000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <750000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1500000000 {
+			opp-hz = /bits/ 64 <1500000000>;
+			opp-microvolt = <750000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1600000000 {
+			opp-hz = /bits/ 64 <1600000000>;
+			opp-microvolt = <830000>;
+			clock-latency-ns = <300000>;
+			turbo-mode;
+		};
+		opp@1700000000 {
+			opp-hz = /bits/ 64 <1700000000>;
+			opp-microvolt = <830000>;
+			clock-latency-ns = <300000>;
+			turbo-mode;
+		};
+		opp@1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <860000>;
+			clock-latency-ns = <300000>;
+			turbo-mode;
+		};
+	};
+
+	cluster0_opp_tb7: opp_table7 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp@500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <760000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <760000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1500000000 {
+			opp-hz = /bits/ 64 <1500000000>;
+			opp-microvolt = <760000>;
+			clock-latency-ns = <300000>;
+			opp-suspend;
+		};
+		opp@1600000000 {
+			opp-hz = /bits/ 64 <1600000000>;
+			opp-microvolt = <830000>;
+			clock-latency-ns = <300000>;
+			turbo-mode;
+		};
+		opp@1700000000 {
+			opp-hz = /bits/ 64 <1700000000>;
+			opp-microvolt = <830000>;
+			clock-latency-ns = <300000>;
+			turbo-mode;
+		};
+		opp@1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <860000>;
+			clock-latency-ns = <300000>;
+			turbo-mode;
+		};
+
+	};
+
+	cluster1_opp_tb0: opp_table10 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp@1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <820000>;
+			clock-latency-ns = <300000>;
+		};
+	};
+
 	extal_clk: extal {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-- 
2.1.4
