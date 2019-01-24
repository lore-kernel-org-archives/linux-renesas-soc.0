Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1749C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:13:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 840282184C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:13:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="cPBwrGNG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728166AbfAXPN4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 10:13:56 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39115 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727996AbfAXPN4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 10:13:56 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 098B725BF1A;
        Fri, 25 Jan 2019 02:12:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548342769; bh=DhgAB+vNCzodfEiT85hgs+vh2b3OEaldGZNVpdTXjjI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cPBwrGNGM/JUX+0gXUX7I7lb9CijmzzdEe7R6HEflJT8sVmrnPxHQLtPLT+6lXR59
         MfAvdBNb1kLRWDJtRSi0WtXjYHC8IYhfVT8uUYW3mAv7IMgfNYe8Z6giYJDS5bTrvL
         +r89kZShjzdmvzzNc76uvVgrsRtNqSVAhylZ/YgI=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id F3974940D51; Thu, 24 Jan 2019 16:12:40 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 32/44] arm64: dts: renesas: r8a77990: Sort i2c nodes within soc node
Date:   Thu, 24 Jan 2019 16:12:26 +0100
Message-Id: <d5d7134fd49e6f5382432b9fcfbf68fa6556b04c.1548233325.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1548233325.git.horms+renesas@verge.net.au>
References: <cover.1548233325.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

Move the i2c nodes so that sub-nodes of the soc node are sorted by bus
address.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 136 +++++++++++++++---------------
 1 file changed, 68 insertions(+), 68 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index bdc7f7d39820..84bbe70cb0ab 100644
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
2.11.0

