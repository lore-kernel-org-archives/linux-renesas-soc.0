Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:57278 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759384AbcJQU3O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Oct 2016 16:29:14 -0400
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id A4647207B1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Oct 2016 22:28:21 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: r8a7795: Remove FCP SoC-specific compatible strings
Date: Mon, 17 Oct 2016 23:29:03 +0300
Message-Id: <1476736143-29937-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1476736143-29937-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1476736143-29937-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The SoC-specific compatible strings have been removed from the FCP DT
bindings, removed them from the device tree.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 8c15040f2540..681f54422375 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1306,28 +1306,28 @@
 		};
 
 		fcpvb1: fcp@fe92f000 {
-			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
+			compatible = "renesas,fcpv";
 			reg = <0 0xfe92f000 0 0x200>;
 			clocks = <&cpg CPG_MOD 606>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 		};
 
 		fcpf0: fcp@fe950000 {
-			compatible = "renesas,r8a7795-fcpf", "renesas,fcpf";
+			compatible = "renesas,fcpf";
 			reg = <0 0xfe950000 0 0x200>;
 			clocks = <&cpg CPG_MOD 615>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 		};
 
 		fcpf1: fcp@fe951000 {
-			compatible = "renesas,r8a7795-fcpf", "renesas,fcpf";
+			compatible = "renesas,fcpf";
 			reg = <0 0xfe951000 0 0x200>;
 			clocks = <&cpg CPG_MOD 614>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 		};
 
 		fcpf2: fcp@fe952000 {
-			compatible = "renesas,r8a7795-fcpf", "renesas,fcpf";
+			compatible = "renesas,fcpf";
 			reg = <0 0xfe952000 0 0x200>;
 			clocks = <&cpg CPG_MOD 613>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
@@ -1344,7 +1344,7 @@
 		};
 
 		fcpvb0: fcp@fe96f000 {
-			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
+			compatible = "renesas,fcpv";
 			reg = <0 0xfe96f000 0 0x200>;
 			clocks = <&cpg CPG_MOD 607>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
@@ -1361,7 +1361,7 @@
 		};
 
 		fcpvi0: fcp@fe9af000 {
-			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
+			compatible = "renesas,fcpv";
 			reg = <0 0xfe9af000 0 0x200>;
 			clocks = <&cpg CPG_MOD 611>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
@@ -1378,7 +1378,7 @@
 		};
 
 		fcpvi1: fcp@fe9bf000 {
-			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
+			compatible = "renesas,fcpv";
 			reg = <0 0xfe9bf000 0 0x200>;
 			clocks = <&cpg CPG_MOD 610>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
@@ -1395,7 +1395,7 @@
 		};
 
 		fcpvi2: fcp@fe9cf000 {
-			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
+			compatible = "renesas,fcpv";
 			reg = <0 0xfe9cf000 0 0x200>;
 			clocks = <&cpg CPG_MOD 609>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
@@ -1412,7 +1412,7 @@
 		};
 
 		fcpvd0: fcp@fea27000 {
-			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
+			compatible = "renesas,fcpv";
 			reg = <0 0xfea27000 0 0x200>;
 			clocks = <&cpg CPG_MOD 603>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
@@ -1429,7 +1429,7 @@
 		};
 
 		fcpvd1: fcp@fea2f000 {
-			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
+			compatible = "renesas,fcpv";
 			reg = <0 0xfea2f000 0 0x200>;
 			clocks = <&cpg CPG_MOD 602>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
@@ -1446,7 +1446,7 @@
 		};
 
 		fcpvd2: fcp@fea37000 {
-			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
+			compatible = "renesas,fcpv";
 			reg = <0 0xfea37000 0 0x200>;
 			clocks = <&cpg CPG_MOD 601>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
@@ -1463,7 +1463,7 @@
 		};
 
 		fcpvd3: fcp@fea3f000 {
-			compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
+			compatible = "renesas,fcpv";
 			reg = <0 0xfea3f000 0 0x200>;
 			clocks = <&cpg CPG_MOD 600>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-- 
Regards,

Laurent Pinchart
