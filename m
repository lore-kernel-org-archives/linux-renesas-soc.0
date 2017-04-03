Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:59214 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751466AbdDCJza (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Apr 2017 05:55:30 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: koelsch: Correct clock frequency of X2 DU clock input
Date: Mon,  3 Apr 2017 11:55:19 +0200
Message-Id: <1491213319-7668-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The X2 crystal oscillator on the Koelsch development board provides a
74.25 MHz clock, not a 148.5 MHz clock.

Fixes: cd21cb46e14aae3a ("ARM: shmobile: koelsch: Add DU external pixel clocks to DT")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Confirmed by schematics, user manual, and physical inspection of 2
Koelsch instances (my scope has not enough bandwidth to measure the
actual frequency).

Probably this was copied from r8a7790-lager.dts, as Lager does have two
identical crystal oscillators X2 and X13.

Note that X2 is socketed, so it can be changed.
---
 arch/arm/boot/dts/r8a7791-koelsch.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index 59beb8402a36007b..001e6116c47c7c3b 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -292,7 +292,7 @@
 	x2_clk: x2-clock {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-frequency = <148500000>;
+		clock-frequency = <74250000>;
 	};
 
 	x13_clk: x13-clock {
-- 
2.7.4
