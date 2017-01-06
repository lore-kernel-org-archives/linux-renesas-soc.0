Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43610 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S940137AbdAFLSO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jan 2017 06:18:14 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 07/16] arm64: dts: r8a7795: add sound CTU support
Date: Fri,  6 Jan 2017 12:17:49 +0100
Message-Id: <c9293d784d32c868e83079bb6d1e26f316c4148d.1483700694.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1483700694.git.horms+renesas@verge.net.au>
References: <cover.1483700694.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch adds CTU (= Channel Transfer Unit) support which is needed
to sound mixing.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |  1 +
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index bcaf4008d32d..82a269a4f10d 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -412,6 +412,7 @@
 		 <&cpg CPG_MOD 1026>, <&cpg CPG_MOD 1027>,
 		 <&cpg CPG_MOD 1028>, <&cpg CPG_MOD 1029>,
 		 <&cpg CPG_MOD 1030>, <&cpg CPG_MOD 1031>,
+		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
 		 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
 		 <&audio_clk_a>, <&cs2000>,
 		 <&audio_clk_c>,
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 2c076c21d7fa..e09f5b7b874a 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -919,6 +919,7 @@
 				 <&cpg CPG_MOD 1026>, <&cpg CPG_MOD 1027>,
 				 <&cpg CPG_MOD 1028>, <&cpg CPG_MOD 1029>,
 				 <&cpg CPG_MOD 1030>, <&cpg CPG_MOD 1031>,
+				 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
 				 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
 				 <&audio_clk_a>, <&audio_clk_b>,
 				 <&audio_clk_c>,
@@ -930,6 +931,7 @@
 				      "src.9", "src.8", "src.7", "src.6",
 				      "src.5", "src.4", "src.3", "src.2",
 				      "src.1", "src.0",
+				      "ctu.1", "ctu.0",
 				      "dvc.0", "dvc.1",
 				      "clk_a", "clk_b", "clk_c", "clk_i";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
@@ -946,6 +948,17 @@
 				};
 			};
 
+			rcar_sound,ctu {
+				ctu00: ctu-0 { };
+				ctu01: ctu-1 { };
+				ctu02: ctu-2 { };
+				ctu03: ctu-3 { };
+				ctu10: ctu-4 { };
+				ctu11: ctu-5 { };
+				ctu12: ctu-6 { };
+				ctu13: ctu-7 { };
+			};
+
 			rcar_sound,src {
 				src0: src-0 {
 					interrupts = <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.7.0.rc3.207.g0ac5344
