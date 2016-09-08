Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46012 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757883AbcIHHnz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Sep 2016 03:43:55 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 08/30] arm64: dts: renesas: r8a7795: Add FCPV nodes
Date: Thu,  8 Sep 2016 09:43:04 +0200
Message-Id: <52cd078325e5476896dd7027c8398145955489e9.1473320411.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1473320411.git.horms+renesas@verge.net.au>
References: <cover.1473320411.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The FCPs handle the interface between various IP cores and memory. Add
the instances related to the VSP2s.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 63 ++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 58376e72404b..fe7725d1d131 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1295,6 +1295,13 @@
 			status = "disabled";
 		};
 
+		fcpvb1: fcp@fe92f000 {
+			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
+			reg = <0 0xfe92f000 0 0x200>;
+			clocks = <&cpg CPG_MOD 606>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+		};
+
 		fcpf0: fcp@fe950000 {
 			compatible = "renesas,r8a7795-fcpf", "renesas,fcpf";
 			reg = <0 0xfe950000 0 0x200>;
@@ -1316,6 +1323,62 @@
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 		};
 
+		fcpvb0: fcp@fe96f000 {
+			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
+			reg = <0 0xfe96f000 0 0x200>;
+			clocks = <&cpg CPG_MOD 607>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+		};
+
+		fcpvi0: fcp@fe9af000 {
+			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
+			reg = <0 0xfe9af000 0 0x200>;
+			clocks = <&cpg CPG_MOD 611>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+		};
+
+		fcpvi1: fcp@fe9bf000 {
+			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
+			reg = <0 0xfe9bf000 0 0x200>;
+			clocks = <&cpg CPG_MOD 610>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+		};
+
+		fcpvi2: fcp@fe9cf000 {
+			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
+			reg = <0 0xfe9cf000 0 0x200>;
+			clocks = <&cpg CPG_MOD 609>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+		};
+
+		fcpvd0: fcp@fea27000 {
+			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
+			reg = <0 0xfea27000 0 0x200>;
+			clocks = <&cpg CPG_MOD 603>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+		};
+
+		fcpvd1: fcp@fea2f000 {
+			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
+			reg = <0 0xfea2f000 0 0x200>;
+			clocks = <&cpg CPG_MOD 602>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+		};
+
+		fcpvd2: fcp@fea37000 {
+			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
+			reg = <0 0xfea37000 0 0x200>;
+			clocks = <&cpg CPG_MOD 601>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+		};
+
+		fcpvd3: fcp@fea3f000 {
+			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
+			reg = <0 0xfea3f000 0 0x200>;
+			clocks = <&cpg CPG_MOD 600>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+		};
+
 		fdp1@fe940000 {
 			compatible = "renesas,fdp1";
 			reg = <0 0xfe940000 0 0x2400>;
-- 
2.7.0.rc3.207.g0ac5344
