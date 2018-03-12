Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:49096 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751293AbeCLPME (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Mar 2018 11:12:04 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] arm64: dts: renesas: salvator-common: Rename EtherAVB "mdc" pin group to "mdio"
Date: Mon, 12 Mar 2018 16:11:58 +0100
Message-Id: <1520867520-13942-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1520867520-13942-1-git-send-email-geert+renesas@glider.be>
References: <1520867520-13942-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On other Renesas SoCs, the pin group for the MDIO bus is named "mdio"
instead of "mdc".  Fix the inconsistency, now the pinctrl drivers for
R-Car H3, M3-W, and M3-N have gained support for the traditional pin
group name.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This depends on:
  - pinctrl: sh-pfc: r8a7795-es1: Rename EtherAVB "mdc" pin group to "mdio"
  - pinctrl: sh-pfc: r8a7795: Rename EtherAVB "mdc" pin group to "mdio"
  - pinctrl: sh-pfc: r8a7796: Rename EtherAVB "mdc" pin group to "mdio"
  - pinctrl: sh-pfc: r8a77965: Rename EtherAVB "mdc" pin group to "mdio"
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 2a7f36abd2dd85c6..1642bc9c8906f010 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -416,12 +416,12 @@
 
 	avb_pins: avb {
 		mux {
-			groups = "avb_link", "avb_mdc", "avb_mii";
+			groups = "avb_link", "avb_mdio", "avb_mii";
 			function = "avb";
 		};
 
-		pins_mdc {
-			groups = "avb_mdc";
+		pins_mdio {
+			groups = "avb_mdio";
 			drive-strength = <24>;
 		};
 
-- 
2.7.4
