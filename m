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
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 15/22] dt-bindings: display: renesas: Add R-Car Gen3 HDMI TX DT bindings
Date: Fri,  2 Dec 2016 01:43:30 +0200
Message-Id: <1480635817-1258-16-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

The Renesas R-Car Gen3 SoCs use a Synopsys DWC HDMI TX encoder IP. Add
corresponding device tree bindings based on the DWC HDMI TX bindings
model.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../bindings/display/bridge/renesas,dw-hdmi.txt    | 75 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
new file mode 100644
index 000000000000..f6b3f36d422b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
@@ -0,0 +1,75 @@
+Renesas Gen3 DWC HDMI TX Encoder
+================================
+
+The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
+with a companion PHY IP.
+
+These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
+Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt with the
+following device-specific properties.
+
+
+Required properties:
+
+- compatible : Shall contain one or more of
+  - "renesas,r8a7795-hdmi" for R8A7795 (R-Car H3) compatible HDMI TX
+  - "renesas,rcar-gen3-hdmi" for the generic R-Car Gen3 compatible HDMI TX
+
+    When compatible with generic versions, nodes must list the SoC-specific
+    version corresponding to the platform first, followed by the
+    family-specific version.
+
+- reg: See dw_hdmi.txt.
+- interrupts: HDMI interrupt number
+- clocks: See dw_hdmi.txt.
+- clock-names: Shall contain "iahb" and "isfr" as defined in dw_hdmi.txt.
+- ports: See dw_hdmi.txt. The DWC HDMI shall have one port numbered 0
+  corresponding to the video input of the controller and one port numbered 1
+  corresponding to its HDMI output. Each port shall have a single endpoint.
+
+Optional properties:
+
+- power-domains: Shall reference the power domain that contains the DWC HDMI,
+  if any.
+
+
+Example:
+
+	hdmi0: hdmi0@fead0000 {
+		compatible = "renesas,r8a7795-dw-hdmi";
+		reg = <0 0xfead0000 0 0x10000>;
+		interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cpg CPG_CORE R8A7795_CLK_S0D4>, <&cpg CPG_MOD 729>;
+		clock-names = "iahb", "isfr";
+		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+				dw_hdmi0_in: endpoint {
+					remote-endpoint = <&du_out_hdmi0>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				rcar_dw_hdmi0_out: endpoint {
+					remote-endpoint = <&hdmi0_con>;
+				};
+			};
+		};
+	};
+
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 30c873192458..a513fda157d0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4231,6 +4231,7 @@ S:	Supported
 F:	drivers/gpu/drm/rcar-du/
 F:	drivers/gpu/drm/shmobile/
 F:	include/linux/platform_data/shmob_drm.h
+F:	Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
 F:	Documentation/devicetree/bindings/display/renesas,du.txt
 
 DRM DRIVER FOR QXL VIRTUAL GPU
-- 
Regards,

Laurent Pinchart
