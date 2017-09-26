Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54385 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967963AbdIZKGS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2017 06:06:18 -0400
Received: from avalon.guest.par1.mozilla.com (unknown [IPv6:2a00:8c40:243:232:120b:a9ff:fe3c:7148])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id E982921480
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2017 12:06:05 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [RFC 06/13] arm64: dts: r8a7795: Reference the lossy memory region from the FCPss
Date: Tue, 26 Sep 2017 13:05:58 +0300
Message-Id: <20170926100605.2313-9-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The FCPV instances can perform transparent near-lossless compression
internally but need the DDR controller to perform decompression.
Reference the DDR controller lossy decompression memory region to model
that relationship.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 1320ec3b6a5e..c55003563f61 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1901,6 +1901,9 @@
 
 		fcpvb1: fcp@fe92f000 {
 			compatible = "renesas,fcpv";
+			memory-region = <&lossy_decompression_0
+					 &lossy_decompression_1
+					 &lossy_decompression_2>;
 			reg = <0 0xfe92f000 0 0x200>;
 			clocks = <&cpg CPG_MOD 606>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
@@ -1936,6 +1939,9 @@
 
 		fcpvb0: fcp@fe96f000 {
 			compatible = "renesas,fcpv";
+			memory-region = <&lossy_decompression_0
+					 &lossy_decompression_1
+					 &lossy_decompression_2>;
 			reg = <0 0xfe96f000 0 0x200>;
 			clocks = <&cpg CPG_MOD 607>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
@@ -1955,6 +1961,9 @@
 
 		fcpvi0: fcp@fe9af000 {
 			compatible = "renesas,fcpvi", "renesas,fcpv";
+			memory-region = <&lossy_decompression_0
+					 &lossy_decompression_1
+					 &lossy_decompression_2>;
 			reg = <0 0xfe9af000 0 0x200>;
 			clocks = <&cpg CPG_MOD 611>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
@@ -1974,6 +1983,9 @@
 
 		fcpvi1: fcp@fe9bf000 {
 			compatible = "renesas,fcpvi", "renesas,fcpv";
+			memory-region = <&lossy_decompression_0
+					 &lossy_decompression_1
+					 &lossy_decompression_2>;
 			reg = <0 0xfe9bf000 0 0x200>;
 			clocks = <&cpg CPG_MOD 610>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
@@ -1993,6 +2005,9 @@
 
 		fcpvd0: fcp@fea27000 {
 			compatible = "renesas,fcpv";
+			memory-region = <&lossy_decompression_0
+					 &lossy_decompression_1
+					 &lossy_decompression_2>;
 			reg = <0 0xfea27000 0 0x200>;
 			clocks = <&cpg CPG_MOD 603>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
@@ -2012,6 +2027,9 @@
 
 		fcpvd1: fcp@fea2f000 {
 			compatible = "renesas,fcpv";
+			memory-region = <&lossy_decompression_0
+					 &lossy_decompression_1
+					 &lossy_decompression_2>;
 			reg = <0 0xfea2f000 0 0x200>;
 			clocks = <&cpg CPG_MOD 602>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
@@ -2031,6 +2049,9 @@
 
 		fcpvd2: fcp@fea37000 {
 			compatible = "renesas,fcpv";
+			memory-region = <&lossy_decompression_0
+					 &lossy_decompression_1
+					 &lossy_decompression_2>;
 			reg = <0 0xfea37000 0 0x200>;
 			clocks = <&cpg CPG_MOD 601>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-- 
Regards,

Laurent Pinchart
