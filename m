Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:54578 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S936192AbeEYPFY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 May 2018 11:05:24 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] arm64: dts: ulcb: Add sdhi2_ds pin group to SDHI2 pinctrl groups
Date: Fri, 25 May 2018 17:05:18 +0200
Message-Id: <20180525150518.26894-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180525150518.26894-1-wsa+renesas@sang-engineering.com>
References: <20180525150518.26894-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds definitions for configuration of the power-source,
drive-strength, etc... for the SD2_DS pin. Based on a similar patch for
Salvator boards by Masaharu Hayakawa and Takeshi Kihara.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/ulcb.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
