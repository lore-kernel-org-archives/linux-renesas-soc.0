Return-Path: <devicetree-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 21/23] ARM: dts: silk: Fix W=1 dtc warnings
Date: Fri, 13 May 2016 09:56:01 +0200
Message-Id: <1463126163-29423-22-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1463126163-29423-1-git-send-email-geert+renesas@glider.be>
References: <1463126163-29423-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Warning (unit_address_vs_reg): Node /regulator@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@3 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@4 has a unit name, but no reg property

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7794-silk.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7794-silk.dts b/arch/arm/boot/dts/r8a7794-silk.dts
index 56d98d5b21850cd2..b8c7a63c5ec456bc 100644
--- a/arch/arm/boot/dts/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/r8a7794-silk.dts
@@ -32,7 +32,7 @@
 		reg = <0 0x40000000 0 0x40000000>;
 	};
 
-	d3_3v: regulator@0 {
+	d3_3v: regulator-d3-3v {
 		compatible = "regulator-fixed";
 		regulator-name = "D3.3V";
 		regulator-min-microvolt = <3300000>;
@@ -41,7 +41,7 @@
 		regulator-always-on;
 	};
 
-	vcc_sdhi1: regulator@3 {
+	vcc_sdhi1: regulator-vcc-sdhi1 {
 		compatible = "regulator-fixed";
 
 		regulator-name = "SDHI1 Vcc";
@@ -52,7 +52,7 @@
 		enable-active-high;
 	};
 
-	vccq_sdhi1: regulator@4 {
+	vccq_sdhi1: regulator-vccq-sdhi1 {
 		compatible = "regulator-gpio";
 
 		regulator-name = "SDHI1 VccQ";
-- 
1.9.1

