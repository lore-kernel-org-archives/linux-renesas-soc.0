Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36128 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753690AbeCPOwf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 10:52:35 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 44/69] arm64: dts: renesas: r8a77965: Add #address-cells and #size-cells
Date: Fri, 16 Mar 2018 15:51:14 +0100
Message-Id: <ba8b5ad0afdda734001176f59d23a4ab31e61e7a.1521206129.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1521206129.git.horms+renesas@verge.net.au>
References: <cover.1521206129.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Jacopo Mondi <jacopo+renesas@jmondi.org>

Add "#address-cells" and "#size-cells" properties to all place-holder nodes
that have children nodes defined by salvator-x[s].dtsi device tree.

This silences the following DTC compiler warnings:
Warning (reg_format): "reg" property in /soc/.. has invalid length (4 bytes)
(#address-cells == 2, #size-cells == 1)
Warning (avoid_default_addr_size): Relying on default #address-cells
value for /soc/...
Warning (avoid_default_addr_size): Relying on default #size-cells value
for /soc/...

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 4286453ba92d..61efb2d22257 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -521,6 +521,9 @@
 		};
 
 		avb: ethernet@e6800000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			reg = <0 0xe6800000 0 0x800>, <0 0xe6a00000 0 0x10000>;
 			/* placeholder */
 		};
@@ -528,11 +531,21 @@
 		csi20: csi2@fea80000 {
 			reg = <0 0xfea80000 0 0x10000>;
 			/* placeholder */
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		csi40: csi2@feaa0000 {
 			reg = <0 0xfeaa0000 0 0x10000>;
 			/* placeholder */
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		vin0: video@e6ef0000 {
@@ -611,6 +624,9 @@
 		};
 
 		i2c2: i2c@e6510000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			reg = <0 0xe6510000 0 0x40>;
 			/* placeholder */
 		};
@@ -621,6 +637,9 @@
 		};
 
 		i2c4: i2c@e66d8000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			reg = <0 0xe66d8000 0 0x40>;
 			/* placeholder */
 		};
@@ -636,6 +655,9 @@
 		};
 
 		i2c_dvfs: i2c@e60b0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			reg = <0 0xe60b0000 0 0x425>;
 			/* placeholder */
 		};
@@ -681,6 +703,9 @@
 			/* placeholder */
 
 			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				port@0 {
 					reg = <0>;
 					du_out_rgb: endpoint {
-- 
2.11.0
