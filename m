Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:54218 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750916AbeDVKfZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 22 Apr 2018 06:35:25 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 4/4] ARM: dts: renesas: r8a7794: Add FDP1 instances
Date: Sun, 22 Apr 2018 13:35:28 +0300
Message-Id: <20180422103528.3402-5-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180422103528.3402-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20180422103528.3402-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The r8a7794 has one FDP1 instance.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm/boot/dts/r8a7794.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index d588efa6aeaa..56f5fa6a2c0f 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -1323,6 +1323,15 @@
 			resets = <&cpg 128>;
 		};
 
+		fdp1@fe940000 {
+			compatible = "renesas,fdp1";
+			reg = <0 0xfe940000 0 0x2400>;
+			interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 119>;
+			power-domains = <&sysc R8A7794_PD_ALWAYS_ON>;
+			resets = <&cpg 119>;
+		};
+
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a7794";
 			reg = <0 0xfeb00000 0 0x40000>;
-- 
Regards,

Laurent Pinchart
