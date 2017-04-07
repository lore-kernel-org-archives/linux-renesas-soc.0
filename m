Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54687 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933632AbdDGP7D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Apr 2017 11:59:03 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 17/22] ARM: dts: r7s72100: add rtc to device tree
Date: Fri,  7 Apr 2017 11:58:18 -0400
Message-Id: <3b5e3f0455442f376f91c69147526535a0389ac3.1491580547.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1491580547.git.horms+renesas@verge.net.au>
References: <cover.1491580547.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Chris Brandt <chris.brandt@renesas.com>

Add the realtime clock device node.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s72100.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 9db46ac08ba7..ab9ced453118 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -563,4 +563,18 @@
 		power-domains = <&cpg_clocks>;
 		status = "disabled";
 	};
+
+	rtc: rtc@fcff1000 {
+		compatible = "renesas,r7s72100-rtc", "renesas,sh-rtc";
+		reg = <0xfcff1000 0x2e>;
+		interrupts = <GIC_SPI 276 IRQ_TYPE_EDGE_RISING
+			      GIC_SPI 277 IRQ_TYPE_EDGE_RISING
+			      GIC_SPI 278 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "alarm", "period", "carry";
+		clocks = <&mstp6_clks R7S72100_CLK_RTC>, <&rtc_x1_clk>,
+			 <&rtc_x3_clk>, <&extal_clk>;
+		clock-names = "fck", "rtc_x1", "rtc_x3", "extal";
+		power-domains = <&cpg_clocks>;
+		status = "disabled";
+	};
 };
-- 
2.7.0.rc3.207.g0ac5344
