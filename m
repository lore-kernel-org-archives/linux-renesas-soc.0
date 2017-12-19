Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:46176 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752719AbdLSQCL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Dec 2017 11:02:11 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] ARM: dts: r8a7740: Correct TPU register block size
Date: Tue, 19 Dec 2017 17:02:05 +0100
Message-Id: <1513699327-27357-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1513699327-27357-1-git-send-email-geert+renesas@glider.be>
References: <1513699327-27357-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The Timer Pulse Unit has registers that lie outside the declared
register block.  Enlarge the register block size to fix this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This was probably based on the old platform code, which also assumed a
register block size of 0x100.

 arch/arm/boot/dts/r8a7740.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
index 95c408b11991fb77..afd3bc5e6cf2e23f 100644
--- a/arch/arm/boot/dts/r8a7740.dtsi
+++ b/arch/arm/boot/dts/r8a7740.dtsi
@@ -317,7 +317,7 @@
 
 	tpu: pwm@e6600000 {
 		compatible = "renesas,tpu-r8a7740", "renesas,tpu";
-		reg = <0xe6600000 0x100>;
+		reg = <0xe6600000 0x148>;
 		clocks = <&mstp3_clks R8A7740_CLK_TPU0>;
 		power-domains = <&pd_a3sp>;
 		status = "disabled";
-- 
2.7.4
