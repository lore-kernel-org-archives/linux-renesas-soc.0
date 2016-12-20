Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:41469 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753970AbcLTBd4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Dec 2016 20:33:56 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Andy Yan <andy.yan@rock-chips.com>,
        Fabio Estevam <fabio.estevam@freescale.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Ulrich Hecht <ulrich.hecht@gmail.com>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        linux-renesas-soc@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Subject: [PATCH v2 28/29] arm64: dts: r8a7795: salvator-x: Enable HDMI outputs
Date: Tue, 20 Dec 2016 03:33:59 +0200
Message-Id: <20161220013400.28317-29-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
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
index 73a22b93f7b1..08554b4d7e86 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -147,6 +147,30 @@
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
 
@@ -190,6 +214,32 @@
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
