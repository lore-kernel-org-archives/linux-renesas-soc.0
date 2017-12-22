Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34052 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755987AbdLVKbJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Dec 2017 05:31:09 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 32/37] ARM: dts: iwg22d-sodimm: Sound PIO support
Date: Fri, 22 Dec 2017 11:30:10 +0100
Message-Id: <3838ef590119420031ad2a51ea19a9be2ea9acef.1513938145.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1513938145.git.horms+renesas@verge.net.au>
References: <cover.1513938145.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Biju Das <biju.das@bp.renesas.com>

Enable sound PIO support on carrier board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 46 +++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
index 5d4b7d203f8d..b6521da8b766 100644
--- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
+++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
@@ -32,6 +32,21 @@
 		clock-frequency = <26000000>;
 	};
 
+	rsnd_sgtl5000: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&sndcodec>;
+		simple-audio-card,frame-master = <&sndcodec>;
+
+		sndcpu: simple-audio-card,cpu {
+			sound-dai = <&rcar_sound>;
+		};
+
+		sndcodec: simple-audio-card,codec {
+			sound-dai = <&sgtl5000>;
+		};
+	};
+
 	vccq_sdhi0: regulator-vccq-sdhi0 {
 		compatible = "regulator-gpio";
 
@@ -141,6 +156,11 @@
 		power-source = <3300>;
 	};
 
+	sound_pins: sound {
+		groups = "ssi34_ctrl", "ssi3_data", "ssi4_data";
+		function = "ssi";
+	};
+
 	usb0_pins: usb0 {
 		groups = "usb0";
 		function = "usb0";
@@ -152,6 +172,23 @@
 	};
 };
 
+&rcar_sound {
+	pinctrl-0 = <&sound_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	/* Single DAI */
+
+	#sound-dai-cells = <0>;
+
+	rcar_sound,dai {
+		dai0 {
+			playback = <&ssi3>;
+			capture = <&ssi4>;
+		};
+	};
+};
+
 &scif4 {
 	pinctrl-0 = <&scif4_pins>;
 	pinctrl-names = "default";
@@ -169,6 +206,15 @@
 	status = "okay";
 };
 
+&ssi3 {
+	pio-transfer;
+};
+
+&ssi4 {
+	pio-transfer;
+	shared-pin;
+};
+
 &usbphy {
 	status = "okay";
 };
-- 
2.11.0
