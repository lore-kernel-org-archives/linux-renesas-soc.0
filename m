Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:49016 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933098AbeE1T24 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 May 2018 15:28:56 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2] arm64: dts: renesas: Add sdhi2_ds pin group to SDHI2 pinctrl groups
Date: Mon, 28 May 2018 21:28:42 +0200
Message-Id: <20180528192842.2758-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>

This patch adds definitions for configuration of the power-source,
drive-strength, etc... for the SD2_DS pin for Salvator-X(S) and ULCB
boards.

Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[wsa: fixed for ULCB boards, too]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since V1:
	* squashed commits into single one

 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 4 ++--
 arch/arm64/boot/dts/renesas/ulcb.dtsi            | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 9256fbaaab7f..b3c0b6912af4 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -589,13 +589,13 @@
 	};
 
 	sdhi2_pins: sd2 {
-		groups = "sdhi2_data8", "sdhi2_ctrl";
+		groups = "sdhi2_data8", "sdhi2_ctrl", "sdhi2_ds";
 		function = "sdhi2";
 		power-source = <3300>;
 	};
 
 	sdhi2_pins_uhs: sd2_uhs {
-		groups = "sdhi2_data8", "sdhi2_ctrl";
+		groups = "sdhi2_data8", "sdhi2_ctrl", "sdhi2_ds";
 		function = "sdhi2";
 		power-source = <1800>;
 	};
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 0edb16e6b372..702df9cbed52 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -330,13 +330,13 @@
 	};
 
 	sdhi2_pins: sd2 {
-		groups = "sdhi2_data8", "sdhi2_ctrl";
+		groups = "sdhi2_data8", "sdhi2_ctrl", "sdhi2_ds";
 		function = "sdhi2";
 		power-source = <3300>;
 	};
 
 	sdhi2_pins_uhs: sd2_uhs {
-		groups = "sdhi2_data8", "sdhi2_ctrl";
+		groups = "sdhi2_data8", "sdhi2_ctrl", "sdhi2_ds";
 		function = "sdhi2";
 		power-source = <1800>;
 	};
-- 
2.11.0
