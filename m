Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:36126 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752662AbdFSRFc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 13:05:32 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v1 01/12] arm64: boot: dts: salvator-x: Add camera module
Date: Mon, 19 Jun 2017 19:04:38 +0200
Message-Id: <1497891889-8038-2-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add camera module to Salvator-X M3W device tree.
The camera module sits on a i2c-gpio interface and it connected to VIN
channel #4 parallel video input port.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index ca4eb98..41c94c3 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
@@ -103,6 +103,41 @@
 		states = <3300000 1
 			  1800000 0>;
 	};
+
+	camera_module {
+		compatible = "i2c-gpio";
+		gpios = <&gpio1 9 GPIO_ACTIVE_HIGH
+			 &gpio1 11 GPIO_ACTIVE_HIGH
+			>;
+
+		i2c-gpio,delay-us = <4>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mclk: xclk {
+			compatible = "fixed-clock";
+			#clock-cells = <1>;
+			clock-frequency  = <27000000>;
+			clock-output-names = "mclk";
+		};
+
+		camera: mt9m111@48 {
+			compatible = "micron,mt9m111";
+			reg = <0x48>;
+
+			clocks = <&mclk 0>;
+			clock-names = "mclk";
+
+			port {
+				mt9m111_out: endpoint {
+					bus_width = <8>;
+					remote-endpoint = <&vin4_in>;
+				};
+			};
+		};
+	};
+
 };
 
 &pfc {
-- 
2.7.4
