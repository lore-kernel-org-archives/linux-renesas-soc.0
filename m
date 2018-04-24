Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:32956 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751097AbeDXJ1E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 05:27:04 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] arm64: dts: renesas: r8a7795-es1: Enable IPMMU devices
Date: Tue, 24 Apr 2018 11:26:59 +0200
Message-Id: <20180424092659.23657-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Remove 'status = "disabled"' to make sure all IPMMU devices are enabled
in DT on the r8a7795 ES1.0 Soc.

This is a follow up for a patch by Magnus Damm for the
the r8a7795 ES2.0 and other R-Car Gen 3 SoCs.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Based on renesas-devel-20180423-v4.17-rc2
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
