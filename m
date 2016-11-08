Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:36129 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753066AbcKHOOR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Nov 2016 09:14:17 -0500
Received: by mail-lf0-f42.google.com with SMTP id t196so140754067lff.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Nov 2016 06:14:16 -0800 (PST)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 6/9 v2] arm64: dts: m3ulcb: enable SDHI0
Date: Tue,  8 Nov 2016 17:14:21 +0300
Message-Id: <1478614461-9918-1-git-send-email-vladimir.barinov@cogentembedded.com>
In-Reply-To: <1478196375-1131-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1478196375-1131-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This supports SDHI0 on M3ULCB board SD card slot

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Reviewed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Changes in version 2:
- renamed sdhi0_pins_3v3 to sdhi0_pins
- renamed sd0_3v3 to sd0
- renamed sdhi0_pins_1v8 to sdhi0_pins_uhs
- renamed sd0_1v8 to sd0_uhs

 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts | 48 ++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
index 3329f78..5be0cf6 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
@@ -44,6 +44,30 @@
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
@@ -68,8 +92,33 @@
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
 };
 
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
+};
+
 &scif2 {
 	pinctrl-0 = <&scif2_pins>;
 	pinctrl-names = "default";
-- 
1.9.1
