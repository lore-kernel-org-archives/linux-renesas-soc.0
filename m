Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:36407 "EHLO
	baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932497AbcDYOIk (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 25 Apr 2016 10:08:40 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/6] ARM: dts: r8a7779: Don't disable referenced optional clocks
Date: Mon, 25 Apr 2016 16:08:32 +0200
Message-Id: <1461593315-21307-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1461593315-21307-1-git-send-email-geert+renesas@glider.be>
References: <1461593315-21307-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

clk_get() on a disabled clock node will return -EPROBE_DEFER, which can
cause drivers to be deferred forever if such clocks are referenced in
their devices' clocks properties.

Update the various disabled external clock nodes to default to a
frequency of 0, but don't disable them, to prevent this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7779.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
index d43e3b2105aef7dc..b9bbcce69dfbd5b9 100644
--- a/arch/arm/boot/dts/r8a7779.dtsi
+++ b/arch/arm/boot/dts/r8a7779.dtsi
@@ -462,7 +462,6 @@
 			#clock-cells = <0>;
 			/* This value must be overridden by the board. */
 			clock-frequency = <0>;
-			status = "disabled";
 		};
 
 		/* Special CPG clocks */
-- 
1.9.1
