Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:45892 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751312AbdGQMGl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2017 08:06:41 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: iwg20m: Correct indentation of mmcif0 properties
Date: Mon, 17 Jul 2017 14:06:37 +0200
Message-Id: <1500293197-14785-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Fixes: 4658c4b789d8e2ae ("ARM: dts: iwg20m: Add MMCIF0 support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7743-iwg20m.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7743-iwg20m.dtsi b/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
index f78dbc542a824f40..ff799381863763de 100644
--- a/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
+++ b/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
@@ -45,11 +45,11 @@
 };
 
 &mmcif0 {
-		pinctrl-0 = <&mmcif0_pins>;
-		pinctrl-names = "default";
+	pinctrl-0 = <&mmcif0_pins>;
+	pinctrl-names = "default";
 
-		vmmc-supply = <&reg_3p3v>;
-		bus-width = <8>;
-		non-removable;
-		status = "okay";
+	vmmc-supply = <&reg_3p3v>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
 };
-- 
2.7.4
