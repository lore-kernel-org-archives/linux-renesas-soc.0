Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751815AbeERLR6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:17:58 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 035/102] arm64: dts: renesas: salvator-common: Rename EtherAVB "mdc" pin group to "mdio"
Date: Fri, 18 May 2018 13:14:57 +0200
Message-Id: <77bf06adb128ef0b47b9c49b1ae8f3313c684a70.1526637994.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526637994.git.horms+renesas@verge.net.au>
References: <cover.1526637994.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

On other Renesas SoCs, the pin group for the MDIO bus is named "mdio"
instead of "mdc".  Fix the inconsistency, now the pinctrl drivers for
R-Car H3, M3-W, and M3-N have gained support for the traditional pin
group name.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 2a7f36abd2dd..1642bc9c8906 100644
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
2.11.0
