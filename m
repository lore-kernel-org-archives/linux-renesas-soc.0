Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:46792 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750738AbdKPNvl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Nov 2017 08:51:41 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] ARM: dts: koelsch: Correct primary compatible value for eeprom
Date: Thu, 16 Nov 2017 14:51:35 +0100
Message-Id: <1510840296-12767-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1510840296-12767-1-git-send-email-geert+renesas@glider.be>
References: <1510840296-12767-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The Renesas part number of the two-wire serial interface EEPROM is not
24C02, but R1EX24002ATAS0G.

Hence change its primary compatible value to "renesas,r1ex24002", like
on Gose.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7791-koelsch.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index 4126de4179224261..fac9cdea49650591 100644
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
2.7.4
