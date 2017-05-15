Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:58896 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751614AbdEOMWs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2017 08:22:48 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] arm64: dts: r8a7795: salvator-x: Move HDMI0 to common Salvator-X board support
Date: Mon, 15 May 2017 14:22:44 +0200
Message-Id: <1494850964-7246-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1494850964-7246-1-git-send-email-geert+renesas@glider.be>
References: <1494850964-7246-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The extensions to the first HDMI device and connector nodes apply to
Salvator-X boards equipped with either an R-Car H3 or M3-W SoC.
Hence move them from the R-Car H3 specific board file to the common
Salvator-X board file.

The second HDMI device and connector nodes are left as-is, as R-Car M3-W
has only one HDMI output.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 17 -----------------
 arch/arm64/boot/dts/renesas/salvator-x.dtsi        | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index fcd9ca73f2c76768..22e5324e7ada0eea 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -58,23 +58,6 @@
 	status = "okay";
 };
 
-&hdmi0 {
-	status = "okay";
-
-	ports {
-		port@1 {
-			reg = <1>;
-			rcar_dw_hdmi0_out: endpoint {
-				remote-endpoint = <&hdmi0_con>;
-			};
-		};
-	};
-};
-
-&hdmi0_con {
-	remote-endpoint = <&rcar_dw_hdmi0_out>;
-};
-
 &hdmi1 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/renesas/salvator-x.dtsi b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
index 5f0d4bdcd3b44aae..1f6b9fbb13af1ebf 100644
--- a/arch/arm64/boot/dts/renesas/salvator-x.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
@@ -294,6 +294,23 @@
 	clock-frequency = <32768>;
 };
 
+&hdmi0 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			reg = <1>;
+			rcar_dw_hdmi0_out: endpoint {
+				remote-endpoint = <&hdmi0_con>;
+			};
+		};
+	};
+};
+
+&hdmi0_con {
+	remote-endpoint = <&rcar_dw_hdmi0_out>;
+};
+
 &hsusb {
 	status = "okay";
 };
-- 
2.7.4
