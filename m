Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44354 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752316AbdGaPUx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 11:20:53 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 29/38] ARM: dts: r7s72100: Add pin controller node
Date: Mon, 31 Jul 2017 17:19:41 +0200
Message-Id: <0d69caa69854b5e59f8079b835e55f725b9e3313.1501514100.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1501514100.git.horms+renesas@verge.net.au>
References: <cover.1501514100.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Jacopo Mondi <jacopo+renesas@jmondi.org>

Add pin controller node with 12 gpio controller sub-nodes to
r7s72100 dtsi.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s72100.dtsi | 78 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 5cf53e9943af..4ed12a4d9d51 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -207,6 +207,84 @@
 		};
 	};
 
+	pinctrl: pin-controller@fcfe3000 {
+		compatible = "renesas,r7s72100-ports";
+
+		reg = <0xfcfe3000 0x4230>;
+
+		port0: gpio-0 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 6>;
+		};
+
+		port1: gpio-1 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 16 16>;
+		};
+
+		port2: gpio-2 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 32 16>;
+		};
+
+		port3: gpio-3 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 48 16>;
+		};
+
+		port4: gpio-4 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 64 16>;
+		};
+
+		port5: gpio-5 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 80 11>;
+		};
+
+		port6: gpio-6 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 96 16>;
+		};
+
+		port7: gpio-7 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 112 16>;
+		};
+
+		port8: gpio-8 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 128 16>;
+		};
+
+		port9: gpio-9 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 144 8>;
+		};
+
+		port10: gpio-10 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 160 16>;
+		};
+
+		port11: gpio-11 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 176 16>;
+		};
+	};
+
 	scif0: serial@e8007000 {
 		compatible = "renesas,scif-r7s72100", "renesas,scif";
 		reg = <0xe8007000 64>;
-- 
2.1.4
