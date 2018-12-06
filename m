Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55792 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbeLFV5j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:57:39 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/3] arm64: dts: renesas: r8a77965: Remove non-existent IPMMU-IR
Date: Thu,  6 Dec 2018 13:57:30 -0800
Message-Id: <d8c6557bc93be73ed1abe5b13fa1e46e59da028b.1544126426.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1544126426.git.horms+renesas@verge.net.au>
References: <cover.1544126426.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

The R-Car Gen3 HardWare Manual Errata for Rev. 1.00 (Aug 24, 2018)
removed the IPMMU-IR IOMMU instance on R-Car M3-N, as this SoC does not
have an Image Processing Unit (IMP-X5) nor the A3IR power domain.

Fixes: 55697cbb44e4f7ea ("arm64: dts: renesas: r8a779{65,80,90}: Add IPMMU devices nodes")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 1c86e6f4dc71..6dc9b1fef830 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -795,14 +795,6 @@
 			#iommu-cells = <1>;
 		};
 
-		ipmmu_ir: mmu@ff8b0000 {
-			compatible = "renesas,ipmmu-r8a77965";
-			reg = <0 0xff8b0000 0 0x1000>;
-			renesas,ipmmu-main = <&ipmmu_mm 3>;
-			power-domains = <&sysc R8A77965_PD_A3IR>;
-			#iommu-cells = <1>;
-		};
-
 		ipmmu_mm: mmu@e67b0000 {
 			compatible = "renesas,ipmmu-r8a77965";
 			reg = <0 0xe67b0000 0 0x1000>;
-- 
2.11.0
