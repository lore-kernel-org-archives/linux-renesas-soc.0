Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f67.google.com ([209.85.160.67]:41551 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751444AbeE2HBR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 May 2018 03:01:17 -0400
Received: by mail-pl0-f67.google.com with SMTP id az12-v6so8394465plb.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 May 2018 00:01:17 -0700 (PDT)
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] arm64: dts: renesas: r8a77965: Add Watchdog Timer controller node using RCLK Watchdog Timer
Date: Tue, 29 May 2018 16:01:02 +0900
Message-Id: <1527577262-8754-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Add a device node for the Watchdog Timer (WDT) controller on the Renesas
R-Car M3-N (R8A77965) SoC.

Based on a similar patch of the R8A7796 device tree
by Geert Uytterhoeven <geert+renesas@glider.be>.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

This patch is based on the devel branch of Simon Horman's renesas tree.

v2 [Yoshihiro Kaneko]
- add tags
* As suggested by Geert Uytterhoeven
- fix the summary prefix of the subject
- fix the notation of the name of SoC

 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 486aeca..fb7100f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -139,8 +139,13 @@
 		ranges;
 
 		wdt0: watchdog@e6020000 {
+			compatible = "renesas,r8a77965-wdt",
+				     "renesas,rcar-gen3-wdt";
 			reg = <0 0xe6020000 0 0x0c>;
-			/* placeholder */
+			clocks = <&cpg CPG_MOD 402>;
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			resets = <&cpg 402>;
+			status = "disabled";
 		};
 
 		gpio0: gpio@e6050000 {
-- 
1.9.1
