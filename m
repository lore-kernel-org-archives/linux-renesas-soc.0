Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:27297 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732699AbeHNQiB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Aug 2018 12:38:01 -0400
From: Ulrich Hecht <uli+renesas@fpond.eu>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PROTO][PATCH 10/10] arm64: dts: renesas: r8a77995-draak: add HDMI output
Date: Tue, 14 Aug 2018 15:50:04 +0200
Message-Id: <1534254604-24204-11-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu>
References: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Adds LVDS decoder, HDMI encoder and connector for Draak boards.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 84 ++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index bd5c6fa..157adf9 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -24,6 +24,41 @@
 		stdout-path = "serial0:115200n8";
 	};
 
+	lvds-decoder {
+		compatible = "thine,thc63lvd1024";
+		vcc-supply = <&reg_3p3v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				thc63lvd1024_in: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				thc63lvd1024_out: endpoint {
+					remote-endpoint = <&adv7511_in>;
+				};
+			};
+		};
+	};
+
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_out: endpoint {
+				remote-endpoint = <&adv7511_out>;
+			};
+		};
+	};
+
 	vga {
 		compatible = "vga-connector";
 
@@ -218,6 +253,43 @@
 
 	};
 
+	hdmi@39 {
+		compatible = "adi,adv7511w";
+		reg = <0x39>, <0x3f>, <0x38>, <0x3c>;
+		reg-names = "main", "edid", "packet", "cec";
+		interrupt-parent = <&gpio1>;
+		interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
+
+		/* Depends on LVDS */
+		max-clock = <135000000>;
+		min-vrefresh = <50>;
+
+		adi,input-depth = <8>;
+		adi,input-colorspace = "rgb";
+		adi,input-clock = "1x";
+		adi,input-style = <1>;
+		adi,input-justification = "evenly";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7511_in: endpoint {
+					remote-endpoint = <&thc63lvd1024_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7511_out: endpoint {
+					remote-endpoint = <&hdmi_con_out>;
+				};
+			};
+		};
+	};
+
 	hdmi-decoder@4c {
 		compatible = "adi,adv7612";
 		reg = <0x4c>;
@@ -283,6 +355,18 @@
 	};
 };
 
+&lvds0 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			lvds0_out: endpoint {
+				remote-endpoint = <&thc63lvd1024_in>;
+			};
+		};
+	};
+};
+
 &ehci0 {
 	status = "okay";
 };
-- 
2.7.4
