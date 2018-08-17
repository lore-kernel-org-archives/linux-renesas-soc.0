Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:23936 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbeHQQXJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Aug 2018 12:23:09 -0400
From: Ulrich Hecht <uli+renesas@fpond.eu>
To: linux-renesas-soc@vger.kernel.org
Cc: horms@verge.net.au, geert@linux-m68k.org,
        khiem.nguyen.xt@rvc.renesas.com, dien.pham.ry@renesas.com,
        takeshi.kihara.df@renesas.com, Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 1/5] arm64: dts: r8a7795: Add cpuidle support for CA57 cores
Date: Fri, 17 Aug 2018 15:19:24 +0200
Message-Id: <1534511968-19634-2-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1534511968-19634-1-git-send-email-uli+renesas@fpond.eu>
References: <1534511968-19634-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>

Enable cpuidle (core shutdown) support for R-Car H3 CA57 cores.

Parameters were found after evaluation by gaku.inami.xw@bp.renesas.com; they
help to keep the performance and reduce the power consumption.

Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
[dien.pham.ry: Apply new cpuidle parameters]
Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index efc2477..64ab88a 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -123,6 +123,7 @@
 			power-domains = <&sysc R8A7795_PD_CA57_CPU0>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks =<&cpg CPG_CORE R8A7795_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
@@ -135,6 +136,7 @@
 			power-domains = <&sysc R8A7795_PD_CA57_CPU1>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks =<&cpg CPG_CORE R8A7795_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
@@ -147,6 +149,7 @@
 			power-domains = <&sysc R8A7795_PD_CA57_CPU2>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks =<&cpg CPG_CORE R8A7795_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
@@ -159,6 +162,7 @@
 			power-domains = <&sysc R8A7795_PD_CA57_CPU3>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks =<&cpg CPG_CORE R8A7795_CLK_Z>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
@@ -221,6 +225,20 @@
 			cache-unified;
 			cache-level = <2>;
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			CPU_SLEEP_0: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
+				entry-latency-us = <400>;
+				exit-latency-us = <500>;
+				min-residency-us = <4000>;
+				status = "okay";
+			};
+		};
 	};
 
 	extal_clk: extal {
-- 
2.7.4
