Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:34039 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751346AbcKHOQh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Nov 2016 09:16:37 -0500
Received: by mail-lf0-f45.google.com with SMTP id o141so68353456lff.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Nov 2016 06:16:15 -0800 (PST)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 3/4 v2] arm64: dts: h3ulcb: enable SDHI2
Date: Tue,  8 Nov 2016 17:16:19 +0300
Message-Id: <1478614579-10006-1-git-send-email-vladimir.barinov@cogentembedded.com>
In-Reply-To: <1478196242-939-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1478196242-939-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This supports SDHI2 for H3ULCB onboard eMMC

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Reviewed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Changes in version 2:
- renamed sdhi2_pins_3v3 to sdhi2_pins
- renamed sd2_3v3 to sd2
- renamed sdhi2_pins_1v8 to sdhi2_pins_uhs
- renamed sd2_1v8 to sd2_uhs

 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 43 ++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
index a244edb..e46687e 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
@@ -55,6 +55,24 @@
 		clock-frequency = <24576000>;
 	};
 
+	reg_1p8v: regulator0 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator1 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	vcc_sdhi0: regulator-vcc-sdhi0 {
 		compatible = "regulator-fixed";
 
@@ -113,6 +131,18 @@
 		function = "sdhi0";
 		power-source = <1800>;
 	};
+
+	sdhi2_pins: sd2 {
+		groups = "sdhi2_data8", "sdhi2_ctrl";
+		function = "sdhi2";
+		power-source = <3300>;
+	};
+
+	sdhi2_pins_uhs: sd2_uhs {
+		groups = "sdhi2_data8", "sdhi2_ctrl";
+		function = "sdhi2";
+		power-source = <1800>;
+	};
 
 	sound_pins: sound {
 		groups = "ssi01239_ctrl", "ssi0_data", "ssi1_data_a";
@@ -128,6 +158,19 @@
 	status = "okay";
 };
 
+&sdhi2 {
+	/* used for on-board 8bit eMMC */
+	pinctrl-0 = <&sdhi2_pins>;
+	pinctrl-1 = <&sdhi2_pins_uhs>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_1p8v>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
 &ssi1 {
 	shared-pin;
 };
-- 
1.9.1
