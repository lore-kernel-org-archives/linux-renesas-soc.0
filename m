Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35765 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752472AbdLGJyv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Dec 2017 04:54:51 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 10/54] arm64: dts: renesas: r8a7796: Tie Audio-DMAC to IPMMU-MP
Date: Thu,  7 Dec 2017 10:53:13 +0100
Message-Id: <13312527a220d077984cc1d20d1ec73db22a866a.1512640145.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1512640145.git.horms+renesas@verge.net.au>
References: <cover.1512640145.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hook up r8a7796 Audio-DMAC nodes to the IPMMU-MP.

Based on work for the r8a7795 by Magnus Damm.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 84f38056f8e6..fd875b5ea861 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1327,6 +1327,14 @@
 			resets = <&cpg 502>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
+			iommus = <&ipmmu_mp 0>, <&ipmmu_mp 1>,
+			       <&ipmmu_mp 2>, <&ipmmu_mp 3>,
+			       <&ipmmu_mp 4>, <&ipmmu_mp 5>,
+			       <&ipmmu_mp 6>, <&ipmmu_mp 7>,
+			       <&ipmmu_mp 8>, <&ipmmu_mp 9>,
+			       <&ipmmu_mp 10>, <&ipmmu_mp 11>,
+			       <&ipmmu_mp 12>, <&ipmmu_mp 13>,
+			       <&ipmmu_mp 14>, <&ipmmu_mp 15>;
 		};
 
 		audma1: dma-controller@ec720000 {
@@ -1361,6 +1369,14 @@
 			resets = <&cpg 501>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
+			iommus = <&ipmmu_mp 16>, <&ipmmu_mp 17>,
+			       <&ipmmu_mp 18>, <&ipmmu_mp 19>,
+			       <&ipmmu_mp 20>, <&ipmmu_mp 21>,
+			       <&ipmmu_mp 22>, <&ipmmu_mp 23>,
+			       <&ipmmu_mp 24>, <&ipmmu_mp 25>,
+			       <&ipmmu_mp 26>, <&ipmmu_mp 27>,
+			       <&ipmmu_mp 28>, <&ipmmu_mp 29>,
+			       <&ipmmu_mp 30>, <&ipmmu_mp 31>;
 		};
 
 		usb_dmac0: dma-controller@e65a0000 {
-- 
2.11.0
