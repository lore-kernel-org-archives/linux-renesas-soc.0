Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43652 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730623AbeGYVzQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jul 2018 17:55:16 -0400
Received: by mail-pf1-f193.google.com with SMTP id j26-v6so2073139pfi.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jul 2018 13:41:55 -0700 (PDT)
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH/RFT] arm64: dts: renesas: r8a77965: Add OPPs table for cpu devices
Date: Thu, 26 Jul 2018 05:41:40 +0900
Message-Id: <1532551300-14943-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Dien Pham <dien.pham.ry@renesas.com>

This patch adds OPPs table for CA57{0,1} cpu devices

Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the devel branch of Simon Horman's renesas tree.

 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 44 +++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 0a64b72..28dcbb6 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -60,6 +60,46 @@
 		clock-frequency = <0>;
 	};
 
+	cluster0_opp: opp_table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp@500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <830000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <830000>;
+			clock-latency-ns = <300000>;
+		};
+		opp@1500000000 {
+			opp-hz = /bits/ 64 <1500000000>;
+			opp-microvolt = <830000>;
+			clock-latency-ns = <300000>;
+			opp-suspend;
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
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -71,6 +111,8 @@
 			power-domains = <&sysc R8A77965_PD_CA57_CPU0>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
+			clocks =<&cpg CPG_CORE R8A77965_CLK_Z>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		a57_1: cpu@1 {
@@ -80,6 +122,8 @@
 			power-domains = <&sysc R8A77965_PD_CA57_CPU1>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
+			clocks =<&cpg CPG_CORE R8A77965_CLK_Z>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		L2_CA57: cache-controller-0 {
-- 
1.9.1
