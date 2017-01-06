Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43610 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S940138AbdAFLSP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jan 2017 06:18:15 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 09/16] arm64: dts: r8a7795: Use Gen 3 fallback compat string for PCIE
Date: Fri,  6 Jan 2017 12:17:51 +0100
Message-Id: <fb04f4b8bd7ecf337a8cbebe176e0bbdd954ba31.1483700694.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1483700694.git.horms+renesas@verge.net.au>
References: <cover.1483700694.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use recently added en 3 fallback compat string for PCIE
in r8a7795 DT.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 7e21491c6510..91a797b18c11 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1279,7 +1279,8 @@
 		};
 
 		pciec0: pcie@fe000000 {
-			compatible = "renesas,pcie-r8a7795";
+			compatible = "renesas,pcie-r8a7795",
+				     "renesas,pcie-rcar-gen3";
 			reg = <0 0xfe000000 0 0x80000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -1304,7 +1305,8 @@
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
