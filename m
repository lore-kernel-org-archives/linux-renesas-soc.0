Return-Path: <SRS0=/dFS=SL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED31C282CE
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 08:52:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BAE202070D
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 08:52:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbfDIIwa (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 04:52:30 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:29812 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726579AbfDIIwa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 04:52:30 -0400
Received: from fsav104.sakura.ne.jp (fsav104.sakura.ne.jp [27.133.134.231])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x398qMYx010405;
        Tue, 9 Apr 2019 17:52:22 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav104.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav104.sakura.ne.jp);
 Tue, 09 Apr 2019 17:52:22 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav104.sakura.ne.jp)
Received: from localhost (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x398qIim010377
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 9 Apr 2019 17:52:22 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
From:   Cao Van Dong <cv-dong@jinso.co.jp>
To:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, horms+renesas@verge.net.au,
        devicetree@vger.kernel.org
Cc:     yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
Subject: [PATCH 02/11] ARM: dts: r8a77470: Add MSIOF support
Date:   Tue,  9 Apr 2019 17:51:43 +0900
Message-Id: <1554799912-24764-3-git-send-email-cv-dong@jinso.co.jp>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554799912-24764-1-git-send-email-cv-dong@jinso.co.jp>
References: <1554799912-24764-1-git-send-email-cv-dong@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add msiof{0|1|2} nodes to dtsi for MSIOF support on the RZ/G1C (r8a77470) SoC.

Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
---
 arch/arm/boot/dts/r8a77470.dtsi | 48 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index 85f7a6f..a7d3f88 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -636,6 +636,54 @@
 			status = "disabled";
 		};
 
+		msiof0: spi@e6e20000 {
+			compatible = "renesas,msiof-r8a77470",
+				     "renesas,rcar-gen2-msiof";
+			reg = <0 0xe6e20000 0 0x0064>;
+			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 000>;
+			dmas = <&dmac0 0x51>, <&dmac0 0x52>,
+			       <&dmac1 0x51>, <&dmac1 0x52>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc r8a77470_PD_ALWAYS_ON>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			resets = <&cpg 000>;
+			status = "disabled";
+		};
+
+		msiof1: spi@e6e10000 {
+			compatible = "renesas,msiof-r8a77470",
+				     "renesas,rcar-gen2-msiof";
+			reg = <0 0xe6e10000 0 0x0064>;
+			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 208>;
+			dmas = <&dmac0 0x55>, <&dmac0 0x56>,
+			       <&dmac1 0x55>, <&dmac1 0x56>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc r8a77470_PD_ALWAYS_ON>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			resets = <&cpg 208>;
+			status = "disabled";
+		};
+
+		msiof2: spi@e6e00000 {
+			compatible = "renesas,msiof-r8a77470",
+				     "renesas,rcar-gen2-msiof";
+			reg = <0 0xe6e00000 0 0x0064>;
+			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 205>;
+			dmas = <&dmac0 0x41>, <&dmac0 0x42>,
+			       <&dmac1 0x41>, <&dmac1 0x42>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc r8a77470_PD_ALWAYS_ON>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			resets = <&cpg 205>;
+			status = "disabled";
+		};
+
 		sdhi0: sd@ee100000 {
 			compatible = "renesas,sdhi-r8a77470",
 				     "renesas,rcar-gen2-sdhi";
-- 
2.7.4

