Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:33762 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750968AbdEOMWs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2017 08:22:48 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] arm64: dts: r8a7796: Add placeholder for HDMI device
Date: Mon, 15 May 2017 14:22:43 +0200
Message-Id: <1494850964-7246-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1494850964-7246-1-git-send-email-geert+renesas@glider.be>
References: <1494850964-7246-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add an empty device node with ports boilerplate serving as a placeholder
for the HDMI device.  HDMI is not yet supported and/or tested on R-Car
M3-W, but is supported and used on Salvator-X boards with an R-Car H3
SoC.  Hence a placeholder will allow common board support to refer to
it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index b418a66f4ceccb90..892d956d1b1b565c 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1428,6 +1428,15 @@
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
 		du: display@feb00000 {
 			/* placeholder */
 
-- 
2.7.4
