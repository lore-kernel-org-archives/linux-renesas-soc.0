Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:54046 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756089AbdJLJfW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Oct 2017 05:35:22 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 09/13] ARM: dts: r8a7791: Add missing clock for secondary CA15 CPU core
Date: Thu, 12 Oct 2017 11:35:12 +0200
Message-Id: <1507800916-11509-10-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1507800916-11509-1-git-send-email-geert+renesas@glider.be>
References: <1507800916-11509-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Currently only the primary CPU in the CA15 cluster has a clocks
property, while the secondary CPU core is driven by the same clock.
Add the missing clocks property to fix this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7791.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 842592f12f428399..af97792c9fddd970 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -70,6 +70,7 @@
 			compatible = "arm,cortex-a15";
 			reg = <1>;
 			clock-frequency = <1500000000>;
+			clocks = <&cpg CPG_CORE R8A7791_CLK_Z>;
 			power-domains = <&sysc R8A7791_PD_CA15_CPU1>;
 			next-level-cache = <&L2_CA15>;
 		};
-- 
2.7.4
