Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750888AbeERLQi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:16:38 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 034/102] arm64: dts: renesas: draak: Rename EtherAVB "mdc" pin group to "mdio"
Date: Fri, 18 May 2018 13:14:56 +0200
Message-Id: <5f7d7808ae1162d55b835cb2faf31db19b69fdf2.1526637994.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526637994.git.horms+renesas@verge.net.au>
References: <cover.1526637994.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

On other Renesas SoCs, the pin group for the MDIO bus is named "mdio"
instead of "mdc".  Fix the inconsistency, now the pinctrl drivers for
R-Car H3, M3-W, and M3-N have gained support for the traditional pin
group name.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index d03f19414028..9d73de8bc94d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -91,7 +91,7 @@
 &pfc {
 	avb0_pins: avb {
 		mux {
-			groups = "avb0_link", "avb0_mdc", "avb0_mii";
+			groups = "avb0_link", "avb0_mdio", "avb0_mii";
 			function = "avb0";
 		};
 	};
-- 
2.11.0
