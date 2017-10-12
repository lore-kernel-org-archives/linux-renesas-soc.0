Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:37546 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755944AbdJLJfU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Oct 2017 05:35:20 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 12/13] ARM: dts: r8a7794: Add missing clock for secondary CA7 CPU core
Date: Thu, 12 Oct 2017 11:35:15 +0200
Message-Id: <1507800916-11509-13-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1507800916-11509-1-git-send-email-geert+renesas@glider.be>
References: <1507800916-11509-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Currently only the primary CPU in the CA7 cluster has a clocks property,
while the secondary CPU core is driven by the same clock.
Add the missing clocks property to fix this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7794.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index 4fd92e989e227270..b588029ae9db8957 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -54,6 +54,7 @@
 			compatible = "arm,cortex-a7";
 			reg = <1>;
 			clock-frequency = <1000000000>;
+			clocks = <&cpg CPG_CORE R8A7794_CLK_Z2>;
 			power-domains = <&sysc R8A7794_PD_CA7_CPU1>;
 			next-level-cache = <&L2_CA7>;
 		};
-- 
2.7.4
