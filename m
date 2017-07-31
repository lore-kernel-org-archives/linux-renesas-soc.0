Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44354 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752398AbdGaPUh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 11:20:37 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 30/38] ARM: dts: genmai: Add SCIF2 pin group
Date: Mon, 31 Jul 2017 17:19:42 +0200
Message-Id: <177f8744b960ce9a3a5a4086722bb468c01cdc66.1501514100.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1501514100.git.horms+renesas@verge.net.au>
References: <cover.1501514100.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Jacopo Mondi <jacopo+renesas@jmondi.org>

Add pin configuration subnode for SCIF2 serial debug interface.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s72100-genmai.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
index b0db621ff176..12306ff18353 100644
--- a/arch/arm/boot/dts/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/r7s72100-genmai.dts
@@ -11,6 +11,7 @@
 
 /dts-v1/;
 #include "r7s72100.dtsi"
+#include <dt-bindings/pinctrl/r7s72100-pinctrl.h>
 
 / {
 	model = "Genmai";
@@ -36,6 +37,14 @@
 	};
 };
 
+&pinctrl {
+
+	scif2_pins: serial2 {
+		/* P3_0 as TxD2; P3_2 as RxD2 */
+		pinmux = <RZA1_PINMUX(3, 0, 6)>, <RZA1_PINMUX(3, 2, 4)>;
+	};
+};
+
 &extal_clk {
 	clock-frequency = <13330000>;
 };
@@ -68,6 +77,9 @@
 };
 
 &scif2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&scif2_pins>;
+
 	status = "okay";
 };
 
-- 
2.1.4
