Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:51397 "EHLO
	albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933313AbcFJNBR (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 10 Jun 2016 09:01:17 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 02/19] ARM: dts: ape6evm: Name mmc pfc subnode after device name
Date: Fri, 10 Jun 2016 15:00:48 +0200
Message-Id: <1465563665-2231-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1465563665-2231-1-git-send-email-geert+renesas@glider.be>
References: <1465563665-2231-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Name the Pin Function Controller subnode for MMC0 after its device name,
instead of using the generic and indexless "mmc".

This avoids conflicts when enabling support for more MMC interfaces
later, either here or in a DT overlay.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a73a4-ape6evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a73a4-ape6evm.dts b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
index 5bccc7d229d766c7..ec7c86e06538677a 100644
--- a/arch/arm/boot/dts/r8a73a4-ape6evm.dts
+++ b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
@@ -193,7 +193,7 @@
 		function = "scifa0";
 	};
 
-	mmc0_pins: mmc {
+	mmc0_pins: mmc0 {
 		groups = "mmc0_data8", "mmc0_ctrl";
 		function = "mmc0";
 	};
-- 
1.9.1
