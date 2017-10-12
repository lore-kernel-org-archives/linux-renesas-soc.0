Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:54050 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755738AbdJLJfW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Oct 2017 05:35:22 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 13/13] ARM: dts: sh73a0: Add clocks for CA9 CPU cores
Date: Thu, 12 Oct 2017 11:35:16 +0200
Message-Id: <1507800916-11509-14-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1507800916-11509-1-git-send-email-geert+renesas@glider.be>
References: <1507800916-11509-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Improve hardware description by adding clocks properties to the device
nodes corresponding to the CA9 CPU cores.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/sh73a0.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/sh73a0.dtsi b/arch/arm/boot/dts/sh73a0.dtsi
index f841895e5adc615a..a074106839a62e37 100644
--- a/arch/arm/boot/dts/sh73a0.dtsi
+++ b/arch/arm/boot/dts/sh73a0.dtsi
@@ -27,6 +27,7 @@
 			compatible = "arm,cortex-a9";
 			reg = <0>;
 			clock-frequency = <1196000000>;
+			clocks = <&cpg_clocks SH73A0_CLK_Z>;
 			power-domains = <&pd_a2sl>;
 			next-level-cache = <&L2>;
 		};
@@ -35,6 +36,7 @@
 			compatible = "arm,cortex-a9";
 			reg = <1>;
 			clock-frequency = <1196000000>;
+			clocks = <&cpg_clocks SH73A0_CLK_Z>;
 			power-domains = <&pd_a2sl>;
 			next-level-cache = <&L2>;
 		};
-- 
2.7.4
