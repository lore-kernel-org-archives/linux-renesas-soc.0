Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:54568 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S936186AbeEYPFX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 May 2018 11:05:23 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] arm64: dts: salvator-common: Add sdhi2_ds pin group to SDHI2 pinctrl groups
Date: Fri, 25 May 2018 17:05:17 +0200
Message-Id: <20180525150518.26894-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180525150518.26894-1-wsa+renesas@sang-engineering.com>
References: <20180525150518.26894-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>

This patch adds definitions for configuration of the power-source,
drive-strength, etc... for the SD2_DS pin.

Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
2.11.0
