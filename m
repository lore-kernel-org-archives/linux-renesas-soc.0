Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44354 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752398AbdGaPUp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 11:20:45 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 24/38] ARM: dts: r8a7743: Add MMCIF0 support
Date: Mon, 31 Jul 2017 17:19:36 +0200
Message-Id: <873038ddc34b62b55b2ad919995d3f70be12f192.1501514100.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1501514100.git.horms+renesas@verge.net.au>
References: <cover.1501514100.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Chris Paterson <chris.paterson2@renesas.com>

Add the MMCIF0 device to the r8a7743 device tree.

Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7743.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index 0d021919755c..f62e8587f1a8 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -641,6 +641,22 @@
 			#size-cells = <0>;
 			status = "disabled";
 		};
+
+		mmcif0: mmc@ee200000 {
+			compatible = "renesas,mmcif-r8a7743",
+				     "renesas,sh-mmcif";
+			reg = <0 0xee200000 0 0x80>;
+			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 315>;
+			dmas = <&dmac0 0xd1>, <&dmac0 0xd2>,
+			       <&dmac1 0xd1>, <&dmac1 0xd2>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			resets = <&cpg 315>;
+			reg-io-width = <4>;
+			max-frequency = <97500000>;
+			status = "disabled";
+		};
 	};
 
 	/* External root clock */
-- 
2.1.4
