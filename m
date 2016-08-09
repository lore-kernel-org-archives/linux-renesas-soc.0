Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:36598 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932224AbcHIM3J (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 9 Aug 2016 08:29:09 -0400
Received: from avalon.bb.dnainternet.fi (85-23-193-79.bb.dnainternet.fi [85.23.193.79])
	by galahad.ideasonboard.com (Postfix) with ESMTPSA id 8F39F207F0
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Aug 2016 14:28:56 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/4] arm64: dts: renesas: r8a7795: Add FCPV nodes
Date: Tue,  9 Aug 2016 15:29:09 +0300
Message-Id: <1470745752-23738-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1470745752-23738-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1470745752-23738-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The FCPs handle the interface between various IP cores and memory. Add
the instances related to the VSP2s.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 63 ++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 99953ca9a45e..f8b1c421e845 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1274,6 +1274,13 @@
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
@@ -1295,6 +1302,62 @@
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
Regards,

Laurent Pinchart
