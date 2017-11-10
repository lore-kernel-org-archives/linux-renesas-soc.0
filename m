Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56182 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752806AbdKJN0F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Nov 2017 08:26:05 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 3/5] arm64: dts: renesas: r8a77970: Tie SYS-DMAC to IPMMU-DS1
Date: Fri, 10 Nov 2017 14:25:51 +0100
Message-Id: <20171110132553.1461-4-horms+renesas@verge.net.au>
In-Reply-To: <20171110132553.1461-1-horms+renesas@verge.net.au>
References: <20171110132553.1461-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hook up r8a77970 DMAC nodes to the IPMMU. In particular
SYS-DMAC1 and SYS-DMAC2 get tied to IPMMU-DS1.

Based on work for the r8a7796 by Magnus Damm.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2
* Added reviewed by tag from Geert Uytterhoeven
---
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index 5f73ee2dfd6d..108c6159c847 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -224,6 +224,10 @@
 			resets = <&cpg 218>;
 			#dma-cells = <1>;
 			dma-channels = <8>;
+			iommus = <&ipmmu_ds1 0>, <&ipmmu_ds1 1>,
+			       <&ipmmu_ds1 2>, <&ipmmu_ds1 3>,
+			       <&ipmmu_ds1 4>, <&ipmmu_ds1 5>,
+			       <&ipmmu_ds1 6>, <&ipmmu_ds1 7>;
 		};
 
 		dmac2: dma-controller@e7310000 {
@@ -248,6 +252,10 @@
 			resets = <&cpg 217>;
 			#dma-cells = <1>;
 			dma-channels = <8>;
+			iommus = <&ipmmu_ds1 16>, <&ipmmu_ds1 17>,
+			       <&ipmmu_ds1 18>, <&ipmmu_ds1 19>,
+			       <&ipmmu_ds1 20>, <&ipmmu_ds1 21>,
+			       <&ipmmu_ds1 22>, <&ipmmu_ds1 23>;
 		};
 
 		hscif0: serial@e6540000 {
-- 
2.11.0
