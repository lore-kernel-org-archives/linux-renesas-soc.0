Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56082 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751200AbcGGOkA (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 7 Jul 2016 10:40:00 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/8] arm64: dts: r8a7795: Add missing blank lines between cpu nodes
Date: Thu,  7 Jul 2016 16:39:44 +0200
Message-Id: <a5547642a4e08c98edeaf4b62f6da0ac8ed2f6bd.1467900241.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1467900241.git.horms+renesas@verge.net.au>
References: <cover.1467900241.git.horms+renesas@verge.net.au>
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
