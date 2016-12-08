Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34614 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750851AbcLHPbA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Dec 2016 10:31:00 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH renesas/devel] arm64: dts: r8a7795: Use Gen 3 fallback compat string for PCIE
Date: Thu,  8 Dec 2016 16:29:29 +0100
Message-Id: <1481210969-2574-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use recently added en 3 fallback compat string for PCIE
in r8a7795 DT.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Based on renesas-devel-20161207-v4.9-rc8
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 598bec1629cf..e8718e7d8d97 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1259,7 +1259,8 @@
 		};
 
 		pciec0: pcie@fe000000 {
-			compatible = "renesas,pcie-r8a7795";
+			compatible = "renesas,pcie-r8a7795",
+				     "renesas,pcie-rcar-gen3";
 			reg = <0 0xfe000000 0 0x80000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -1284,7 +1285,8 @@
 		};
 
 		pciec1: pcie@ee800000 {
-			compatible = "renesas,pcie-r8a7795";
+			compatible = "renesas,pcie-r8a7795",
+				     "renesas,pcie-rcar-gen3";
 			reg = <0 0xee800000 0 0x80000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
-- 
2.7.0.rc3.207.g0ac5344
