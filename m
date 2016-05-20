Return-Path: <devicetree-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 10/23] ARM: dts: ape6evm: Fix W=1 dtc warnings
Date: Fri, 20 May 2016 09:10:01 +0200
Message-Id: <1463728214-13838-11-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1463728214-13838-1-git-send-email-geert+renesas@glider.be>
References: <1463728214-13838-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Warning (unit_address_vs_reg): Node /regulator@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@1 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@2 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@3 has a unit name, but no reg property

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 arch/arm/boot/dts/r8a73a4-ape6evm.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/r8a73a4-ape6evm.dts b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
index 93ace33e3e361af0..740e5d23f7c70843 100644
--- a/arch/arm/boot/dts/r8a73a4-ape6evm.dts
+++ b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
@@ -36,7 +36,7 @@
 		reg = <2 0x00000000 0 0x40000000>;
 	};
 
-	vcc_mmc0: regulator@0 {
+	vcc_mmc0: regulator-mmc0 {
 		compatible = "regulator-fixed";
 		regulator-name = "MMC0 Vcc";
 		regulator-min-microvolt = <2800000>;
@@ -44,7 +44,7 @@
 		regulator-always-on;
 	};
 
-	vcc_sdhi0: regulator@1 {
+	vcc_sdhi0: regulator-sdhi0 {
 		compatible = "regulator-fixed";
 
 		regulator-name = "SDHI0 Vcc";
@@ -56,7 +56,7 @@
 	};
 
 	/* Common 1.8V and 3.3V rails, used by several devices on APE6EVM */
-	ape6evm_fixed_1v8: regulator@2 {
+	ape6evm_fixed_1v8: regulator-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "1V8";
 		regulator-min-microvolt = <1800000>;
@@ -64,7 +64,7 @@
 		regulator-always-on;
 	};
 
-	ape6evm_fixed_3v3: regulator@3 {
+	ape6evm_fixed_3v3: regulator-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "3V3";
 		regulator-min-microvolt = <3300000>;
-- 
1.9.1

