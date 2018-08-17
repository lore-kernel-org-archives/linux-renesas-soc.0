Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:27234 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727058AbeHQQXK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Aug 2018 12:23:10 -0400
From: Ulrich Hecht <uli+renesas@fpond.eu>
To: linux-renesas-soc@vger.kernel.org
Cc: horms@verge.net.au, geert@linux-m68k.org,
        khiem.nguyen.xt@rvc.renesas.com, dien.pham.ry@renesas.com,
        takeshi.kihara.df@renesas.com, Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 4/5] arm64: dts: r8a7796: Add cpuidle support for CA53 cores
Date: Fri, 17 Aug 2018 15:19:27 +0200
Message-Id: <1534511968-19634-5-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1534511968-19634-1-git-send-email-uli+renesas@fpond.eu>
References: <1534511968-19634-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Dien Pham <dien.pham.ry@renesas.com>

Enable cpuidle (core shutdown) support for R-Car M3-W CA53 cores.

Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 3d30b05..0c0877e 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -160,6 +160,7 @@
 			power-domains = <&sysc R8A7796_PD_CA53_CPU0>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_1>;
 			clocks =<&cpg CPG_CORE R8A7796_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 		};
@@ -171,6 +172,7 @@
 			power-domains = <&sysc R8A7796_PD_CA53_CPU1>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_1>;
 			clocks =<&cpg CPG_CORE R8A7796_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 		};
@@ -182,6 +184,7 @@
 			power-domains = <&sysc R8A7796_PD_CA53_CPU2>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_1>;
 			clocks =<&cpg CPG_CORE R8A7796_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 		};
@@ -193,6 +196,7 @@
 			power-domains = <&sysc R8A7796_PD_CA53_CPU3>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_1>;
 			clocks =<&cpg CPG_CORE R8A7796_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 		};
@@ -223,6 +227,16 @@
 				min-residency-us = <4000>;
 				status = "okay";
 			};
+
+			CPU_SLEEP_1: cpu-sleep-1 {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
+				entry-latency-us = <700>;
+				exit-latency-us = <700>;
+				min-residency-us = <5000>;
+				status = "okay";
+			};
 		};
 	};
 
-- 
2.7.4
