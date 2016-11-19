Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:55160 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752505AbcKSD2I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 22:28:08 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 03/13] devicetree/bindings: display: Add bindings for two Mitsubishi panels
Date: Sat, 19 Nov 2016 05:28:03 +0200
Message-Id: <1479526093-7014-4-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The AA104XD12 and AA121TD01 are LVDS display panels. Their bindings are
modelled on the the LVS panel bindings.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../display/panel/mitsubishi,aa104xd12.txt         | 47 ++++++++++++++++++++++
 .../display/panel/mitsubishi,aa121td01.txt         | 47 ++++++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.txt

diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.txt b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.txt
new file mode 100644
index 000000000000..ced0121aed7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.txt
@@ -0,0 +1,47 @@
+Mitsubishi AA204XD12 LVDS Display Panel
+=======================================
+
+The AA104XD12 is a 10.4" XGA TFT-LCD display panel.
+
+These DT bindings follow the LVDS panel bindings defined in panel-lvds.txt
+with the following device-specific properties.
+
+
+Required properties:
+
+- compatible: Shall contain "mitsubishi,aa121td01" and "panel-lvds", in that
+  order.
+- vcc-supply: Reference to the regulator powering the panel VCC pins.
+
+
+Example
+-------
+
+panel {
+	compatible = "mitsubishi,aa104xd12", "panel-lvds";
+	vcc-supply = <&vcc_3v3>;
+
+	width-mm = <210>;
+	height-mm = <158>;
+
+	data-mapping = "jeida-24";
+
+	panel-timing {
+		/* 1024x768 @65Hz */
+		clock-frequency = <65000000>;
+		hactive = <1024>;
+		vactive = <768>;
+		hsync-len = <136>;
+		hfront-porch = <20>;
+		hback-porch = <160>;
+		vfront-porch = <3>;
+		vback-porch = <29>;
+		vsync-len = <6>;
+	};
+
+	port {
+		panel_in: endpoint {
+			remote-endpoint = <&lvds_encoder>;
+		};
+	};
+};
diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.txt b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.txt
new file mode 100644
index 000000000000..d6e1097504fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.txt
@@ -0,0 +1,47 @@
+Mitsubishi AA121TD01 LVDS Display Panel
+=======================================
+
+The AA121TD01 is a 12.1" WXGA TFT-LCD display panel.
+
+These DT bindings follow the LVDS panel bindings defined in panel-lvds.txt
+with the following device-specific properties.
+
+
+Required properties:
+
+- compatible: Shall contain "mitsubishi,aa121td01" and "panel-lvds", in that
+  order.
+- vcc-supply: Reference to the regulator powering the panel VCC pins.
+
+
+Example
+-------
+
+panel {
+	compatible = "mitsubishi,aa121td01", "panel-lvds";
+	vcc-supply = <&vcc_3v3>;
+
+	width-mm = <261>;
+	height-mm = <163>;
+
+	data-mapping = "jeida-24";
+
+	panel-timing {
+		/* 1280x800 @60Hz */
+		clock-frequency = <71000000>;
+		hactive = <1280>;
+		vactive = <800>;
+		hsync-len = <70>;
+		hfront-porch = <20>;
+		hback-porch = <70>;
+		vsync-len = <5>;
+		vfront-porch = <3>;
+		vback-porch = <15>;
+	};
+
+	port {
+		panel_in: endpoint {
+			remote-endpoint = <&lvds_encoder>;
+		};
+	};
+};
-- 
Regards,

Laurent Pinchart
