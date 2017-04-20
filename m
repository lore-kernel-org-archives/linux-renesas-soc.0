Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:41394 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S944159AbdDTJuv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Apr 2017 05:50:51 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: r8a7796: salvator-x: Set drive-strength for ravb pins
Date: Thu, 20 Apr 2017 11:50:47 +0200
Message-Id: <1492681847-20190-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The EthernetAVB should not depend on the bootloader to setup correct
drive-strength values.  Values for drive-strength where found by
examining the registers after the bootloader has configured the
registers and successfully used the EthernetAVB.

Based on commit 7d73a4da2681dc5d ("arm64: dts: r8a7795: salvator-x: Set
drive-strength for ravb pins").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
While technically this depends on "pinctrl: sh-pfc: r8a7796: Add group
for AVB MDIO and MII pins", and despite a scary message if that patch
hasn't been applied:

    sh-pfc e6060000.pin-controller: invalid group "avb_mii" for function "avb"

Ethernet still works fine without it.
---
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index 18b478be484cfd83..31f02219ed2fb18a 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
@@ -110,8 +110,22 @@
 	pinctrl-names = "default";
 
 	avb_pins: avb {
-		groups = "avb_mdc";
-		function = "avb";
+		mux {
+			groups = "avb_link", "avb_phy_int", "avb_mdc",
+				 "avb_mii";
+			function = "avb";
+		};
+
+		pins_mdc {
+			groups = "avb_mdc";
+			drive-strength = <24>;
+		};
+
+		pins_mii_tx {
+			pins = "PIN_AVB_TX_CTL", "PIN_AVB_TXC", "PIN_AVB_TD0",
+			       "PIN_AVB_TD1", "PIN_AVB_TD2", "PIN_AVB_TD3";
+			drive-strength = <12>;
+		};
 	};
 
 	scif1_pins: scif1 {
-- 
2.7.4
