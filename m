Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:52292 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754040AbcITMZX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Sep 2016 08:25:23 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: r8a7796: salvator-x: Populate EXTALR
Date: Tue, 20 Sep 2016 14:25:17 +0200
Message-Id: <1474374317-5475-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

It can be used for the watchdog.

Based on similar work for r8a7795/salvator-x by Wolfram Sang.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index 13db7d61c26c28b8..90e9a76c8b3080d7 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
@@ -49,6 +49,10 @@
 	clock-frequency = <16666666>;
 };
 
+&extalr_clk {
+	clock-frequency = <32768>;
+};
+
 &scif2 {
 	pinctrl-0 = <&scif2_pins>;
 	pinctrl-names = "default";
-- 
1.9.1
