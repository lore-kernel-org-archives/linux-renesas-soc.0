Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:39559 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965328AbeALXOm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jan 2018 18:14:42 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 08/12] ARM: dts: r8a7792: Convert to new DU DT bindings
Date: Sat, 13 Jan 2018 01:14:26 +0200
Message-Id: <20180112231430.26943-9-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180112231430.26943-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20180112231430.26943-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The DU DT bindings have been updated to drop the reg-names property.
Update the r8a7792 device tree accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm/boot/dts/r8a7792.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
index 3d080e07374c..d40325466aa8 100644
--- a/arch/arm/boot/dts/r8a7792.dtsi
+++ b/arch/arm/boot/dts/r8a7792.dtsi
@@ -678,7 +678,6 @@
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a7792";
 			reg = <0 0xfeb00000 0 0x40000>;
-			reg-names = "du";
 			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 724>,
-- 
Regards,

Laurent Pinchart
