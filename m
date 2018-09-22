Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33797 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727668AbeIWCZD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 22 Sep 2018 22:25:03 -0400
Received: by mail-lf1-f68.google.com with SMTP id c29-v6so13749511lfj.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 22 Sep 2018 13:30:12 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2] arm64: dts: renesas: r8a779{7|8}0: add TPU support
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
Message-ID: <0d1a6380-e5f0-35a2-d421-f3c5bdd04a75@cogentembedded.com>
Date: Sat, 22 Sep 2018 23:30:09 +0300
MIME-Version: 1.0
In-Reply-To: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Describe TPU in the R8A779{7|8}0 device trees.

Based on the original (and large) patches by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'renesas-devel-20180921-v4.19-rc4' branch of
Simon Horman's 'renesas.git' repo.

Changes in version 2:
- fixed up the size cells in the "regs" properties;
- fixed up the "#pwm-cells" properties;
- fixed up the R8A77980's "compatible" property.

 arch/arm64/boot/dts/renesas/r8a77970.dtsi |    8 ++++++++
 arch/arm64/boot/dts/renesas/r8a77980.dtsi |    9 +++++++++
 2 files changed, 17 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -614,6 +614,14 @@
 			status = "disabled";
 		};
 
+		tpu: pwm@e6e80000 {
+			compatible = "renesas,tpu-r8a77970", "renesas,tpu";
+			reg = <0 0xe6e80000 0 0x148>;
+			clocks = <&cpg CPG_MOD 304>;
+			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
 
 		vin0: video@e6ef0000 {
 			compatible = "renesas,vin-r8a77970";
Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -666,6 +666,15 @@
 			status = "disabled";
 		};
 
+		tpu: pwm@e6e80000 {
+			compatible = "renesas,tpu-r8a77980", "renesas,tpu";
+			reg = <0 0xe6e80000 0 0x148>;
+			clocks = <&cpg CPG_MOD 304>;
+			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		vin0: video@e6ef0000 {
 			compatible = "renesas,vin-r8a77980";
 			reg = <0 0xe6ef0000 0 0x1000>;
