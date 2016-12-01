Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart+renesas@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Andy Yan <andy.yan@rock-chips.com>,
	Archit Taneja <architt@codeaurora.org>,
	Fabio Estevam <fabio.estevam@freescale.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mark Yao <mark.yao@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	Ulrich Hecht <ulrich.hecht@gmail.com>,
	Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 20/22] arm64: dts: r8a7795: Add HDMI encoder support
Date: Fri,  2 Dec 2016 01:43:35 +0200
Message-Id: <1480635817-1258-21-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Add DT nodes for the two HDMI encoders in disabled state.

Based on work by Koji Matsuoka.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 50 ++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 9b717dee1f7b..eceb62ee88df 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1590,11 +1590,13 @@
 				port@1 {
 					reg = <1>;
 					du_out_hdmi0: endpoint {
+						remote-endpoint = <&dw_hdmi0_in>;
 					};
 				};
 				port@2 {
 					reg = <2>;
 					du_out_hdmi1: endpoint {
+						remote-endpoint = <&dw_hdmi1_in>;
 					};
 				};
 				port@3 {
@@ -1604,5 +1606,53 @@
 				};
 			};
 		};
+
+		hdmi0: hdmi0@fead0000 {
+			compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
+			reg = <0 0xfead0000 0 0x10000>;
+			interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A7795_CLK_S0D4>, <&cpg CPG_MOD 729>;
+			clock-names = "iahb", "isfr";
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					dw_hdmi0_in: endpoint {
+						remote-endpoint = <&du_out_hdmi0>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		hdmi1: hdmi1@feae0000 {
+			compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
+			reg = <0 0xfeae0000 0 0x10000>;
+			interrupts = <0 436 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A7795_CLK_S0D4>, <&cpg CPG_MOD 728>;
+			clock-names = "iahb", "isfr";
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					dw_hdmi1_in: endpoint {
+						remote-endpoint = <&du_out_hdmi1>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
 	};
 };
-- 
Regards,

Laurent Pinchart
