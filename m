Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:60942 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750837AbdJCFBB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Oct 2017 01:01:01 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/3] arm64: dts: renesas: salvator-common: drop "avb_phy_int" from avb_pins
Date: Tue,  3 Oct 2017 13:57:11 +0900
Message-Id: <1507006633-28258-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1507006633-28258-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1507006633-28258-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Since the Ethernet AVB driver doesn't support AVB_PHY_INT handling
and it will be handled by a phy driver as a gpio pin, this patch
removes the "avb_phy_int" from the avb_pins node.

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Fixes: 7d73a4da2681 ("arm64: dts: r8a7795: salvator-x: Set drive-strength for ravb pins")
Fixes: 4903987033be ("arm64: dts: r8a7796: salvator-x: Set drive-strength for ravb pins")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index d9d8850..e41e53b 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -381,8 +381,7 @@
 
 	avb_pins: avb {
 		mux {
-			groups = "avb_link", "avb_phy_int", "avb_mdc",
-				 "avb_mii";
+			groups = "avb_link", "avb_mdc", "avb_mii";
 			function = "avb";
 		};
 
-- 
1.9.1
