Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750888AbeERLQ6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:16:58 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 051/102] arm64: dts: renesas: r8a7795-es1: Enable IPMMU devices
Date: Fri, 18 May 2018 13:15:13 +0200
Message-Id: <2246f002595aa942b906fc631b7a5e830aa74a39.1526637994.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526637994.git.horms+renesas@verge.net.au>
References: <cover.1526637994.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Remove 'status = "disabled"' to make sure all IPMMU devices are enabled
in DT on the r8a7795 ES1.0 Soc.

This is a follow up for a patch by Magnus Damm for the
the r8a7795 ES2.0 and other R-Car Gen 3 SoCs.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index f9acd125d687..0177f5e60e5a 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -39,7 +39,6 @@
 		reg = <0 0xe7730000 0 0x1000>;
 		renesas,ipmmu-main = <&ipmmu_mm 8>;
 		#iommu-cells = <1>;
-		status = "disabled";
 	};
 
 	/delete-node/ usb-phy@ee0e0200;
-- 
2.11.0
