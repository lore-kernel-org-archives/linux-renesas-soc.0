Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59886 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751625AbdAYKZt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 05:25:49 -0500
Date: Wed, 25 Jan 2017 11:25:41 +0100
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Niklas Soderlund <niklas.soderlund@ragnatech.se>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: renesas: r8a7795: tidyup audma definition order
Message-ID: <20170125102541.GA14751@verge.net.au>
References: <878tr9yj82.wl%kuninori.morimoto.gx@renesas.com>
 <87inp49d27.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87inp49d27.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

sorry for missing this earlier.

The patch did not seem to compile so I have applied it manually
by moving the audma0 and audma1 nodes to between the dmac2 and avb nodes.

The result is follows:

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] arm64: renesas: r8a7795: tidyup audma definition order

Current r8a7795.dtsi defines audma -> ipmmu -> dma order.
Because of this order, dma can connect to ipmmu, but
audma can't connect to it.
This patch moves audma order as ipmmu -> dma -> audma.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 132 +++++++++++++++----------------
 1 file changed, 66 insertions(+), 66 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 8b030c323c10..74a4e1ad057d 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -340,72 +340,6 @@
 			#power-domain-cells = <1>;
 		};
 
-		audma0: dma-controller@ec700000 {
-			compatible = "renesas,dmac-r8a7795",
-				     "renesas,rcar-dmac";
-			reg = <0 0xec700000 0 0x10000>;
-			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "error",
-					"ch0", "ch1", "ch2", "ch3",
-					"ch4", "ch5", "ch6", "ch7",
-					"ch8", "ch9", "ch10", "ch11",
-					"ch12", "ch13", "ch14", "ch15";
-			clocks = <&cpg CPG_MOD 502>;
-			clock-names = "fck";
-			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-			#dma-cells = <1>;
-			dma-channels = <16>;
-		};
-
-		audma1: dma-controller@ec720000 {
-			compatible = "renesas,dmac-r8a7795",
-				     "renesas,rcar-dmac";
-			reg = <0 0xec720000 0 0x10000>;
-			interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH
-				      GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "error",
-					"ch0", "ch1", "ch2", "ch3",
-					"ch4", "ch5", "ch6", "ch7",
-					"ch8", "ch9", "ch10", "ch11",
-					"ch12", "ch13", "ch14", "ch15";
-			clocks = <&cpg CPG_MOD 501>;
-			clock-names = "fck";
-			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-			#dma-cells = <1>;
-			dma-channels = <16>;
-		};
-
 		pfc: pfc@e6060000 {
 			compatible = "renesas,pfc-r8a7795";
 			reg = <0 0xe6060000 0 0x50c>;
@@ -525,6 +459,72 @@
 			dma-channels = <16>;
 		};
 
+		audma0: dma-controller@ec700000 {
+			compatible = "renesas,dmac-r8a7795",
+				     "renesas,rcar-dmac";
+			reg = <0 0xec700000 0 0x10000>;
+			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					"ch0", "ch1", "ch2", "ch3",
+					"ch4", "ch5", "ch6", "ch7",
+					"ch8", "ch9", "ch10", "ch11",
+					"ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 502>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+		};
+
+		audma1: dma-controller@ec720000 {
+			compatible = "renesas,dmac-r8a7795",
+				     "renesas,rcar-dmac";
+			reg = <0 0xec720000 0 0x10000>;
+			interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					"ch0", "ch1", "ch2", "ch3",
+					"ch4", "ch5", "ch6", "ch7",
+					"ch8", "ch9", "ch10", "ch11",
+					"ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 501>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+		};
+
 		avb: ethernet@e6800000 {
 			compatible = "renesas,etheravb-r8a7795",
 				     "renesas,etheravb-rcar-gen3";
-- 
2.7.0.rc3.207.g0ac5344
