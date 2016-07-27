Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:33768 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758417AbcG0VAD (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 27 Jul 2016 17:00:03 -0400
Received: by mail-lf0-f47.google.com with SMTP id b199so35981212lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Jul 2016 14:00:02 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/6] ARM: dts: r8a7794: add MSTP5 clocks
Date: Wed, 27 Jul 2016 23:59:59 +0300
Message-ID: <3560619.yXVhzgu5Aq@wasted.cogentembedded.com>
In-Reply-To: <3910788.ckTpUWEs6B@wasted.cogentembedded.com>
References: <3910788.ckTpUWEs6B@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add some MSTP5 clocks to the R8A7794 device tree.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 4:
- removed non-existant thermal sensor clock;
- refreshed the patch.

Changes in version 3:
- refreshed the patch.

Changes in version 2:
- added "the" article to the change log.

 arch/arm/boot/dts/r8a7794.dtsi            |    9 +++++++++
 include/dt-bindings/clock/r8a7794-clock.h |    1 +
 2 files changed, 10 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7794.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7794.dtsi
+++ renesas/arch/arm/boot/dts/r8a7794.dtsi
@@ -1204,6 +1204,15 @@
 			clock-indices = <R8A7794_CLK_IRQC>;
 			clock-output-names = "irqc";
 		};
+		mstp5_clks: mstp5_clks@e6150144 {
+			compatible = "renesas,r8a7794-mstp-clocks", "renesas,cpg-mstp-clocks";
+			reg = <0 0xe6150144 0 4>, <0 0xe615003c 0 4>;
+			clocks = <&hp_clk>, <&extal_clk>, <&p_clk>;
+			#clock-cells = <1>;
+			clock-indices = <R8A7794_CLK_AUDIO_DMAC0
+					 R8A7794_CLK_PWM>;
+			clock-output-names = "audmac0", "pwm";
+		};
 		mstp7_clks: mstp7_clks@e615014c {
 			compatible = "renesas,r8a7794-mstp-clocks", "renesas,cpg-mstp-clocks";
 			reg = <0 0xe615014c 0 4>, <0 0xe61501c4 0 4>;
Index: renesas/include/dt-bindings/clock/r8a7794-clock.h
===================================================================
--- renesas.orig/include/dt-bindings/clock/r8a7794-clock.h
+++ renesas/include/dt-bindings/clock/r8a7794-clock.h
@@ -67,6 +67,7 @@
 #define R8A7794_CLK_IRQC		7
 
 /* MSTP5 */
+#define R8A7794_CLK_AUDIO_DMAC0		2
 #define R8A7794_CLK_PWM			23
 
 /* MSTP7 */
