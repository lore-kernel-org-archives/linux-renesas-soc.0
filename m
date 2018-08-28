Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:33418 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727072AbeH1SHf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Aug 2018 14:07:35 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: v3hsk: Move lvds0 node
Date: Tue, 28 Aug 2018 16:15:40 +0200
Message-Id: <20180828141540.7193-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

To preserve alphabetical sort order.

Fixes: 4edac426aff11a37 ("arm64: dts: renesas: condor/v3hsk: add DU/LVDS/HDMI support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../arm64/boot/dts/renesas/r8a77980-v3hsk.dts | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
index 44ab7344f8aa4922..dd14a41b32cdf242 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
@@ -119,18 +119,6 @@
 	};
 };
 
-&lvds0 {
-	status = "okay";
-
-	ports {
-		port@1 {
-			lvds0_out: endpoint {
-				remote-endpoint = <&thc63lvd1024_in>;
-			};
-		};
-	};
-};
-
 &i2c0 {
 	pinctrl-0 = <&i2c0_pins>;
 	pinctrl-names = "default";
@@ -177,6 +165,18 @@
 	};
 };
 
+&lvds0 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			lvds0_out: endpoint {
+				remote-endpoint = <&thc63lvd1024_in>;
+			};
+		};
+	};
+};
+
 &pfc {
 	gether_pins: gether {
 		groups = "gether_mdio_a", "gether_rgmii",
-- 
2.17.1
