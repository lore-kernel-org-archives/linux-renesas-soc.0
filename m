Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D812C282C5
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:13:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2FC3D2184C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:13:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="WXRXKWf/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728448AbfAXPNv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 10:13:51 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39115 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727996AbfAXPNu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 10:13:50 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id F202725BF17;
        Fri, 25 Jan 2019 02:12:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548342769; bh=8Wd5h+RytnvQJtsGa1SIcironRsx61VKGcsR6oj7bG0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WXRXKWf/sYWvy5By5EhCcaBsIOOICUz9EISDsURqnifobns2XwHJWRL0ZlVDFDC/Q
         9rnKHUrWMHNNAvzQXaV7+YK2LvTLRQeX40wS7sssouFWn6q6mk5cA9zpLvsssxkg3+
         NJjRUEv3CrQXKFhR8MQA1lSpLIn/doSMdQxxo3Oc=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id E737F940D4F; Thu, 24 Jan 2019 16:12:40 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 31/44] arm64: dts: renesas: r8a77990: sort pciec0 node within soc node
Date:   Thu, 24 Jan 2019 16:12:25 +0100
Message-Id: <003233351d4411caf993267f407b5c0a0ae76dd3.1548233325.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1548233325.git.horms+renesas@verge.net.au>
References: <cover.1548233325.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Move the pciec0 node so that sub-nodes of the soc node are
sorted by bus address.

This change has no run-time affect.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 54 +++++++++++++++----------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index b2f606e286ce..bdc7f7d39820 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1526,6 +1526,33 @@
 			resets = <&cpg 408>;
 		};
 
+		pciec0: pcie@fe000000 {
+			compatible = "renesas,pcie-r8a77990",
+				     "renesas,pcie-rcar-gen3";
+			reg = <0 0xfe000000 0 0x80000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x00100000
+				  0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000
+				  0x02000000 0 0x30000000 0 0x30000000 0 0x08000000
+				  0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
+			/* Map all possible DDR as inbound ranges */
+			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x40000000>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 319>, <&pcie_bus_clk>;
+			clock-names = "pcie", "pcie_bus";
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 319>;
+			status = "disabled";
+		};
+
 		vspb0: vsp@fe960000 {
 			compatible = "renesas,vsp2";
 			reg = <0 0xfe960000 0 0x8000>;
@@ -1724,33 +1751,6 @@
 			};
 		};
 
-		pciec0: pcie@fe000000 {
-			compatible = "renesas,pcie-r8a77990",
-				     "renesas,pcie-rcar-gen3";
-			reg = <0 0xfe000000 0 0x80000>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-			bus-range = <0x00 0xff>;
-			device_type = "pci";
-			ranges = <0x01000000 0 0x00000000 0 0xfe100000 0 0x00100000
-				0x02000000 0 0xfe200000 0 0xfe200000 0 0x00200000
-				0x02000000 0 0x30000000 0 0x30000000 0 0x08000000
-				0x42000000 0 0x38000000 0 0x38000000 0 0x08000000>;
-			/* Map all possible DDR as inbound ranges */
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x40000000>;
-			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
-			#interrupt-cells = <1>;
-			interrupt-map-mask = <0 0 0 0>;
-			interrupt-map = <0 0 0 0 &gic GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 319>, <&pcie_bus_clk>;
-			clock-names = "pcie", "pcie_bus";
-			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
-			resets = <&cpg 319>;
-			status = "disabled";
-		};
-
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
-- 
2.11.0

