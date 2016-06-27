Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:48849 "EHLO
	baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751938AbcF0Ru4 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 27 Jun 2016 13:50:56 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wim Van Sebroeck <wim@iguana.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] arm64: dts: r8a7796/salvator-x: Enable watchdog timer
Date: Mon, 27 Jun 2016 19:50:47 +0200
Message-Id: <1467049847-7469-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1467049847-7469-1-git-send-email-geert+renesas@glider.be>
References: <1467049847-7469-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable the Watchdog Timer (WDT) controller on the Renesas Salvator-X
board equipped with an R-Car M3-W (r8a7796) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index 9c52613fb88c9699..e72be3856d792516 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
@@ -43,3 +43,8 @@
 	clock-frequency = <14745600>;
 	status = "okay";
 };
+
+&wdt0 {
+	timeout-sec = <60>;
+	status = "okay";
+};
-- 
1.9.1
