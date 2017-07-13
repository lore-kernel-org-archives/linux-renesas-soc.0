Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37527 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751150AbdGMK6X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2017 06:58:23 -0400
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 510B0201F5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jul 2017 12:57:51 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: renesas: r8a7796: Add resets property to FCP devices
Date: Thu, 13 Jul 2017 13:58:21 +0300
Message-Id: <20170713105822.5327-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The FCP nodes are missing the resets property. Add it.

Fixes: 7153c69fb8e1 ("arm64: dts: renesas: r8a7796: Add FCPF and FCPV instances")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 6d0048d7394a..1eef59f6fb63 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1567,6 +1567,7 @@
 			reg = <0 0xfe950000 0 0x200>;
 			clocks = <&cpg CPG_MOD 615>;
 			power-domains = <&sysc R8A7796_PD_A3VC>;
+			resets = <&cpg 615>;
 		};
 
 		vspb: vsp@fe960000 {
@@ -1584,6 +1585,7 @@
 			reg = <0 0xfe96f000 0 0x200>;
 			clocks = <&cpg CPG_MOD 607>;
 			power-domains = <&sysc R8A7796_PD_A3VC>;
+			resets = <&cpg 607>;
 		};
 
 		vspi0: vsp@fe9a0000 {
@@ -1601,6 +1603,7 @@
 			reg = <0 0xfe9af000 0 0x200>;
 			clocks = <&cpg CPG_MOD 611>;
 			power-domains = <&sysc R8A7796_PD_A3VC>;
+			resets = <&cpg 611>;
 		};
 
 		vspd0: vsp@fea20000 {
@@ -1618,6 +1621,7 @@
 			reg = <0 0xfea27000 0 0x200>;
 			clocks = <&cpg CPG_MOD 603>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 603>;
 		};
 
 		vspd1: vsp@fea28000 {
@@ -1635,6 +1639,7 @@
 			reg = <0 0xfea2f000 0 0x200>;
 			clocks = <&cpg CPG_MOD 602>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 602>;
 		};
 
 		vspd2: vsp@fea30000 {
@@ -1652,6 +1657,7 @@
 			reg = <0 0xfea37000 0 0x200>;
 			clocks = <&cpg CPG_MOD 601>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 601>;
 		};
 
 		hdmi0: hdmi@fead0000 {
-- 
Regards,

Laurent Pinchart
