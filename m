Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:36599 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932289AbcHIM3M (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 9 Aug 2016 08:29:12 -0400
Received: from avalon.bb.dnainternet.fi (85-23-193-79.bb.dnainternet.fi [85.23.193.79])
	by galahad.ideasonboard.com (Postfix) with ESMTPSA id B2552208BF
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Aug 2016 14:28:57 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: renesas: salvator-x: Enable DU
Date: Tue,  9 Aug 2016 15:29:12 +0300
Message-Id: <1470745752-23738-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1470745752-23738-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1470745752-23738-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Only the VGA output is supported for now.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 98f02631a0f0..8f916c52f261 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -135,6 +135,50 @@
 			sound-dai = <&ak4613>;
 		};
 	};
+
+	vga-encoder {
+		compatible = "adi,adv7123";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7123_in: endpoint {
+					remote-endpoint = <&du_out_rgb>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				adv7123_out: endpoint {
+					remote-endpoint = <&vga_in>;
+				};
+			};
+		};
+	};
+
+	vga {
+		compatible = "vga-connector";
+
+		port {
+			vga_in: endpoint {
+				remote-endpoint = <&adv7123_out>;
+			};
+		};
+	};
+};
+
+&du {
+	status = "okay";
+
+	ports {
+		port@0 {
+			endpoint {
+				remote-endpoint = <&adv7123_in>;
+			};
+		};
+	};
 };
 
 &extal_clk {
-- 
Regards,

Laurent Pinchart
