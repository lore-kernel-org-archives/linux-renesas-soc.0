Return-Path: <devicetree-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 06/19] ARM: dts: lager: Name serial port pfc subnodes after device names
Date: Fri, 10 Jun 2016 15:00:52 +0200
Message-Id: <1465563665-2231-7-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1465563665-2231-1-git-send-email-geert+renesas@glider.be>
References: <1465563665-2231-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Name the Pin Function Controller subnodes for SCIF0 and SCIFA1 after
their device names, instead of after the serial port aliases.

This avoids conflicts when enabling support for more serial ports later,
either here or in a DT overlay.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7790-lager.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 15cef6232a391e02..9cb055a932edabc7 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -317,7 +317,7 @@
 		function = "du";
 	};
 
-	scif0_pins: serial0 {
+	scif0_pins: scif0 {
 		groups = "scif0_data";
 		function = "scif0";
 	};
@@ -337,7 +337,7 @@
 		function = "intc";
 	};
 
-	scifa1_pins: serial1 {
+	scifa1_pins: scifa1 {
 		groups = "scifa1_data";
 		function = "scifa1";
 	};
-- 
1.9.1

