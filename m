Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60050 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752500AbdCFA3k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Mar 2017 19:29:40 -0500
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id E1E632034A
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Mar 2017 01:18:54 +0100 (CET)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 2/5] arm64: dts: r8a7795: salvator-x: Enable HDMI outputs
Date: Mon,  6 Mar 2017 02:20:23 +0200
Message-Id: <20170306002026.15066-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170306002026.15066-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170306002026.15066-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

Instantiate the HDMI connectors and enable the encoders.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 7a8986edcdc0..e855e9572685 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -165,6 +165,30 @@
 		};
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
 	vga-encoder {
 		compatible = "adi,adv7123";
 
@@ -198,6 +222,32 @@
 	};
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
 &du {
 	pinctrl-0 = <&du_pins>;
 	pinctrl-names = "default";
-- 
Regards,

Laurent Pinchart
