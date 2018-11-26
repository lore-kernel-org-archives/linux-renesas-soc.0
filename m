Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35272 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726789AbeKZXtc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Nov 2018 18:49:32 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 23/40] arm64: dts: renesas: Switch eMMC bus to 1V8 on Salvator-X and ULCB
Date: Mon, 26 Nov 2018 13:54:49 +0100
Message-Id: <5f65328df3f5cd25af741638153929d3c7ad4d8a.1543229515.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1543229515.git.horms+renesas@verge.net.au>
References: <cover.1543229515.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Marek Vasut <marek.vasut@gmail.com>

The eMMC card has two supplies, VCC and VCCQ. The VCC supplies the NAND
array and the VCCQ supplies the bus. On Salvator-X and ULCB, the VCC is
connected to 3.3V rail, while the VCCQ is connected to 1.8V rail. Adjust
the pinmux to match the bus, which is always operating in 1.8V mode.

While at it, deduplicate the pinmux entries, which are now the same for
both default and UHS modes. We still need the two pinctrl entries to
match the bindings though.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 8 +-------
 arch/arm64/boot/dts/renesas/ulcb.dtsi            | 8 +-------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index a3e89504e044..f66d990b92f1 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -607,12 +607,6 @@
 	sdhi2_pins: sd2 {
 		groups = "sdhi2_data8", "sdhi2_ctrl", "sdhi2_ds";
 		function = "sdhi2";
-		power-source = <3300>;
-	};
-
-	sdhi2_pins_uhs: sd2_uhs {
-		groups = "sdhi2_data8", "sdhi2_ctrl", "sdhi2_ds";
-		function = "sdhi2";
 		power-source = <1800>;
 	};
 
@@ -763,7 +757,7 @@
 &sdhi2 {
 	/* used for on-board 8bit eMMC */
 	pinctrl-0 = <&sdhi2_pins>;
-	pinctrl-1 = <&sdhi2_pins_uhs>;
+	pinctrl-1 = <&sdhi2_pins>;
 	pinctrl-names = "default", "state_uhs";
 
 	vmmc-supply = <&reg_3p3v>;
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 89daca7356df..de694fdae067 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -332,12 +332,6 @@
 	sdhi2_pins: sd2 {
 		groups = "sdhi2_data8", "sdhi2_ctrl", "sdhi2_ds";
 		function = "sdhi2";
-		power-source = <3300>;
-	};
-
-	sdhi2_pins_uhs: sd2_uhs {
-		groups = "sdhi2_data8", "sdhi2_ctrl", "sdhi2_ds";
-		function = "sdhi2";
 		power-source = <1800>;
 	};
 
@@ -426,7 +420,7 @@
 &sdhi2 {
 	/* used for on-board 8bit eMMC */
 	pinctrl-0 = <&sdhi2_pins>;
-	pinctrl-1 = <&sdhi2_pins_uhs>;
+	pinctrl-1 = <&sdhi2_pins>;
 	pinctrl-names = "default", "state_uhs";
 
 	vmmc-supply = <&reg_3p3v>;
-- 
2.11.0
