Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from leibniz.telenet-ops.be ([195.130.137.77]:54148 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755761AbdCGSv6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Mar 2017 13:51:58 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 3vd4L82P2VzMr5bF
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Mar 2017 19:04:32 +0100 (CET)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 5/5] arm64: dts: r8a7796: Add Cortex-A53 PMU node
Date: Tue,  7 Mar 2017 19:03:26 +0100
Message-Id: <1488909806-3322-6-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1488909806-3322-1-git-send-email-geert+renesas@glider.be>
References: <1488909806-3322-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable the performance monitor unit for the Cortex-A53 cores on the
R8A7796 SoC.

Extracted from a patch by Takeshi Kihara in the BSP.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index b32a180009dd10cc..a90abf14dc4e7c79 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -303,6 +303,18 @@
 					     <&a57_1>;
 		};
 
+		pmu_a53 {
+			compatible = "arm,cortex-a53-pmu";
+			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-affinity = <&a53_0>,
+					     <&a53_1>,
+					     <&a53_2>,
+					     <&a53_3>;
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a7796-cpg-mssr";
 			reg = <0 0xe6150000 0 0x1000>;
-- 
2.7.4
