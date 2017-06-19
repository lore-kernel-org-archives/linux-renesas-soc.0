Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:57307 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752631AbdFSRF2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 13:05:28 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v1 02/12] arm64: boot: dts: Salvator-X: Add VIN parallel input
Date: Mon, 19 Jun 2017 19:04:39 +0200
Message-Id: <1497891889-8038-3-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1497891889-8038-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add parallel video input port to VIN channel #4 and link it to camera
module remote endpoint.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index 41c94c3..b69fe4a 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
@@ -379,6 +379,29 @@
 
 &vin4 {
 	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ports{
+		port@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			reg = <2>;
+
+			vin4_in: endpoint@0 {
+				reg = <0>;
+
+				bus_width = <8>;
+				hsync-active = <1>;
+				vsync-active = <1>;
+				data-shift = <8>;
+
+				remote-endpoint = <&mt9m111_out>;
+			};
+		};
+	};
 };
 
 &vin5 {
-- 
2.7.4
