Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41654 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751534AbcD0EGy (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 27 Apr 2016 00:06:54 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/4] arm64: dts: salvator-x: populate EXTALR
Date: Wed, 27 Apr 2016 14:06:45 +1000
Message-Id: <de5a79f125dd8c260d8c39b2bdced2a8fa957518.1461723181.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1461723181.git.horms+renesas@verge.net.au>
References: <cover.1461723181.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

It can be used for the watchdog.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 7c40ac8232f3..78c02937697e 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -141,6 +141,10 @@
 	clock-frequency = <16666666>;
 };
 
+&extalr_clk {
+	clock-frequency = <32768>;
+};
+
 &pfc {
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
-- 
2.7.0.rc3.207.g0ac5344
