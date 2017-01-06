Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43774 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S940156AbdAFLSo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jan 2017 06:18:44 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 02/25] ARM: dts: r8a7745: Move RST node before SYSC node
Date: Fri,  6 Jan 2017 12:18:11 +0100
Message-Id: <13ae6ac495846b54ad47d71075bbaf9d8224d356.1483700969.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1483700969.git.horms+renesas@verge.net.au>
References: <cover.1483700969.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

To preserve both alphabetical (label) and numerical ordering (unit
address).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7745.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
index 0b2e2f37150f..0a5d7872ce28 100644
--- a/arch/arm/boot/dts/r8a7745.dtsi
+++ b/arch/arm/boot/dts/r8a7745.dtsi
@@ -102,17 +102,17 @@
 			#power-domain-cells = <0>;
 		};
 
+		rst: reset-controller@e6160000 {
+			compatible = "renesas,r8a7745-rst";
+			reg = <0 0xe6160000 0 0x100>;
+		};
+
 		sysc: system-controller@e6180000 {
 			compatible = "renesas,r8a7745-sysc";
 			reg = <0 0xe6180000 0 0x200>;
 			#power-domain-cells = <1>;
 		};
 
-		rst: reset-controller@e6160000 {
-			compatible = "renesas,r8a7745-rst";
-			reg = <0 0xe6160000 0 0x100>;
-		};
-
 		dmac0: dma-controller@e6700000 {
 			compatible = "renesas,dmac-r8a7745",
 				     "renesas,rcar-dmac";
-- 
2.7.0.rc3.207.g0ac5344
