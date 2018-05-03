Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:45148 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750978AbeECNCp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 May 2018 09:02:45 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/3] arm64: dts: renesas: r8a77965: Correct whitespace
Date: Thu,  3 May 2018 14:38:30 +0200
Message-Id: <1525351110-13403-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1525351110-13403-1-git-send-email-geert+renesas@glider.be>
References: <1525351110-13403-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add missing space after comma.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Rebased.

 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index b93281affd6399d5..ba0edda431a59fd1 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -67,7 +67,7 @@
 		};
 
 		a57_1: cpu@1 {
-			compatible = "arm,cortex-a57","arm,armv8";
+			compatible = "arm,cortex-a57", "arm,armv8";
 			reg = <0x1>;
 			device_type = "cpu";
 			power-domains = <&sysc R8A77965_PD_CA57_CPU1>;
-- 
2.7.4
