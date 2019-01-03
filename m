Return-Path: <SRS0=Tt7D=PL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE8DC43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  3 Jan 2019 14:53:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5F07F217D9
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  3 Jan 2019 14:53:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727147AbfACOxZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 3 Jan 2019 09:53:25 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:60182 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbfACOxY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jan 2019 09:53:24 -0500
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id KqtM1z0063XaVaC01qtMbZ; Thu, 03 Jan 2019 15:53:21 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gf4N6-000444-W1; Thu, 03 Jan 2019 15:53:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gf4N6-0000zR-TK; Thu, 03 Jan 2019 15:53:20 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a77990: Sort i2c nodes within soc node
Date:   Thu,  3 Jan 2019 15:53:19 +0100
Message-Id: <20190103145319.3764-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Move the i2c nodes so that sub-nodes of the soc node are sorted by bus
address.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 136 +++++++++++-----------
 1 file changed, 68 insertions(+), 68 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index bdc7f7d39820c13b..84bbe70cb0abfc88 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -240,6 +240,74 @@
 			resets = <&cpg 906>;
 		};
 
+		pfc: pin-controller@e6060000 {
+			compatible = "renesas,pfc-r8a77990";
+			reg = <0 0xe6060000 0 0x508>;
+		};
+
+		i2c_dvfs: i2c@e60b0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,iic-r8a77990";
+			reg = <0 0xe60b0000 0 0x15>;
+			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 926>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 926>;
+			dmas = <&dmac0 0x11>, <&dmac0 0x10>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
+		cpg: clock-controller@e6150000 {
+			compatible = "renesas,r8a77990-cpg-mssr";
+			reg = <0 0xe6150000 0 0x1000>;
+			clocks = <&extal_clk>;
+			clock-names = "extal";
+			#clock-cells = <2>;
+			#power-domain-cells = <0>;
+			#reset-cells = <1>;
+		};
+
+		rst: reset-controller@e6160000 {
+			compatible = "renesas,r8a77990-rst";
+			reg = <0 0xe6160000 0 0x0200>;
+		};
+
+		sysc: system-controller@e6180000 {
+			compatible = "renesas,r8a77990-sysc";
+			reg = <0 0xe6180000 0 0x0400>;
+			#power-domain-cells = <1>;
+		};
+
+		thermal: thermal@e6190000 {
+			compatible = "renesas,thermal-r8a77990";
+			reg = <0 0xe6190000 0 0x10>, <0 0xe6190100 0 0x38>;
+			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 522>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 522>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		intc_ex: interrupt-controller@e61c0000 {
+			compatible = "renesas,intc-ex-r8a77990", "renesas,irqc";
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			reg = <0 0xe61c0000 0 0x200>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 407>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 407>;
+		};
+
 		i2c0: i2c@e6500000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -369,74 +437,6 @@
 			status = "disabled";
 		};
 
-		pfc: pin-controller@e6060000 {
-			compatible = "renesas,pfc-r8a77990";
-			reg = <0 0xe6060000 0 0x508>;
-		};
-
-		i2c_dvfs: i2c@e60b0000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "renesas,iic-r8a77990";
-			reg = <0 0xe60b0000 0 0x15>;
-			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 926>;
-			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
-			resets = <&cpg 926>;
-			dmas = <&dmac0 0x11>, <&dmac0 0x10>;
-			dma-names = "tx", "rx";
-			status = "disabled";
-		};
-
-		cpg: clock-controller@e6150000 {
-			compatible = "renesas,r8a77990-cpg-mssr";
-			reg = <0 0xe6150000 0 0x1000>;
-			clocks = <&extal_clk>;
-			clock-names = "extal";
-			#clock-cells = <2>;
-			#power-domain-cells = <0>;
-			#reset-cells = <1>;
-		};
-
-		rst: reset-controller@e6160000 {
-			compatible = "renesas,r8a77990-rst";
-			reg = <0 0xe6160000 0 0x0200>;
-		};
-
-		sysc: system-controller@e6180000 {
-			compatible = "renesas,r8a77990-sysc";
-			reg = <0 0xe6180000 0 0x0400>;
-			#power-domain-cells = <1>;
-		};
-
-		thermal: thermal@e6190000 {
-			compatible = "renesas,thermal-r8a77990";
-			reg = <0 0xe6190000 0 0x10>, <0 0xe6190100 0 0x38>;
-			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 522>;
-			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
-			resets = <&cpg 522>;
-			#thermal-sensor-cells = <0>;
-		};
-
-		intc_ex: interrupt-controller@e61c0000 {
-			compatible = "renesas,intc-ex-r8a77990", "renesas,irqc";
-			#interrupt-cells = <2>;
-			interrupt-controller;
-			reg = <0 0xe61c0000 0 0x200>;
-			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 407>;
-			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
-			resets = <&cpg 407>;
-		};
-
 		hscif0: serial@e6540000 {
 			compatible = "renesas,hscif-r8a77990",
 				     "renesas,rcar-gen3-hscif",
-- 
2.17.1

