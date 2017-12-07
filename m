Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35788 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752501AbdLGJzM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Dec 2017 04:55:12 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 32/54] arm64: dts: renesas: r8a7795-es1: Enable IPMMU-MP1
Date: Thu,  7 Dec 2017 10:53:35 +0100
Message-Id: <0e467ade5e289625a637ebf3255f99c77d6192a5.1512640145.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1512640145.git.horms+renesas@verge.net.au>
References: <cover.1512640145.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Enable the r8a7795 ES1.x device node for IPMMU-MP1.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index 6713eeeab52a..29b52d89c78a 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -31,7 +31,6 @@
 		reg = <0 0xec680000 0 0x1000>;
 		renesas,ipmmu-main = <&ipmmu_mm 5>;
 		#iommu-cells = <1>;
-		status = "disabled";
 	};
 
 	ipmmu_sy: mmu@e7730000 {
-- 
2.11.0
