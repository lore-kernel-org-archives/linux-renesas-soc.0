Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54385 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965482AbdIZKGR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2017 06:06:17 -0400
Received: from avalon.guest.par1.mozilla.com (unknown [IPv6:2a00:8c40:243:232:120b:a9ff:fe3c:7148])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 8ACEC21475
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2017 12:06:05 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [RFC 04/13] arm64: dts: renesas: Use renesas,fcpvi compatible string
Date: Tue, 26 Sep 2017 13:05:56 +0300
Message-Id: <20170926100605.2313-7-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The FCP instances associated with a VSPI must be treated differently
than the ones associated with another type of VSP. Use the appropriate
compatible string.

The fallback renesas,fcpv compatible string allows for backward
compatibility with platforms that don't recognize the new compatible
string yet.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi     | 4 ++--
 arch/arm64/boot/dts/renesas/r8a7796.dtsi     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index 655dd30639c5..0fe4093434a5 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -49,7 +49,7 @@
 	};
 
 	fcpvi2: fcp@fe9cf000 {
-		compatible = "renesas,fcpv";
+		compatible = "renesas,fcpvi", "renesas,fcpv";
 		reg = <0 0xfe9cf000 0 0x200>;
 		clocks = <&cpg CPG_MOD 609>;
 		power-domains = <&sysc R8A7795_PD_A3VP>;
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index d5cfd1a1c539..ce2a59361a82 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1922,7 +1922,7 @@
 		};
 
 		fcpvi0: fcp@fe9af000 {
-			compatible = "renesas,fcpv";
+			compatible = "renesas,fcpvi", "renesas,fcpv";
 			reg = <0 0xfe9af000 0 0x200>;
 			clocks = <&cpg CPG_MOD 611>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
@@ -1941,7 +1941,7 @@
 		};
 
 		fcpvi1: fcp@fe9bf000 {
-			compatible = "renesas,fcpv";
+			compatible = "renesas,fcpvi", "renesas,fcpv";
 			reg = <0 0xfe9bf000 0 0x200>;
 			clocks = <&cpg CPG_MOD 610>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 57ac5ca6ed98..38b3d8f9c9d2 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1719,7 +1719,7 @@
 		};
 
 		fcpvi0: fcp@fe9af000 {
-			compatible = "renesas,fcpv";
+			compatible = "renesas,fcpvi", "renesas,fcpv";
 			reg = <0 0xfe9af000 0 0x200>;
 			clocks = <&cpg CPG_MOD 611>;
 			power-domains = <&sysc R8A7796_PD_A3VC>;
-- 
Regards,

Laurent Pinchart
