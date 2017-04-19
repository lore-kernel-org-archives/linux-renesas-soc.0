Return-Path: <devicetree-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/8] [RFC] arm64: dts: renesas: Migrate R-Car H3 Salvator-X to r8j7795-4x1g.dtsi
Date: Wed, 19 Apr 2017 11:15:48 +0200
Message-Id: <1492593351-13835-6-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1492593351-13835-1-git-send-email-geert+renesas@glider.be>
References: <1492593351-13835-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The Renesas R-Car H3 Salvator-X development board is equipped with an
r8j7795 SiP with 4 GiB of RAM.

Hence migrate from r8a7795.dtsi to r8j7795-4x1g.dtsi.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Questions:
  - Should this file be renamed to r8j7795-salvator-x.dts?
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 27 +++-------------------
 1 file changed, 3 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index ff68bac4cd7ed2f5..e5b9409bf2d218d8 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -32,12 +32,12 @@
  */
 
 /dts-v1/;
-#include "r8a7795.dtsi"
+#include "r8j7795-4x1g.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 
 / {
-	model = "Renesas Salvator-X board based on r8a7795";
-	compatible = "renesas,salvator-x", "renesas,r8a7795";
+	model = "Renesas Salvator-X board based on r8j7795";
+	compatible = "renesas,salvator-x", "renesas,r8j7795", "renesas,r8a7795";
 
 	aliases {
 		serial0 = &scif2;
@@ -50,27 +50,6 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory@48000000 {
-		device_type = "memory";
-		/* first 128MB is reserved for secure area. */
-		reg = <0x0 0x48000000 0x0 0x38000000>;
-	};
-
-	memory@500000000 {
-		device_type = "memory";
-		reg = <0x5 0x00000000 0x0 0x40000000>;
-	};
-
-	memory@600000000 {
-		device_type = "memory";
-		reg = <0x6 0x00000000 0x0 0x40000000>;
-	};
-
-	memory@700000000 {
-		device_type = "memory";
-		reg = <0x7 0x00000000 0x0 0x40000000>;
-	};
-
 	x12_clk: x12 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-- 
2.7.4

