Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:57762 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751756AbdEJHFE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2017 03:05:04 -0400
Received: from avalon.ideasonboard.com (syi-ogw1-1554.syi.inet.fi [194.89.38.18])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 5A749203A2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 May 2017 09:03:56 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 2/7] arm64: dts: r8a7796: Add display placeholders
Date: Wed, 10 May 2017 10:04:53 +0300
Message-Id: <20170510070458.21193-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170510070458.21193-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170510070458.21193-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

HDMI output and panel backlight for Salvator-X will be enabled for both
the H3 and M3-W boards in salvator-x.dtsi. The file will need to
reference SoC DT nodes that are not available for M3-W yet. Add
placeholders to avoid breaking compilation.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 60a4289d0b14..60d12e418f66 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -510,6 +510,10 @@
 			status = "disabled";
 		};
 
+		pwm1: pwm@e6e31000 {
+			/* placeholder */
+		};
+
 		can0: can@e6c30000 {
 			compatible = "renesas,can-r8a7796",
 				     "renesas,rcar-gen3-can";
@@ -1131,6 +1135,24 @@
 			/* placeholder */
 		};
 
+		hdmi0: hdmi0@fead0000 {
+			/* placeholder */
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		hdmi1: hdmi1@feae0000 {
+			/* placeholder */
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		du: display@feb00000 {
 			/* placeholder */
 
-- 
Regards,

Laurent Pinchart
