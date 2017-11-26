Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:45492 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751865AbdKZAu3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 25 Nov 2017 19:50:29 -0500
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/3] arm64: dts: renesas: eagle: expansion: enable and connect CSI40
Date: Sun, 26 Nov 2017 01:50:11 +0100
Message-Id: <20171126005012.22573-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20171126005012.22573-1-niklas.soderlund+renesas@ragnatech.se>
References: <20171126005012.22573-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On the extension board CSI40 is connected to the adv7482.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../boot/dts/renesas/r8a77970-eagle-expansion.dtsi     | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle-expansion.dtsi b/arch/arm64/boot/dts/renesas/r8a77970-eagle-expansion.dtsi
index e3dc5c32433014c9..565008595a6ce81b 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle-expansion.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle-expansion.dtsi
@@ -44,6 +44,22 @@
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
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&adv7482_txa>;
+			};
+		};
+	};
+};
+
 &i2c0 {
 	/* GPIO Expander@27:
 	 *   IO.0: ROUTE_I2C_ENn
@@ -94,7 +110,7 @@
 			adv7482_txa: endpoint {
 				clock-lanes = <0>;
 				data-lanes = <1 2 3 4>;
-				// remote-endpoint = <&csi40_in>;
+				remote-endpoint = <&csi40_in>;
 			};
 		};
 	};
-- 
2.15.0
