Return-Path: <devicetree-owner@vger.kernel.org>
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org,
        wsa@the-dreams.de, horms@verge.net.au, geert@linux-m68k.org,
        magnus.damm@gmail.com, chris.paterson2@renesas.com,
        ramesh.shanmugasundaram@bp.renesas.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 3/7] arm64: dts: r8a77995: Add CAN external clock support
Date: Fri, 17 Nov 2017 11:41:25 +0100
Message-Id: <1510915289-15059-4-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1510915289-15059-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1510915289-15059-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Adds external CAN clock node for r8a77995. This clock can be used as
fCAN clock of CAN and CAN FD controller.

Based on a patch for r8a7796 by Chris Paterson.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 788e3af..a8df296 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -51,6 +51,13 @@
 		clock-frequency = <0>;
 	};
 
+	/* External CAN clock - to be overridden by boards that provide it */
+	can_clk: can {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
 	scif_clk: scif {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-- 
2.7.4

