Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37491 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758755AbdEMXQ1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 13 May 2017 19:16:27 -0400
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id A2109204C1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 14 May 2017 01:16:21 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 3/6] arm64: dts: renesas: salvator-x: Add HDMI output connectors
Date: Sun, 14 May 2017 02:16:15 +0300
Message-Id: <20170513231618.1715-4-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170513231618.1715-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170513231618.1715-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The Salvator-X board has two HDMI output connectors. Add them to the
common salvator-x.dtsi.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v4:

- Split connectors to a new patch
---
 arch/arm64/boot/dts/renesas/salvator-x.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-x.dtsi b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
index 3fc60ba41229..3434c7552fcc 100644
--- a/arch/arm64/boot/dts/renesas/salvator-x.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
@@ -151,6 +151,28 @@
 			  1800000 0>;
 	};
 
+	hdmi0-out {
+		compatible = "hdmi-connector";
+		label = "HDMI0 OUT";
+		type = "a";
+
+		port {
+			hdmi0_con: endpoint {
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
+			};
+		};
+	};
+
 	vga {
 		compatible = "vga-connector";
 
-- 
Regards,

Laurent Pinchart
