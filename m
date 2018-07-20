Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41643 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733198AbeGTUL1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 16:11:27 -0400
Received: by mail-lf1-f67.google.com with SMTP id v22-v6so2503835lfe.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Jul 2018 12:21:48 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] arm64: dts: renesas: r8a77980: add RWDT support
To: Simon Horman <horms@verge.net.au>,
        linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
References: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
Message-ID: <175a491f-a827-4a92-1884-2f1490d38a52@cogentembedded.com>
Date: Fri, 20 Jul 2018 22:21:45 +0300
MIME-Version: 1.0
In-Reply-To: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Describe RWDT in the R8A77980 SoC device tree.

Enable RWDT on the Condor and V3H Starter Kit boards.

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'renesas-devel-20180720-v4.18-rc5' of Simon Horman's
'renesas.git' repo.  It depends on Geert Uytterhoeven's clock driver patches
(adding the RWDT clock) in order to work...

 arch/arm64/boot/dts/renesas/r8a77980-condor.dts |    5 +++++
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts  |    5 +++++
 arch/arm64/boot/dts/renesas/r8a77980.dtsi       |   10 ++++++++++
 3 files changed, 20 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
@@ -262,6 +262,11 @@
 	};
 };
 
+&rwdt {
+	timeout-sec = <60>;
+	status = "okay";
+};
+
 &scif0 {
 	pinctrl-0 = <&scif0_pins>, <&scif_clk_pins>;
 	pinctrl-names = "default";
Index: renesas/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
@@ -191,6 +191,11 @@
 	};
 };
 
+&rwdt {
+	timeout-sec = <60>;
+	status = "okay";
+};
+
 &scif0 {
 	pinctrl-0 = <&scif0_pins>, <&scif_clk_pins>;
 	pinctrl-names = "default";
Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -118,6 +118,16 @@
 		#size-cells = <2>;
 		ranges;
 
+		rwdt: watchdog@e6020000 {
+			compatible = "renesas,r8a77980-wdt",
+				     "renesas,rcar-gen3-wdt";
+			reg = <0 0xe6020000 0 0x0c>;
+			clocks = <&cpg CPG_MOD 402>;
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			resets = <&cpg 402>;
+			status = "disabled";
+		};
+
 		gpio0: gpio@e6050000 {
 			compatible = "renesas,gpio-r8a77980",
 				     "renesas,rcar-gen3-gpio";
