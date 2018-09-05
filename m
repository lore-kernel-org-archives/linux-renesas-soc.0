Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:60383 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727100AbeIEUAy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Sep 2018 16:00:54 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, damm+renesas@opensource.se,
        ulrich.hecht+renesas@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 8/8] arm64: dts: renesas: ebisu: Add HDMI and CVBS input
Date: Wed,  5 Sep 2018 17:29:45 +0200
Message-Id: <1536161385-25562-9-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add HDMI and CVBS inputs device nodes to R-Car E3 Ebisu board.

Both HDMI and CVBS inputs are connected to an ADV7482 video decoder hooked to
the SoC CSI-2 receiver port.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 86 ++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 2bc3a48..d2faf3e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -28,6 +28,29 @@
 		/* first 128MB is reserved for secure area. */
 		reg = <0x0 0x48000000 0x0 0x38000000>;
 	};
+
+	cvbs-in {
+		compatible = "composite-video-connector";
+		label = "CVBS IN";
+
+		port {
+			cvbs_con: endpoint {
+				remote-endpoint = <&adv7482_ain7>;
+			};
+		};
+	};
+
+	hdmi-in {
+		compatible = "hdmi-connector";
+		label = "HDMI IN";
+		type = "a";
+
+		port {
+			hdmi_in_con: endpoint {
+				remote-endpoint = <&adv7482_hdmi>;
+			};
+		};
+	};
 };

 &avb {
@@ -47,6 +70,22 @@
 	};
 };

+&csi40 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			csi40_in: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&adv7482_txa>;
+			};
+		};
+	};
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -55,6 +94,49 @@
 	clock-frequency = <48000000>;
 };

+&i2c0 {
+	status = "okay";
+
+	video-receiver@70 {
+		compatible = "adi,adv7482";
+		reg = <0x70>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupt-parent = <&gpio0>;
+		interrupt-names = "intrq1", "intrq2";
+		interrupts = <7 IRQ_TYPE_LEVEL_LOW>,
+			     <17 IRQ_TYPE_LEVEL_LOW>;
+
+		port@7 {
+			reg = <7>;
+
+			adv7482_ain7: endpoint {
+				remote-endpoint = <&cvbs_con>;
+			};
+		};
+
+		port@8 {
+			reg = <8>;
+
+			adv7482_hdmi: endpoint {
+				remote-endpoint = <&hdmi_in_con>;
+			};
+		};
+
+		port@a {
+			reg = <0xa>;
+
+			adv7482_txa: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&csi40_in>;
+			};
+		};
+	};
+};
+
 &ohci0 {
 	status = "okay";
 };
@@ -94,6 +176,10 @@
 	status = "okay";
 };

+&vin4 {
+	status = "okay";
+};
+
 &xhci0 {
 	pinctrl-0 = <&usb30_pins>;
 	pinctrl-names = "default";
--
2.7.4
