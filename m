Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52231 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933997AbeFYOEA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jun 2018 10:04:00 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 03/29] arm64: dts: renesas: r8a77995: don't use deprecated renesas,gpio-rcar compat string
Date: Mon, 25 Jun 2018 16:02:58 +0200
Message-Id: <341238b57dfb1adf40d26557da4399de8823532a.1529933747.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1529933747.git.horms+renesas@verge.net.au>
References: <cover.1529933747.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The compat string renesas,gpio-rcar has been deprecated since v4.14,
the same release that r8a77990 SoC support was added. Thus
renesas,gpio-rcar can safely be removed without any risk of behaviour
changes between old and new mainline kernels and DTBs.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 44268671c487..8f162ac369b1 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -88,8 +88,7 @@
 
 		gpio0: gpio@e6050000 {
 			compatible = "renesas,gpio-r8a77995",
-				     "renesas,rcar-gen3-gpio",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen3-gpio";
 			reg = <0 0xe6050000 0 0x50>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
@@ -104,8 +103,7 @@
 
 		gpio1: gpio@e6051000 {
 			compatible = "renesas,gpio-r8a77995",
-				     "renesas,rcar-gen3-gpio",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen3-gpio";
 			reg = <0 0xe6051000 0 0x50>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
@@ -120,8 +118,7 @@
 
 		gpio2: gpio@e6052000 {
 			compatible = "renesas,gpio-r8a77995",
-				     "renesas,rcar-gen3-gpio",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen3-gpio";
 			reg = <0 0xe6052000 0 0x50>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
@@ -136,8 +133,7 @@
 
 		gpio3: gpio@e6053000 {
 			compatible = "renesas,gpio-r8a77995",
-				     "renesas,rcar-gen3-gpio",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen3-gpio";
 			reg = <0 0xe6053000 0 0x50>;
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
@@ -152,8 +148,7 @@
 
 		gpio4: gpio@e6054000 {
 			compatible = "renesas,gpio-r8a77995",
-				     "renesas,rcar-gen3-gpio",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen3-gpio";
 			reg = <0 0xe6054000 0 0x50>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
@@ -168,8 +163,7 @@
 
 		gpio5: gpio@e6055000 {
 			compatible = "renesas,gpio-r8a77995",
-				     "renesas,rcar-gen3-gpio",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen3-gpio";
 			reg = <0 0xe6055000 0 0x50>;
 			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
@@ -184,8 +178,7 @@
 
 		gpio6: gpio@e6055400 {
 			compatible = "renesas,gpio-r8a77995",
-				     "renesas,rcar-gen3-gpio",
-				     "renesas,gpio-rcar";
+				     "renesas,rcar-gen3-gpio";
 			reg = <0 0xe6055400 0 0x50>;
 			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
 			#gpio-cells = <2>;
-- 
2.11.0
