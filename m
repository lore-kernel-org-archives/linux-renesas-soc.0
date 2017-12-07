Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35788 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750919AbdLGJzA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Dec 2017 04:55:00 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 22/54] arm64: dts: renesas: r8a7795: Tie Audio-DMAC to IPMMU-MP0/1
Date: Thu,  7 Dec 2017 10:53:25 +0100
Message-Id: <c2b57f76a725b65a24bae0fd1486b58addb7d75f.1512640145.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1512640145.git.horms+renesas@verge.net.au>
References: <cover.1512640145.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Hook up r8a7795 ES2.0 Audio-DMAC nodes to the IPMMU-MP0.
Hook up r8a7795 ES1.x Audio-DMAC nodes to the IPMMU-MP1.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 22 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi     | 16 ++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index 38b7cfb3b428..2dfe8108072c 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -127,6 +127,28 @@
 	renesas,ipmmu-main = <&ipmmu_mm 7>;
 };
 
+&audma0 {
+	iommus = <&ipmmu_mp1 0>, <&ipmmu_mp1 1>,
+	       <&ipmmu_mp1 2>, <&ipmmu_mp1 3>,
+	       <&ipmmu_mp1 4>, <&ipmmu_mp1 5>,
+	       <&ipmmu_mp1 6>, <&ipmmu_mp1 7>,
+	       <&ipmmu_mp1 8>, <&ipmmu_mp1 9>,
+	       <&ipmmu_mp1 10>, <&ipmmu_mp1 11>,
+	       <&ipmmu_mp1 12>, <&ipmmu_mp1 13>,
+	       <&ipmmu_mp1 14>, <&ipmmu_mp1 15>;
+};
+
+&audma1 {
+	iommus = <&ipmmu_mp1 16>, <&ipmmu_mp1 17>,
+	       <&ipmmu_mp1 18>, <&ipmmu_mp1 19>,
+	       <&ipmmu_mp1 20>, <&ipmmu_mp1 21>,
+	       <&ipmmu_mp1 22>, <&ipmmu_mp1 23>,
+	       <&ipmmu_mp1 24>, <&ipmmu_mp1 25>,
+	       <&ipmmu_mp1 26>, <&ipmmu_mp1 27>,
+	       <&ipmmu_mp1 28>, <&ipmmu_mp1 29>,
+	       <&ipmmu_mp1 30>, <&ipmmu_mp1 31>;
+};
+
 &du {
 	vsps = <&vspd0 &vspd1 &vspd2 &vspd3>;
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index af200aa55fce..2ca746c304d5 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -724,6 +724,14 @@
 			resets = <&cpg 502>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
+			iommus = <&ipmmu_mp0 0>, <&ipmmu_mp0 1>,
+			       <&ipmmu_mp0 2>, <&ipmmu_mp0 3>,
+			       <&ipmmu_mp0 4>, <&ipmmu_mp0 5>,
+			       <&ipmmu_mp0 6>, <&ipmmu_mp0 7>,
+			       <&ipmmu_mp0 8>, <&ipmmu_mp0 9>,
+			       <&ipmmu_mp0 10>, <&ipmmu_mp0 11>,
+			       <&ipmmu_mp0 12>, <&ipmmu_mp0 13>,
+			       <&ipmmu_mp0 14>, <&ipmmu_mp0 15>;
 		};
 
 		audma1: dma-controller@ec720000 {
@@ -758,6 +766,14 @@
 			resets = <&cpg 501>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
+			iommus = <&ipmmu_mp0 16>, <&ipmmu_mp0 17>,
+			       <&ipmmu_mp0 18>, <&ipmmu_mp0 19>,
+			       <&ipmmu_mp0 20>, <&ipmmu_mp0 21>,
+			       <&ipmmu_mp0 22>, <&ipmmu_mp0 23>,
+			       <&ipmmu_mp0 24>, <&ipmmu_mp0 25>,
+			       <&ipmmu_mp0 26>, <&ipmmu_mp0 27>,
+			       <&ipmmu_mp0 28>, <&ipmmu_mp0 29>,
+			       <&ipmmu_mp0 30>, <&ipmmu_mp0 31>;
 		};
 
 		avb: ethernet@e6800000 {
-- 
2.11.0
