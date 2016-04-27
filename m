Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41885 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750811AbcD0EU3 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 27 Apr 2016 00:20:29 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/2] arm64: dts: r8a7795: Add SYSC PM Domains
Date: Wed, 27 Apr 2016 14:20:14 +1000
Message-Id: <abbecab1a0b8c2cc07edc30c8bced855ca4e239d.1461730364.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1461730364.git.horms+renesas@verge.net.au>
References: <cover.1461730364.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Add a device node for the System Controller.
Hook up the Cortex-A57 CPU cores and the Cortex-A57 and Cortex A53 L2
caches/SCUs to their respective PM Domains.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 7cb2d72e7378..f96d0732b2a8 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/r8a7795-sysc.h>
 
 / {
 	compatible = "renesas,r8a7795";
@@ -39,6 +40,7 @@
 			compatible = "arm,cortex-a57", "arm,armv8";
 			reg = <0x0>;
 			device_type = "cpu";
+			power-domains = <&sysc R8A7795_PD_CA57_CPU0>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
 		};
@@ -47,6 +49,7 @@
 			compatible = "arm,cortex-a57","arm,armv8";
 			reg = <0x1>;
 			device_type = "cpu";
+			power-domains = <&sysc R8A7795_PD_CA57_CPU1>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
 		};
@@ -54,6 +57,7 @@
 			compatible = "arm,cortex-a57","arm,armv8";
 			reg = <0x2>;
 			device_type = "cpu";
+			power-domains = <&sysc R8A7795_PD_CA57_CPU2>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
 		};
@@ -61,6 +65,7 @@
 			compatible = "arm,cortex-a57","arm,armv8";
 			reg = <0x3>;
 			device_type = "cpu";
+			power-domains = <&sysc R8A7795_PD_CA57_CPU3>;
 			next-level-cache = <&L2_CA57>;
 			enable-method = "psci";
 		};
@@ -68,12 +73,14 @@
 
 	L2_CA57: cache-controller@0 {
 		compatible = "cache";
+		power-domains = <&sysc R8A7795_PD_CA57_SCU>;
 		cache-unified;
 		cache-level = <2>;
 	};
 
 	L2_CA53: cache-controller@1 {
 		compatible = "cache";
+		power-domains = <&sysc R8A7795_PD_CA53_SCU>;
 		cache-unified;
 		cache-level = <2>;
 	};
@@ -302,6 +309,12 @@
 			#power-domain-cells = <0>;
 		};
 
+		sysc: system-controller@e6180000 {
+			compatible = "renesas,r8a7795-sysc";
+			reg = <0 0xe6180000 0 0x0400>;
+			#power-domain-cells = <1>;
+		};
+
 		audma0: dma-controller@ec700000 {
 			compatible = "renesas,rcar-dmac";
 			reg = <0 0xec700000 0 0x10000>;
-- 
2.7.0.rc3.207.g0ac5344
