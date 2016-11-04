Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41481 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759924AbcKDJo4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Nov 2016 05:44:56 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        William Towle <william.towle@codethink.co.uk>,
        Rob Taylor <rob.taylor@codethink.co.uk>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 19/29] ARM: dts: lager: Add entries for VIN HDMI input support
Date: Fri,  4 Nov 2016 10:44:18 +0100
Message-Id: <56548d0c5aead2a1f7df43fcb29f93575ff713b4.1478252309.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1478252308.git.horms+renesas@verge.net.au>
References: <cover.1478252308.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: William Towle <william.towle@codethink.co.uk>

Add DT entries for vin0, vin0_pins, and adv7612.

Sets the 'default-input' property for ADV7612, enabling image and video
capture without the need to have userspace specifying routing.

Signed-off-by: William Towle <william.towle@codethink.co.uk>
Signed-off-by: Rob Taylor <rob.taylor@codethink.co.uk>
[uli: added interrupt, renamed endpoint, merged default-input]
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7790-lager.dts | 66 +++++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 52b56fcaddf2..434268262d88 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -231,12 +231,23 @@
 		};
 	};
 
+	hdmi-in {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&adv7612_in>;
+			};
+		};
+	};
+
 	hdmi-out {
 		compatible = "hdmi-connector";
 		type = "a";
 
 		port {
-			hdmi_con: endpoint {
+			hdmi_con_out: endpoint {
 				remote-endpoint = <&adv7511_out>;
 			};
 		};
@@ -427,6 +438,11 @@
 		function = "usb2";
 	};
 
+	vin0_pins: vin0 {
+		groups = "vin0_data24", "vin0_sync", "vin0_clkenb", "vin0_clk";
+		function = "vin0";
+	};
+
 	vin1_pins: vin1 {
 		groups = "vin1_data8", "vin1_clk";
 		function = "vin1";
@@ -646,7 +662,34 @@
 			port@1 {
 				reg = <1>;
 				adv7511_out: endpoint {
-					remote-endpoint = <&hdmi_con>;
+					remote-endpoint = <&hdmi_con_out>;
+				};
+			};
+		};
+	};
+
+	hdmi-in@4c {
+		compatible = "adi,adv7612";
+		reg = <0x4c>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
+		default-input = <0>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7612_in: endpoint {
+					remote-endpoint = <&hdmi_con_in>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				adv7612_out: endpoint {
+					remote-endpoint = <&vin0ep2>;
 				};
 			};
 		};
@@ -722,6 +765,25 @@
 	status = "okay";
 };
 
+/* HDMI video input */
+&vin0 {
+	pinctrl-0 = <&vin0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	port {
+		vin0ep2: endpoint {
+			remote-endpoint = <&adv7612_out>;
+			bus-width = <24>;
+			hsync-active = <0>;
+			vsync-active = <0>;
+			pclk-sample = <1>;
+			data-active = <1>;
+		};
+	};
+};
+
 /* composite video input */
 &vin1 {
 	pinctrl-0 = <&vin1_pins>;
-- 
2.7.0.rc3.207.g0ac5344
