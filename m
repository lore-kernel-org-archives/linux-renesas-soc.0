Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:38928 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751799AbdKWLkh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Nov 2017 06:40:37 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: r8a7795: Increase the number of GPIO bank 1 ports to 29
Date: Thu, 23 Nov 2017 11:58:50 +0100
Message-Id: <1511434730-5723-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch changes the number of GPIO bank 1 ports to 29 because GP-1-28
port pin of R8A7795 ES2.0 SoC support was added.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Fixes: 291e0c4994d0813f ("arm64: dts: r8a7795: Add support for R-Car H3 ES2.0")
[geert: Keep 28 GPIOs on H3 ES1.x after r8a7795.dtsi sharing]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 4 ++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi     | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index 73d884c0422e650e..c95191adb3484d3e 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -164,6 +164,10 @@
 	};
 };
 
+&gpio1 {
+	gpio-ranges = <&pfc 0 32 28>;
+};
+
 &ipmmu_vi0 {
 	renesas,ipmmu-main = <&ipmmu_mm 11>;
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index c9a8ec6d2e139e75..5d80f3d70a414365 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -295,7 +295,7 @@
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
 			gpio-controller;
-			gpio-ranges = <&pfc 0 32 28>;
+			gpio-ranges = <&pfc 0 32 29>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
 			clocks = <&cpg CPG_MOD 911>;
-- 
2.7.4
