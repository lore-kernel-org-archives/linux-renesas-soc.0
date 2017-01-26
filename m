Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46334 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753086AbdAZKLZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 05:11:25 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 7/7] ARM: dts: r7s72100: add power-domains to mmcif
Date: Thu, 26 Jan 2017 11:11:09 +0100
Message-Id: <5786ac14239a0809ca13e6a6f77147e6bb04aa29.1485425227.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1485425227.git.horms+renesas@verge.net.au>
References: <cover.1485425227.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Chris Brandt <chris.brandt@renesas.com>

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s72100.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 74e684f3c1c7..b8aa256bd515 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -475,6 +475,7 @@
 			      GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH
 			      GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp8_clks R7S72100_CLK_MMCIF>;
+		power-domains = <&cpg_clocks>;
 		reg-io-width = <4>;
 		bus-width = <8>;
 		status = "disabled";
-- 
2.7.0.rc3.207.g0ac5344
