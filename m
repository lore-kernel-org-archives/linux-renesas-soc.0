Return-Path: <devicetree-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 17/19] ARM: dts: silk: Name serial port pfc subnode after device name
Date: Fri, 10 Jun 2016 15:01:03 +0200
Message-Id: <1465563665-2231-18-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1465563665-2231-1-git-send-email-geert+renesas@glider.be>
References: <1465563665-2231-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Name the Pin Function Controller subnode for SCIF2 after its device
name, instead of using some arbitrary name that looks like a serial port
alias, but differs from the actual alias.

This avoids conflicts when enabling support for more serial ports later,
either here or in a DT overlay.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7794-silk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7794-silk.dts b/arch/arm/boot/dts/r8a7794-silk.dts
index b8c7a63c5ec456bc..7e88f6fe55cdcc02 100644
--- a/arch/arm/boot/dts/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/r8a7794-silk.dts
@@ -129,7 +129,7 @@
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
 
-	scif2_pins: serial2 {
+	scif2_pins: scif2 {
 		groups = "scif2_data";
 		function = "scif2";
 	};
-- 
1.9.1

