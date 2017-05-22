Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47786 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933850AbdEVN7f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2017 09:59:35 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 11/35] arm64: dts: r8a7796: salvator-x: Set drive-strength for ravb pins
Date: Mon, 22 May 2017 15:58:44 +0200
Message-Id: <b04650d40f4b970e67cd78295ec2a3d00d959866.1495457812.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1495457812.git.horms+renesas@verge.net.au>
References: <cover.1495457812.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

The EthernetAVB should not depend on the bootloader to setup correct
drive-strength values.  Values for drive-strength where found by
examining the registers after the bootloader has configured the
registers and successfully used the EthernetAVB.

Based on commit 7d73a4da2681dc5d ("arm64: dts: r8a7795: salvator-x: Set
drive-strength for ravb pins").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index 18b478be484c..31f02219ed2f 100644
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
2.1.4
