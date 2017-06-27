Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:46928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753116AbdF0PPq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Jun 2017 11:15:46 -0400
From: Kieran Bingham <kbingham@kernel.org>
To: niklas.soderlund@ragnatech.se
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCHv6] arm64: dts: renesas: salvator-x: Add ADV7482 support
Date: Tue, 27 Jun 2017 16:15:41 +0100
Message-Id: <1498576541-15384-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The Salvator boards use an ADV7482 receiver for HDMI and CVBS inputs.

Provide ADV7482 node on the i2c4 bus, along with connectors for the
hdmi and cvbs inputs, and link to the csi20 and csi40 nodes as outputs.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---

Submitting this directly to Niklas, as these changes depend on his VIN
DT patches, and has agreed to 'take' this patch on to that series.


v4:
 - dt: Rebase to dts/renesas/salvator-x.dtsi
 - dt: Use AIN0-7 rather than AIN1-8

v5:
 - dt: Move to salvator-common.dtsi

v6:
 - remove unnecessary address-cells and size-cells configuration
 - merge connectors into their respective nodes.
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 103 +++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index aef35e0b685a..4b7eb0c2ec6b 100644
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
2.7.4
