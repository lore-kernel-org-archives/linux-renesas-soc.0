Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:34382 "EHLO
	mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161249AbcE3QBN (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 30 May 2016 12:01:13 -0400
Received: by mail-lf0-f67.google.com with SMTP id 65so14285168lfq.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 May 2016 09:01:12 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: kuninori.morimoto.gx@renesas.com,
	laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
	architt@codeaurora.org, vz@mleia.com, koji.matsuoka.xm@renesas.com,
	Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [RFC 18/21] arm64: dts: salvator-x: Add DU pins, HDMI connectors and encoder
Date: Mon, 30 May 2016 18:00:17 +0200
Message-Id: <1464624020-27709-19-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

Based on work by Koji Matsuoka.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
[geert: Re-add removed extal_clk]
[geert: Modify existing du node instead of moving it around]
[geert: Use generic pinctrl properties]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 107 +++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index f8e4e33..c09ead3 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -169,17 +169,119 @@
 			};
 		};
 	};
+
+	hdmi0-encoder {
+		compatible = "rockchip,rcar-dw-hdmi";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+				rcar_dw_hdmi0_in: endpoint {
+					remote-endpoint = <&du_out_hdmi0>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				rcar_dw_hdmi0_out: endpoint {
+					remote-endpoint = <&hdmi0_con>;
+				};
+			};
+		};
+	};
+
+	hdmi0-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi0_con: endpoint {
+				remote-endpoint = <&rcar_dw_hdmi0_out>;
+			};
+		};
+	};
+
+	hdmi1-encoder {
+		compatible = "rockchip,rcar-dw-hdmi";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+				rcar_dw_hdmi1_in: endpoint {
+					remote-endpoint = <&du_out_hdmi1>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				rcar_dw_hdmi1_out: endpoint {
+					remote-endpoint = <&hdmi1_con>;
+				};
+			};
+		};
+	};
+
+	hdmi1-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi1_con: endpoint {
+				remote-endpoint = <&rcar_dw_hdmi1_out>;
+			};
+		};
+	};
+
+	programable_clk0: clock_out0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <148500000>;
+	};
+
+	x21_clk: x21-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <33000000>;
+	};
+
+	x22_clk: x22-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <33000000>;
+	};
+
+	programable_clk1: clock_out1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <108000000>;
+	};
 };
 
 &du {
+	pinctrl-0 = <&du_pins>;
+	pinctrl-names = "default";
 	status = "okay";
 
+	backlight = <&gpio6 7 GPIO_ACTIVE_HIGH>;
+
 	ports {
 		port@0 {
 			endpoint {
 				remote-endpoint = <&adv7123_in>;
 			};
 		};
+		port@1 {
+			endpoint {
+				remote-endpoint = <&rcar_dw_hdmi0_in>;
+			};
+		};
+		port@2 {
+			endpoint {
+				remote-endpoint = <&rcar_dw_hdmi1_in>;
+			};
+		};
 	};
 };
 
@@ -256,6 +358,11 @@
 		groups = "usb2";
 		function = "usb2";
 	};
+
+	du_pins: du {
+		groups = "du_rgb888", "du_sync", "du_clk_out_0", "du_disp";
+		function = "du";
+	};
 };
 
 &scif1 {
-- 
2.7.4
