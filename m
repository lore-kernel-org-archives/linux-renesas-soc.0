Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36101 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752705AbcF3OP4 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 30 Jun 2016 10:15:56 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/9] arm64: dts: r8a7795: Add missing blank lines between cpu nodes
Date: Thu, 30 Jun 2016 16:14:59 +0200
Message-Id: <3bb1acd1eb312c99f3b60d1f591668d00ff007ab.1467291676.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1467291676.git.horms+renesas@verge.net.au>
References: <cover.1467291676.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

For consistency with a57_0/a57_1 cpu nodes, and all other nodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 04eb0bc65634..fad6dd8b7771 100644
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
2.7.0.rc3.207.g0ac5344
