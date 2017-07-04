Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:52974 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752413AbdGDRDC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jul 2017 13:03:02 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] ARM: dts: r8a7794: Add SMP support
Date: Tue,  4 Jul 2017 19:02:13 +0200
Message-Id: <1499187733-1430-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1499187733-1430-1-git-send-email-geert+renesas@glider.be>
References: <1499187733-1430-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Add the device tree node for the Advanced Power Management Unit (APMU).
Use the "enable-method" prop to  point out that the APMU should be used
for the SMP support.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7794.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index f32b458e93285adc..8afd04339c84c65e 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -37,6 +37,7 @@
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "renesas,apmu";
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -65,6 +66,12 @@
 		};
 	};
 
+	apmu@e6151000 {
+		compatible = "renesas,r8a7794-apmu", "renesas,apmu";
+		reg = <0 0xe6151000 0 0x188>;
+		cpus = <&cpu0 &cpu1>;
+	};
+
 	gic: interrupt-controller@f1001000 {
 		compatible = "arm,gic-400";
 		#interrupt-cells = <3>;
-- 
2.7.4
