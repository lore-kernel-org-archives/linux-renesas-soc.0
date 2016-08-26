Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46520 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751014AbcHZOAL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2016 10:00:11 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/4] ARM: dts: gose: remove label property from led nodes
Date: Fri, 26 Aug 2016 15:49:41 +0200
Message-Id: <1472219382-22789-4-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1472219382-22789-1-git-send-email-horms+renesas@verge.net.au>
References: <1472219382-22789-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Remove label property from led nodes. This seems to have little
value and is used inconsistently amongst Renesas SoCs.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7793-gose.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7793-gose.dts b/arch/arm/boot/dts/r8a7793-gose.dts
index 90af18600124..c63213c7a173 100644
--- a/arch/arm/boot/dts/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/r8a7793-gose.dts
@@ -146,15 +146,12 @@
 		compatible = "gpio-leds";
 		led6 {
 			gpios = <&gpio2 19 GPIO_ACTIVE_HIGH>;
-			label = "LED6";
 		};
 		led7 {
 			gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
-			label = "LED7";
 		};
 		led8 {
 			gpios = <&gpio2 21 GPIO_ACTIVE_HIGH>;
-			label = "LED8";
 		};
 	};
 
-- 
2.7.0.rc3.207.g0ac5344
