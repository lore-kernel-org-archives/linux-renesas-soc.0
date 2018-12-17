Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890E8C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 12:41:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 59C9620672
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 12:41:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="qHF1wjQk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbeLQMlE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 07:41:04 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39833 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbeLQMlE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 07:41:04 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5377E25B781;
        Mon, 17 Dec 2018 23:41:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545050461; bh=z7CLgFZLi0QEyuaHSV/XGCZvmtEx2PVQWBH9X5C52jo=;
        h=From:To:Cc:Subject:Date:From;
        b=qHF1wjQkKpvFkYiz5r0Qm13POd8ekqEmEsoHlsLUoiE6b9XCWH9SpgNBO4FjPNWN+
         Pqd6XvA8mOYuf0uS2V5jsEH2bdKrS44zr7l2m+B4hG6LrB9xCgMTQohQimGwldsPg2
         TcRg9hQsdBV6R4mHM/69nUfgpB9J59ngKUG6A6Ok=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id CE3F094048A; Mon, 17 Dec 2018 13:40:59 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] arm64: dts: renesas: r8a77990: sort pciec0 node within soc node
Date:   Mon, 17 Dec 2018 13:40:53 +0100
Message-Id: <20181217124053.10918-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Move the pciec0 node so that sub-nodes of the soc node are
sorted by bus address.

This change has no run-time affect.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 54 +++++++++++++++----------------
 1 file changed, 27 insertions(+), 27 deletions(-)

 Based on renesas-devel-20181213-v4.20-rc6

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

