Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425A1C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:14:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 10CAC20863
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:14:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Yv388bYI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbfBHLOW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 06:14:22 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:46395 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfBHLOW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 06:14:22 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 22BA725BEF6;
        Fri,  8 Feb 2019 22:14:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549624457; bh=bJt7blUuG2qS1Dyd6tYBCHOQPFvWINgBijNpq/9gxlU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Yv388bYIUx4r5XFPqy6wSVeN/HupVO7ThVhy6PzsM3mzR553xJTB5VZe4kp0ug4K3
         PIuIsIMj7ULUck6hoGQRVtl2WEqkUZxpNpZ1Ah8+DMTwAcBRxcpvHvRuZbnAzlRH9S
         vjVGCeXtSuum9DqWt8NiQjO7NwCHzR6kmmShUsZE=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 746A0940461; Fri,  8 Feb 2019 12:14:15 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 03/12] ARM: dts: r8a7744: Fix sorting of vsp and msiof nodes
Date:   Fri,  8 Feb 2019 12:14:04 +0100
Message-Id: <35713c782ef7c715eb0bc2f43d9f31cc7ec08063.1549623128.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1549623128.git.horms+renesas@verge.net.au>
References: <cover.1549623128.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Biju Das <biju.das@bp.renesas.com>

This patch fixes sorting of vsp and msiof nodes.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7744.dtsi | 150 ++++++++++++++++++++---------------------
 1 file changed, 75 insertions(+), 75 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index 04148d608fc4..8d25a0a0594a 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -998,6 +998,54 @@
 			status = "disabled";
 		};
 
+		msiof0: spi@e6e20000 {
+			compatible = "renesas,msiof-r8a7744",
+				     "renesas,rcar-gen2-msiof";
+			reg = <0 0xe6e20000 0 0x0064>;
+			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 000>;
+			dmas = <&dmac0 0x51>, <&dmac0 0x52>,
+			       <&dmac1 0x51>, <&dmac1 0x52>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			resets = <&cpg 000>;
+			status = "disabled";
+		};
+
+		msiof1: spi@e6e10000 {
+			compatible = "renesas,msiof-r8a7744",
+				     "renesas,rcar-gen2-msiof";
+			reg = <0 0xe6e10000 0 0x0064>;
+			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 208>;
+			dmas = <&dmac0 0x55>, <&dmac0 0x56>,
+			       <&dmac1 0x55>, <&dmac1 0x56>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			resets = <&cpg 208>;
+			status = "disabled";
+		};
+
+		msiof2: spi@e6e00000 {
+			compatible = "renesas,msiof-r8a7744",
+				     "renesas,rcar-gen2-msiof";
+			reg = <0 0xe6e00000 0 0x0064>;
+			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 205>;
+			dmas = <&dmac0 0x41>, <&dmac0 0x42>,
+			       <&dmac1 0x41>, <&dmac1 0x42>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			resets = <&cpg 205>;
+			status = "disabled";
+		};
+
 		pwm0: pwm@e6e30000 {
 			compatible = "renesas,pwm-r8a7744", "renesas,pwm-rcar";
 			reg = <0 0xe6e30000 0 0x8>;
@@ -1068,54 +1116,6 @@
 			status = "disabled";
 		};
 
-		msiof0: spi@e6e20000 {
-			compatible = "renesas,msiof-r8a7744",
-				     "renesas,rcar-gen2-msiof";
-			reg = <0 0xe6e20000 0 0x0064>;
-			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 000>;
-			dmas = <&dmac0 0x51>, <&dmac0 0x52>,
-			       <&dmac1 0x51>, <&dmac1 0x52>;
-			dma-names = "tx", "rx", "tx", "rx";
-			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			resets = <&cpg 000>;
-			status = "disabled";
-		};
-
-		msiof1: spi@e6e10000 {
-			compatible = "renesas,msiof-r8a7744",
-				     "renesas,rcar-gen2-msiof";
-			reg = <0 0xe6e10000 0 0x0064>;
-			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 208>;
-			dmas = <&dmac0 0x55>, <&dmac0 0x56>,
-			       <&dmac1 0x55>, <&dmac1 0x56>;
-			dma-names = "tx", "rx", "tx", "rx";
-			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			resets = <&cpg 208>;
-			status = "disabled";
-		};
-
-		msiof2: spi@e6e00000 {
-			compatible = "renesas,msiof-r8a7744",
-				     "renesas,rcar-gen2-msiof";
-			reg = <0 0xe6e00000 0 0x0064>;
-			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 205>;
-			dmas = <&dmac0 0x41>, <&dmac0 0x42>,
-			       <&dmac1 0x41>, <&dmac1 0x42>;
-			dma-names = "tx", "rx", "tx", "rx";
-			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			resets = <&cpg 205>;
-			status = "disabled";
-		};
-
 		can0: can@e6e80000 {
 			compatible = "renesas,can-r8a7744",
 				     "renesas,rcar-gen2-can";
@@ -1589,33 +1589,6 @@
 			resets = <&cpg 408>;
 		};
 
-		vsp@fe928000 {
-			compatible = "renesas,vsp1";
-			reg = <0 0xfe928000 0 0x8000>;
-			interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 131>;
-			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
-			resets = <&cpg 131>;
-		};
-
-		vsp@fe930000 {
-			compatible = "renesas,vsp1";
-			reg = <0 0xfe930000 0 0x8000>;
-			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 128>;
-			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
-			resets = <&cpg 128>;
-		};
-
-		vsp@fe938000 {
-			compatible = "renesas,vsp1";
-			reg = <0 0xfe938000 0 0x8000>;
-			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 127>;
-			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
-			resets = <&cpg 127>;
-		};
-
 		pciec: pcie@fe000000 {
 			compatible = "renesas,pcie-r8a7744",
 				     "renesas,pcie-rcar-gen2";
@@ -1644,6 +1617,33 @@
 			status = "disabled";
 		};
 
+		vsp@fe928000 {
+			compatible = "renesas,vsp1";
+			reg = <0 0xfe928000 0 0x8000>;
+			interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 131>;
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 131>;
+		};
+
+		vsp@fe930000 {
+			compatible = "renesas,vsp1";
+			reg = <0 0xfe930000 0 0x8000>;
+			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 128>;
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 128>;
+		};
+
+		vsp@fe938000 {
+			compatible = "renesas,vsp1";
+			reg = <0 0xfe938000 0 0x8000>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 127>;
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 127>;
+		};
+
 		du: display@feb00000 {
 			reg = <0 0xfeb00000 0 0x40000>,
 			      <0 0xfeb90000 0 0x1c>;
-- 
2.11.0

