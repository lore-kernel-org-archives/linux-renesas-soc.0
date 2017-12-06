Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47467 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754950AbdLFKYY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Dec 2017 05:24:24 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 43/61] ARM: dts: koelsch: Correct primary compatible value for eeprom
Date: Wed,  6 Dec 2017 11:22:38 +0100
Message-Id: <8834d8667b8509e5968e5689790c4ac5410b47db.1512555546.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1512555546.git.horms+renesas@verge.net.au>
References: <cover.1512555546.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

The Renesas part number of the two-wire serial interface EEPROM is not
24C02, but R1EX24002ATAS0G.

Hence change its primary compatible value to "renesas,r1ex24002", like
on Gose.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7791-koelsch.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index 4126de417922..fac9cdea4965 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -708,7 +708,7 @@
 	};
 
 	eeprom@50 {
-		compatible = "renesas,24c02", "atmel,24c02";
+		compatible = "renesas,r1ex24002", "atmel,24c02";
 		reg = <0x50>;
 		pagesize = <16>;
 	};
-- 
2.11.0
