Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54687 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933502AbdDGP6n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Apr 2017 11:58:43 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 03/22] ARM: dts: r7s72100: add power-domains to sdhi
Date: Fri,  7 Apr 2017 11:58:04 -0400
Message-Id: <3932197c01e4ca7d743d07728656d938f1ae93d5.1491580547.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1491580547.git.horms+renesas@verge.net.au>
References: <cover.1491580547.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Chris Brandt <chris.brandt@renesas.com>

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Fixes: 66474697923c ("ARM: dts: r7s72100: add sdhi to device tree")
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s72100.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 9b12d73e67dc..9fb2e510958a 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -501,6 +501,7 @@
 		clocks = <&mstp12_clks R7S72100_CLK_SDHI00>,
 			 <&mstp12_clks R7S72100_CLK_SDHI01>;
 		clock-names = "core", "cd";
+		power-domains = <&cpg_clocks>;
 		cap-sd-highspeed;
 		cap-sdio-irq;
 		status = "disabled";
@@ -516,6 +517,7 @@
 		clocks = <&mstp12_clks R7S72100_CLK_SDHI10>,
 			 <&mstp12_clks R7S72100_CLK_SDHI11>;
 		clock-names = "core", "cd";
+		power-domains = <&cpg_clocks>;
 		cap-sd-highspeed;
 		cap-sdio-irq;
 		status = "disabled";
-- 
2.7.0.rc3.207.g0ac5344
