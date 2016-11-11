Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35253 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934392AbcKKRIP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Nov 2016 12:08:15 -0500
Received: by mail-wm0-f65.google.com with SMTP id a20so10775725wme.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Nov 2016 09:08:14 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org
Cc: kuninori.morimoto.gx@renesas.com, geert@linux-m68k.org,
        airlied@linux.ie, koji.matsuoka.xm@renesas.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 08/10] arm64: dts: salvator-x: Add DU pins, HDMI connectors and encoder
Date: Fri, 11 Nov 2016 18:07:44 +0100
Message-Id: <1478884066-1090-9-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1478884066-1090-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1478884066-1090-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

Based on work by Koji Matsuoka.

[geert: Re-add removed extal_clk]
[geert: Modify existing du node instead of moving it around]
[geert: Use generic pinctrl properties]
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 95 ++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index b1eab68..3c783dd 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -178,6 +178,44 @@
 			};
 		};
 	};
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
+};
+
+&programmable_clk0 {
+	clock-frequency = <148500000>;
+};
+
+&x21_clk {
+	clock-frequency = <33000000>;
+};
+
+&x22_clk {
+	clock-frequency = <33000000>;
+};
+
+&programmable_clk1 {
+	clock-frequency = <108000000>;
 };
 
 &du {
@@ -191,6 +229,58 @@
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
+	};
+};
+
+&hdmi0 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			rcar_dw_hdmi0_in: endpoint {
+				remote-endpoint = <&du_out_hdmi0>;
+			};
+		};
+		port@1 {
+			reg = <1>;
+			rcar_dw_hdmi0_out: endpoint {
+				remote-endpoint = <&hdmi0_con>;
+			};
+		};
+	};
+};
+
+&hdmi1 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			rcar_dw_hdmi1_in: endpoint {
+				remote-endpoint = <&du_out_hdmi1>;
+			};
+		};
+		port@1 {
+			reg = <1>;
+			rcar_dw_hdmi1_out: endpoint {
+				remote-endpoint = <&hdmi1_con>;
+			};
+		};
 	};
 };
 
@@ -269,6 +359,11 @@
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
