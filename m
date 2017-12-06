Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47467 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754893AbdLFKXz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Dec 2017 05:23:55 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 44/61] ARM: dts: genmai: Correct primary compatible value for eeprom
Date: Wed,  6 Dec 2017 11:22:39 +0100
Message-Id: <8edeee392f5971054bfbad43715d0c0d077e13bf.1512555546.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1512555546.git.horms+renesas@verge.net.au>
References: <cover.1512555546.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

The Renesas part number of the two-wire serial interface EEPROM is not
24C128, but R1EX24128ASA00A.

Hence change its primary compatible value to "renesas,r1ex24128".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s72100-genmai.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
index cd4d5ff7749e..5af2a0116ff2 100644
--- a/arch/arm/boot/dts/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/r7s72100-genmai.dts
@@ -123,7 +123,7 @@
 	pinctrl-0 = <&i2c2_pins>;
 
 	eeprom@50 {
-		compatible = "renesas,24c128", "atmel,24c128";
+		compatible = "renesas,r1ex24128", "atmel,24c128";
 		reg = <0x50>;
 		pagesize = <64>;
 	};
-- 
2.11.0
