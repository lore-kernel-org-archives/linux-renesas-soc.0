Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:57496 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752412AbeEGN5J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 May 2018 09:57:09 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 7/8] ARM: dts: r8a7743: Add PMU device node
Date: Mon,  7 May 2018 15:57:06 +0200
Message-Id: <1525701427-12914-8-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1525701427-12914-1-git-send-email-geert+renesas@glider.be>
References: <1525701427-12914-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable support for the ARM Performance Monitor Units in the Cortex-A15
CPU cores on RZ/G1M by adding a device node for the PMU.

New Linux output:

    hw perfevents: enabled with armv7_cortex_a15 PMU driver, 7 counters available

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7743.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index 69d8f7e0f0536fc0..142949d7066f3a65 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -125,6 +125,13 @@
 		clock-frequency = <0>;
 	};
 
+	pmu {
+		compatible = "arm,cortex-a15-pmu";
+		interrupts-extended = <&gic GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+				      <&gic GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>;
+	};
+
 	/* External SCIF clock */
 	scif_clk: scif {
 		compatible = "fixed-clock";
-- 
2.7.4
