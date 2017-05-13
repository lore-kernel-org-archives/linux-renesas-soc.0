Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37490 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758792AbdEMXQ3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 13 May 2017 19:16:29 -0400
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 3A28A20754
        for <linux-renesas-soc@vger.kernel.org>; Sun, 14 May 2017 01:16:22 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 5/6] arm64: dts: renesas: r8a7795-salvator-x: Enable HDMI outputs
Date: Sun, 14 May 2017 02:16:17 +0300
Message-Id: <20170513231618.1715-6-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170513231618.1715-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170513231618.1715-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

Enable the HDMI encoders for the H3 Salvator-X board. The number of
encoders varies between the H3 and M3-W SoCs, so they can't be enabled
in the common salvator-x.dtsi file.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v4:

- Sort nodes alphabetically
- Move hdmi[01] nodes to r8a7795-salvator-x.dtsi
- Link the connectors to the encoders
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 2a5358b8f229..fcd9ca73f2c7 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -58,6 +58,40 @@
 	status = "okay";
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
+&hdmi1_con {
+	remote-endpoint = <&rcar_dw_hdmi1_out>;
+};
+
 &ohci2 {
 	status = "okay";
 };
-- 
Regards,

Laurent Pinchart
