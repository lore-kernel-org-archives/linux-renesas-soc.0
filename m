Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750888AbeERLQ0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:16:26 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 008/102] arm64: dts: renesas: r8a77970: Update IPMMU DS1 bit number
Date: Fri, 18 May 2018 13:14:30 +0200
Message-Id: <d2b860cb303fdeffa886c20bfbdbfd88cc52c85f.1526637994.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526637994.git.horms+renesas@verge.net.au>
References: <cover.1526637994.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Judging by "R-Car-Gen3-rev0.80" IPMMU IMSSTR register documentation
for [R-Car V3M] the DS1 bit field should be bit 0.

Update the ipmmu-main property to make it match the data sheet.

Fixes: ce3b52a1595b ("arm64: dts: renesas: r8a77970: Add IPMMU device nodes")
Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index c6db8ea43906..e8358d9bfd66 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -160,7 +160,7 @@
 		ipmmu_ds1: mmu@e7740000 {
 			compatible = "renesas,ipmmu-r8a77970";
 			reg = <0 0xe7740000 0 0x1000>;
-			renesas,ipmmu-main = <&ipmmu_mm 1>;
+			renesas,ipmmu-main = <&ipmmu_mm 0>;
 			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
-- 
2.11.0
