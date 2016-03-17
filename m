Return-Path: <horms@vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 01/12] ARM: dts: ape6evm: use generic pinctrl properties
Date: Fri, 18 Mar 2016 08:59:11 +0900
Message-Id: <1458259162-15706-2-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1458259162-15706-1-git-send-email-horms+renesas@verge.net.au>
References: <1458259162-15706-1-git-send-email-horms+renesas@verge.net.au>
List-ID: <linux-renesas-soc.vger.kernel.org>

Since 16ccaf5bb5a5 ("pinctrl: sh-pfc: Accept standard function, pins and
groups properties") renesas pfc drivers accept generic "function", "pins"
and "groups" properties.

This patch updates the ape6evm device tree to use the generic properties.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a73a4-ape6evm.dts | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/r8a73a4-ape6evm.dts b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
index 590257095700..93ace33e3e36 100644
--- a/arch/arm/boot/dts/r8a73a4-ape6evm.dts
+++ b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
@@ -189,28 +189,28 @@
 
 &pfc {
 	scifa0_pins: serial0 {
-		renesas,groups = "scifa0_data";
-		renesas,function = "scifa0";
+		groups = "scifa0_data";
+		function = "scifa0";
 	};
 
 	mmc0_pins: mmc {
-		renesas,groups = "mmc0_data8", "mmc0_ctrl";
-		renesas,function = "mmc0";
+		groups = "mmc0_data8", "mmc0_ctrl";
+		function = "mmc0";
 	};
 
 	sdhi0_pins: sd0 {
-		renesas,groups = "sdhi0_data4", "sdhi0_ctrl", "sdhi0_cd";
-		renesas,function = "sdhi0";
+		groups = "sdhi0_data4", "sdhi0_ctrl", "sdhi0_cd";
+		function = "sdhi0";
 	};
 
 	sdhi1_pins: sd1 {
-		renesas,groups = "sdhi1_data4", "sdhi1_ctrl";
-		renesas,function = "sdhi1";
+		groups = "sdhi1_data4", "sdhi1_ctrl";
+		function = "sdhi1";
 	};
 
 	keyboard_pins: keyboard {
-		renesas,pins = "PORT324", "PORT325", "PORT326", "PORT327",
-			       "PORT328", "PORT329";
+		pins = "PORT324", "PORT325", "PORT326", "PORT327", "PORT328",
+		       "PORT329";
 		bias-pull-up;
 	};
 };
-- 
2.1.4
