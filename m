Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:57763 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751646AbdEJHFE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2017 03:05:04 -0400
Received: from avalon.ideasonboard.com (syi-ogw1-1554.syi.inet.fi [194.89.38.18])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 016362050B
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 May 2017 09:03:56 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 3/7] arm64: dts: renesas: salvator-x: Enable HDMI outputs
Date: Wed, 10 May 2017 10:04:54 +0300
Message-Id: <20170510070458.21193-4-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170510070458.21193-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170510070458.21193-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

Instantiate the HDMI connectors and enable the encoders.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/salvator-x.dtsi | 50 +++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-x.dtsi b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
index d5eb022d247c..2cd0cce818e7 100644
--- a/arch/arm64/boot/dts/renesas/salvator-x.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
@@ -151,6 +151,30 @@
 			  1800000 0>;
 	};
 
+	hdmi0-out {
+		compatible = "hdmi-connector";
+		label = "HDMI0 OUT";
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
+		label = "HDMI1 OUT";
+		type = "a";
+
+		port {
+			hdmi1_con: endpoint {
+				remote-endpoint = <&rcar_dw_hdmi1_out>;
+			};
+		};
+	};
+
 	vga {
 		compatible = "vga-connector";
 
@@ -243,6 +267,32 @@
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
+&hdmi1 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			reg = <1>;
+			rcar_dw_hdmi1_out: endpoint {
+				remote-endpoint = <&hdmi1_con>;
+			};
+		};
+	};
+};
+
 &hsusb {
 	status = "okay";
 };
-- 
Regards,

Laurent Pinchart
