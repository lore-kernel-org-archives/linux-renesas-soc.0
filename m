Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37528 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751157AbdGMK6X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2017 06:58:23 -0400
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 92B092021B
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jul 2017 12:57:51 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: renesas: r8a7796: Add resets property to VSP devices
Date: Thu, 13 Jul 2017 13:58:22 +0300
Message-Id: <20170713105822.5327-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170713105822.5327-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170713105822.5327-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The VSP nodes are missing the resets property. Add it.

Fixes: 5a89c826745f ("arm64: dts: renesas: r8a7796: Add VSP instances")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 1eef59f6fb63..ef1120f4e561 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1576,6 +1576,7 @@
 			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 626>;
 			power-domains = <&sysc R8A7796_PD_A3VC>;
+			resets = <&cpg 626>;
 
 			renesas,fcp = <&fcpvb0>;
 		};
@@ -1594,6 +1595,7 @@
 			interrupts = <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 631>;
 			power-domains = <&sysc R8A7796_PD_A3VC>;
+			resets = <&cpg 631>;
 
 			renesas,fcp = <&fcpvi0>;
 		};
@@ -1612,6 +1614,7 @@
 			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 623>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 623>;
 
 			renesas,fcp = <&fcpvd0>;
 		};
@@ -1630,6 +1633,7 @@
 			interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 622>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 622>;
 
 			renesas,fcp = <&fcpvd1>;
 		};
@@ -1648,6 +1652,7 @@
 			interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 621>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 621>;
 
 			renesas,fcp = <&fcpvd2>;
 		};
-- 
Regards,

Laurent Pinchart
