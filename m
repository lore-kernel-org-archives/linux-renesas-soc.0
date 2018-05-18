Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752648AbeERLTI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:19:08 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 18/69] ARM: dts: r8a7790: Adjust SMP routine size
Date: Fri, 18 May 2018 13:16:51 +0200
Message-Id: <5c6c17a51f809bf831086d014f8655fa5a9f421b.1526641667.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526641667.git.horms+renesas@verge.net.au>
References: <cover.1526641667.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

This patch adjusts the definition of the SMP routine size according
to the latest changes made by commit:
"ARM: shmobile: Add watchdog support"

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7790.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index e4367cecad18..317325e271c9 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -443,7 +443,7 @@
 
 			smp-sram@0 {
 				compatible = "renesas,smp-sram";
-				reg = <0 0x10>;
+				reg = <0 0x100>;
 			};
 		};
 
-- 
2.11.0
