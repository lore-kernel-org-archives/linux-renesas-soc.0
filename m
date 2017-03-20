Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36673 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753398AbdCTI7z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2017 04:59:55 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 06/31] ARM: dts: r8a7743: Remove unit-address and reg from integrated cache
Date: Mon, 20 Mar 2017 09:57:45 +0100
Message-Id: <37f0c804e57ac93ca37a98aa5a210c6b73e6572a.1489999062.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1489999062.git.horms+renesas@verge.net.au>
References: <cover.1489999062.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

The Cortex-A15 cache controller is an integrated controller, and thus
the device node representing it should not have a unit-addresses or reg
property.

Fixes: 34e8d993a68ae459 ("ARM: dts: r8a7743: initial SoC device tree")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7743.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index c166be2f18e0..cd908796fb3b 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -32,9 +32,8 @@
 			next-level-cache = <&L2_CA15>;
 		};
 
-		L2_CA15: cache-controller@0 {
+		L2_CA15: cache-controller-0 {
 			compatible = "cache";
-			reg = <0>;
 			cache-unified;
 			cache-level = <2>;
 			power-domains = <&sysc R8A7743_PD_CA15_SCU>;
-- 
2.7.0.rc3.207.g0ac5344
