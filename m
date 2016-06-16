Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:34140 "EHLO
	baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752360AbcFPK1t (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 16 Jun 2016 06:27:49 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Keita Kobayashi <keita.kobayashi.ym@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <damm+renesas@opensource.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 13/13] ARM: dts: r8a7793: Add APMU node and second CPU core
Date: Thu, 16 Jun 2016 12:27:42 +0200
Message-Id: <1466072862-28030-14-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1466072862-28030-1-git-send-email-geert+renesas@glider.be>
References: <1466072862-28030-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add DT nodes for the Advanced Power Management Unit (APMU) and the
second CPU core.  Use the enable-method to point out that the APMU
should be used for SMP support.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - Improve patch description,
  - Use "renesas,<soctype>-apmu" instead of "renesas,apmu-<soctype>",

v3:
  - New.
---
 arch/arm/boot/dts/r8a7793.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index 9b55c1c6ee31a49d..fce310c54efa88eb 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -35,6 +35,7 @@
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "renesas,apmu";
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -56,6 +57,13 @@
 			next-level-cache = <&L2_CA15>;
 		};
 
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a15";
+			reg = <1>;
+			clock-frequency = <1500000000>;
+		};
+
 		L2_CA15: cache-controller@0 {
 			compatible = "cache";
 			reg = <0>;
@@ -65,6 +73,12 @@
 		};
 	};
 
+	apmu@e6152000 {
+		compatible = "renesas,r8a7793-apmu", "renesas,apmu";
+		reg = <0 0xe6152000 0 0x188>;
+		cpus = <&cpu0 &cpu1>;
+	};
+
 	thermal-zones {
 		cpu_thermal: cpu-thermal {
 			polling-delay-passive	= <0>;
-- 
1.9.1
