Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:57123 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751310AbeDYIUe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Apr 2018 04:20:34 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a77990: Revise the psci node
Date: Wed, 25 Apr 2018 17:20:10 +0900
Message-Id: <1524644410-12465-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1524644410-12465-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1524644410-12465-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The basic support patch 2d2dbadba421 ("arm64: dts: renesas: Add Renesas
R8A77990 SoC support") lacks the compatible "arm,psci-1.0" in the psci
node. So, this patch revises it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index ba902a2..4658029 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -49,7 +49,7 @@
 	};
 
 	psci {
-		compatible = "arm,psci-0.2";
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
 		method = "smc";
 	};
 
-- 
1.9.1
