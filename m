Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:48678 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751580AbdFHNpE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Jun 2017 09:45:04 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: salvator-x: Add missing index to PWM pinctrl subnode name
Date: Thu,  8 Jun 2017 15:45:00 +0200
Message-Id: <1496929500-8551-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

R-Car Gen3 SoCs contain multiple PWM modules.  Hence to avoid conflicts,
pinctrl subnodes for PWM should include indices referring to their
instances.

Fixes: b33be33670217533 ("arm64: dts: salvator-x: Add panel backlight support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/salvator-x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/salvator-x.dtsi b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
index 937bdf8842f2e684..2f5386252aed55e8 100644
--- a/arch/arm64/boot/dts/renesas/salvator-x.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
@@ -417,7 +417,7 @@
 		function = "i2c2";
 	};
 
-	pwm1_pins: pwm {
+	pwm1_pins: pwm1 {
 		groups = "pwm1_a";
 		function = "pwm1";
 	};
-- 
2.7.4
