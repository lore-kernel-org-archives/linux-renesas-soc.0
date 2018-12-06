Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55792 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbeLFV5k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:57:40 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/3] arm64: dts: renesas: r8a7795-es1: Add missing power domains to IPMMU nodes
Date: Thu,  6 Dec 2018 13:57:31 -0800
Message-Id: <41e30b515a003a90e336b7a456c7c82d8c3aa6a7.1544126426.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1544126426.git.horms+renesas@verge.net.au>
References: <cover.1544126426.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

While commit 3b7e7848f0e88b36 ("arm64: dts: renesas: r8a7795: Add IPMMU
device nodes") for R-Car H3 ES2.0 did include power-domains properties,
they were forgotten in the counterpart for older R-Car H3 ES1.x SoCs.

Fixes: e4b9a493df45075b ("arm64: dts: renesas: r8a7795-es1: Add IPMMU device nodes")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index 0fb84c219b2f..40d10daca852 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -28,6 +28,7 @@
 		compatible = "renesas,ipmmu-r8a7795";
 		reg = <0 0xec680000 0 0x1000>;
 		renesas,ipmmu-main = <&ipmmu_mm 5>;
+		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 		#iommu-cells = <1>;
 	};
 
@@ -35,6 +36,7 @@
 		compatible = "renesas,ipmmu-r8a7795";
 		reg = <0 0xe7730000 0 0x1000>;
 		renesas,ipmmu-main = <&ipmmu_mm 8>;
+		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 		#iommu-cells = <1>;
 	};
 
-- 
2.11.0
