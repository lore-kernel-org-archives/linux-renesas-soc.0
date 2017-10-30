Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:59122 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751475AbdJ3QHV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Oct 2017 12:07:21 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a77970: Add Cortex-A53 PMU node
Date: Mon, 30 Oct 2017 17:07:13 +0100
Message-Id: <1509379633-25823-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1509379633-25823-1-git-send-email-geert+renesas@glider.be>
References: <1509379633-25823-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable the performance monitor unit for the Cortex-A53 cores on the
R-Car V3M (r8a77970) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index 583ebb4c5eac0bfe..449c221dfe9b4dcb 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -113,6 +113,13 @@
 						  IRQ_TYPE_LEVEL_LOW)>;
 		};
 
+		pmu_a53 {
+			compatible = "arm,cortex-a53-pmu";
+			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-affinity = <&a53_0>, <&a53_1>;
+		};
+
 		rwdt: watchdog@e6020000 {
 			compatible = "renesas,r8a77970-wdt",
 				     "renesas,rcar-gen3-wdt";
-- 
2.7.4
