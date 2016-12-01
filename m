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
Subject: [PATCH 22/22] arm64: dts: r8a7795: salvator-x: Add DU1 and DU2 external dot clocks
Date: Fri,  2 Dec 2016 01:43:37 +0200
Message-Id: <1480635817-1258-23-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

The DU1 and DU2 external dot clocks are fixed frequency clock generators
running at 33MHz.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 08554b4d7e86..b6dc6f5188d6 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -147,6 +147,19 @@
 		};
 	};
 
+	/* External DU dot clocks */
+	x21_clk: x21-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <33000000>;
+	};
+
+	x22_clk: x22-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <33000000>;
+	};
+
 	hdmi0-out {
 		compatible = "hdmi-connector";
 		label = "HDMI0 OUT";
@@ -245,6 +258,16 @@
 	pinctrl-names = "default";
 	status = "okay";
 
+	clocks = <&cpg CPG_MOD 724>,
+		 <&cpg CPG_MOD 723>,
+		 <&cpg CPG_MOD 722>,
+		 <&cpg CPG_MOD 721>,
+		 <&cpg CPG_MOD 727>,
+		 <&x21_clk>,
+		 <&x22_clk>;
+	clock-names = "du.0", "du.1", "du.2", "du.3", "lvds.0",
+		      "dclkin.1", "dclkin.2";
+
 	ports {
 		port@0 {
 			endpoint {
-- 
Regards,

Laurent Pinchart
