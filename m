Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:25469 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750873AbdJCFBF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Oct 2017 01:01:05 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/3] arm64: dts: renesas: r8a77995: draak: drop "avb_phy_int" from avb_pins
Date: Tue,  3 Oct 2017 13:57:13 +0900
Message-Id: <1507006633-28258-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1507006633-28258-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1507006633-28258-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Since the Ethernet AVB driver doesn't support AVB_PHY_INT handling
and it will be handled by a phy driver as a gpio pin, this patch
removes the "avb_phy_int" from the avb_pins node.

Reported-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Fixes: 4503b50eac08 ("arm64: dts: renesas: r8a77995: draak: enable EthernetAVB")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index 96b7ff5..fac58be 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -41,8 +41,7 @@
 &pfc {
 	avb0_pins: avb {
 		mux {
-			groups = "avb0_link", "avb0_phy_int", "avb0_mdc",
-				 "avb0_mii";
+			groups = "avb0_link", "avb0_mdc", "avb0_mii";
 			function = "avb0";
 		};
 	};
-- 
1.9.1
