Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f170.google.com ([209.85.192.170]:39762 "EHLO
        mail-pf0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937365AbeFSPRl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jun 2018 11:17:41 -0400
Received: by mail-pf0-f170.google.com with SMTP id r11-v6so21048pfl.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jun 2018 08:17:41 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Wed, 20 Jun 2018 00:19:19 +0900
Message-Id: <152942155999.28480.10752587080512094478.sendpatchset@little-apple>
In-Reply-To: <152942152672.28480.665572564123111170.sendpatchset@little-apple>
References: <152942152672.28480.665572564123111170.sendpatchset@little-apple>
Subject: [PATCH 03/04] arm64: dts: renesas: ebisu: add adv7482 support
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add experimental support for ADV7482 on the r8a77990 Ebisu board.

Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts |   91 ++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ work/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts	2018-06-19 21:14:13.230607110 +0900
@@ -28,6 +28,30 @@
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
+
 };
 
 &avb {
@@ -47,6 +71,65 @@
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
+		port@10 {
+			reg = <10>;
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
 &extal_clk {
 	clock-frequency = <48000000>;
 };
@@ -63,3 +146,11 @@
 &scif2 {
 	status = "okay";
 };
+
+&vin4 {
+	status = "okay";
+};
+
+&vin5 {
+	status = "okay";
+};
