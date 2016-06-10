Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:45291 "EHLO
	andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751419AbcFJKGt (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 10 Jun 2016 06:06:49 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: r8a7795: Add missing blank lines between cpu nodes
Date: Fri, 10 Jun 2016 12:06:45 +0200
Message-Id: <1465553205-7159-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

For consistency with a57_0/a57_1 cpu nodes, and all other nodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index fca68d7b047dfa1d..2edc38a0d0ae7f38 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -53,6 +53,7 @@
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
 		};
+
 		a57_2: cpu@2 {
 			compatible = "arm,cortex-a57","arm,armv8";
 			reg = <0x2>;
@@ -61,6 +62,7 @@
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
 		};
+
 		a57_3: cpu@3 {
 			compatible = "arm,cortex-a57","arm,armv8";
 			reg = <0x3>;
-- 
1.9.1
