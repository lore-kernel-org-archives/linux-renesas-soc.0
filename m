Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56528 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751153AbcFHBAA (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 7 Jun 2016 21:00:00 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 5/9] arm64: dts: salvator-x: Enable watchdog timer
Date: Wed,  8 Jun 2016 09:59:42 +0900
Message-Id: <329260d5c4fdf9929b889e7badbb6d729edf123a.1465347183.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1465347183.git.horms+renesas@verge.net.au>
References: <cover.1465347183.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

This patch enables watchdog timer for Salvator-X board.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 76bc94a528aa..84082922edb2 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -330,6 +330,11 @@
 	shared-pin;
 };
 
+&wdt0 {
+	timeout-sec = <60>;
+	status = "okay";
+};
+
 &audio_clk_a {
 	clock-frequency = <22579200>;
 };
-- 
2.1.4
