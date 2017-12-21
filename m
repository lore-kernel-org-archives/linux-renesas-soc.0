Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:35102 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750757AbdLUOyg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Dec 2017 09:54:36 -0500
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] ARM: dts: r8a7745: Add missing clock for secondary CA7 CPU core
Date: Thu, 21 Dec 2017 14:52:25 +0000
Message-Id: <1513867945-43157-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the missing clock to CA7 CPU1 node.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7745.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
index 835a282..ae918e9 100644
--- a/arch/arm/boot/dts/r8a7745.dtsi
+++ b/arch/arm/boot/dts/r8a7745.dtsi
@@ -84,6 +84,7 @@
 			compatible = "arm,cortex-a7";
 			reg = <1>;
 			clock-frequency = <1000000000>;
+			clocks = <&cpg CPG_CORE R8A7745_CLK_Z2>;
 			power-domains = <&sysc R8A7745_PD_CA7_CPU1>;
 			next-level-cache = <&L2_CA7>;
 		};
-- 
1.9.1
