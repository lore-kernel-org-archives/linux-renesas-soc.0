Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:34356 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754442AbdG3U5p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 30 Jul 2017 16:57:45 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [RFC 5/5] arm64: dts: renesas: salvator-x: Add ADV7482 support
Date: Sun, 30 Jul 2017 22:56:51 +0200
Message-Id: <20170730205651.6478-6-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20170730205651.6478-1-niklas.soderlund+renesas@ragnatech.se>
References: <20170730205651.6478-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The Salvator boards use an ADV7482 receiver for HDMI and CVBS inputs.

Provide ADV7482 node on the i2c4 bus, along with connectors for the
hdmi and cvbs inputs, and link to the csi20 and csi40 nodes as outputs.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 103 +++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index bba4976bee619d42..30a669f842573474 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -65,6 +65,29 @@
 		enable-gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;
 	};
 
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
 	reg_1p8v: regulator0 {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
@@ -257,6 +280,37 @@
 	};
 };
 
+&csi20 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+			csi20_in: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1>;
+				remote-endpoint = <&adv7482_txb>;
+			};
+		};
+	};
+};
+
+&csi40 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			csi40_in: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&adv7482_txa>;
+			};
+		};
+	};
+};
+
 &du {
 	pinctrl-0 = <&du_pins>;
 	pinctrl-names = "default";
@@ -343,6 +397,55 @@
 
 		shunt-resistor-micro-ohms = <5000>;
 	};
+
+	video-receiver@70 {
+		compatible = "adi,adv7482";
+		reg = <0x70>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupt-parent = <&gpio6>;
+		interrupt-names = "intrq1", "intrq2";
+		interrupts = <30 IRQ_TYPE_LEVEL_LOW>,
+			     <31 IRQ_TYPE_LEVEL_LOW>;
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
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csi40_in>;
+			};
+		};
+
+		port@11 {
+			reg = <11>;
+
+			adv7482_txb: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1>;
+				remote-endpoint = <&csi20_in>;
+			};
+		};
+	};
 };
 
 &i2c_dvfs {
-- 
2.13.3
