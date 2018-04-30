Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:58144 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751413AbeD3Kxb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Apr 2018 06:53:31 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH] ARM: dts: r8a7790: Fix sort order of VSP1/FDP1 nodes
Date: Mon, 30 Apr 2018 11:53:25 +0100
Message-Id: <20180430105325.27753-1-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20180430065949.my4733iq3cx2ombj@verge.net.au>
References: <20180430065949.my4733iq3cx2ombj@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Commit 5d3b50d3c04d ("ARM: dts: renesas: r8a7790: Add FDP1 instances")
introduced the FDP1 for the r8a7790, but broke the sort ordering of the
device tree nodes.

Move the last VSP up to it's peers to correct the ordering.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 arch/arm/boot/dts/r8a7790.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index c244aae7a026..b66a18af28f1 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1616,6 +1616,15 @@
 			resets = <&cpg 128>;
 		};
 
+		vsp@fe938000 {
+			compatible = "renesas,vsp1";
+			reg = <0 0xfe938000 0 0x8000>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 127>;
+			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+			resets = <&cpg 127>;
+		};
+
 		fdp1@fe940000 {
 			compatible = "renesas,fdp1";
 			reg = <0 0xfe940000 0 0x2400>;
@@ -1643,15 +1652,6 @@
 			resets = <&cpg 117>;
 		};
 
-		vsp@fe938000 {
-			compatible = "renesas,vsp1";
-			reg = <0 0xfe938000 0 0x8000>;
-			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 127>;
-			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
-			resets = <&cpg 127>;
-		};
-
 		jpu: jpeg-codec@fe980000 {
 			compatible = "renesas,jpu-r8a7790",
 				     "renesas,rcar-gen2-jpu";
-- 
2.17.0
