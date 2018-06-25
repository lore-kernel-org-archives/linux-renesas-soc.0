Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52231 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934232AbeFYOEB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jun 2018 10:04:01 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 04/29] arm64: dts: renesas: draak: Describe CVBS input
Date: Mon, 25 Jun 2018 16:02:59 +0200
Message-Id: <6a0942c20f5ca9bf203a20ab4a91c7b7dcd6a0c5.1529933747.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1529933747.git.horms+renesas@verge.net.au>
References: <cover.1529933747.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Jacopo Mondi <jacopo+renesas@jmondi.org>

Describe CVBS video input through analog video decoder ADV7180
connected to video input interface VIN4.

The video input signal path is shared with HDMI video input, and
selected by on-board switches SW-53 and SW-54 with CVBS input selected
by the default switches configuration.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 68 ++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index 9d1c33927064..a1b71c7d01b6 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -59,6 +59,16 @@
 		};
 	};
 
+	composite-in {
+		compatible = "composite-video-connector";
+
+		port {
+			composite_con_in: endpoint {
+				remote-endpoint = <&adv7180_in>;
+			};
+		};
+	};
+
 	memory@48000000 {
 		device_type = "memory";
 		/* first 128MB is reserved for secure area. */
@@ -148,6 +158,11 @@
 		groups = "usb0";
 		function = "usb0";
 	};
+
+	vin4_pins_cvbs: vin4 {
+		groups = "vin4_data8", "vin4_sync", "vin4_clk";
+		function = "vin4";
+	};
 };
 
 &i2c0 {
@@ -160,6 +175,39 @@
 		reg = <0x50>;
 		pagesize = <8>;
 	};
+
+	composite-in@20 {
+		compatible = "adi,adv7180cp";
+		reg = <0x20>;
+
+		port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7180_in: endpoint {
+					remote-endpoint = <&composite_con_in>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				/*
+				 * The VIN4 video input path is shared between
+				 * CVBS and HDMI inputs through SW[49-53]
+				 * switches.
+				 *
+				 * CVBS is the default selection, link it to
+				 * VIN4 here.
+				 */
+				adv7180_out: endpoint {
+					remote-endpoint = <&vin4_in>;
+				};
+			};
+		};
+	};
 };
 
 &i2c1 {
@@ -257,3 +305,23 @@
 	timeout-sec = <60>;
 	status = "okay";
 };
+
+&vin4 {
+	pinctrl-0 = <&vin4_pins_cvbs>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			vin4_in: endpoint {
+				remote-endpoint = <&adv7180_out>;
+			};
+		};
+	};
+};
-- 
2.11.0
