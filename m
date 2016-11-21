Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41756 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754247AbcKUMGK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2016 07:06:10 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 13/18] arm64: dts: m3ulcb: enable SDHI0
Date: Mon, 21 Nov 2016 13:05:42 +0100
Message-Id: <5be54db85872fddf060ccec962a50b40d3b24625.1479726397.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1479726397.git.horms+renesas@verge.net.au>
References: <cover.1479726397.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>

This supports SDHI0 on M3ULCB board SD card slot

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts | 49 ++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
index 593d0b4ab31a..d209e5480ff6 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
@@ -54,6 +54,30 @@
 			gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	vcc_sdhi0: regulator-vcc-sdhi0 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "SDHI0 Vcc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&gpio5 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vccq_sdhi0: regulator-vccq-sdhi0 {
+		compatible = "regulator-gpio";
+
+		regulator-name = "SDHI0 VccQ";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+		gpios-states = <1>;
+		states = <3300000 1
+			  1800000 0>;
+	};
 };
 
 &extal_clk {
@@ -77,6 +101,31 @@
 		groups = "scif_clk_a";
 		function = "scif_clk";
 	};
+
+	sdhi0_pins: sd0 {
+		groups = "sdhi0_data4", "sdhi0_ctrl";
+		function = "sdhi0";
+		power-source = <3300>;
+	};
+
+	sdhi0_pins_uhs: sd0_uhs {
+		groups = "sdhi0_data4", "sdhi0_ctrl";
+		function = "sdhi0";
+		power-source = <1800>;
+	};
+};
+
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_pins>;
+	pinctrl-1 = <&sdhi0_pins_uhs>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&vcc_sdhi0>;
+	vqmmc-supply = <&vccq_sdhi0>;
+	cd-gpios = <&gpio3 12 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	status = "okay";
 };
 
 &scif2 {
-- 
2.7.0.rc3.207.g0ac5344
