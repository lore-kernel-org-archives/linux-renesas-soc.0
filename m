Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:41740 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752466AbeEGN5J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 May 2018 09:57:09 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/8] ARM: dts: r7s72100: Add PMU device node
Date: Mon,  7 May 2018 15:57:00 +0200
Message-Id: <1525701427-12914-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1525701427-12914-1-git-send-email-geert+renesas@glider.be>
References: <1525701427-12914-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable support for the ARM Performance Monitor Units in the Cortex-A9
CPU core on RZ/A1H by adding a device node for the PMU.

New Linux output:

    hw perfevents: enabled with armv7_cortex_a9 PMU driver, 7 counters available

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r7s72100.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index eb2e6f95a2e85862..a54822e97bac42ed 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -77,6 +77,11 @@
 		clock-div = <6>;
 	};
 
+	pmu {
+		compatible = "arm,cortex-a9-pmu";
+		interrupts-extended = <&gic GIC_PPI 0 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	rtc_x1_clk: rtc_x1 {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
-- 
2.7.4
