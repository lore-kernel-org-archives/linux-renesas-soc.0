Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:20308 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751250AbdH2Hkd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Aug 2017 03:40:33 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] arm64: dts: r8a77995: update PFC node name to pin-controller
Date: Tue, 29 Aug 2017 16:35:59 +0900
Message-Id: <1503992159-16354-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch changes the name from from e6060000.pfc and pfc@e6060000 to
e6060000.pin-controller and pin-controller@e6060000 like other Renesas
SoCs.

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index d0f95b7..72c3033 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -122,7 +122,7 @@
 			reg = <0 0xe6160000 0 0x0200>;
 		};
 
-		pfc: pfc@e6060000 {
+		pfc: pin-controller@e6060000 {
 			compatible = "renesas,pfc-r8a77995";
 			reg = <0 0xe6060000 0 0x508>;
 		};
-- 
1.9.1
