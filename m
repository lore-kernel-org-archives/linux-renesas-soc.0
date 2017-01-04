Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:44402 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S968690AbdADRkC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jan 2017 12:40:02 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RESEND 2/2] arm64: dts: r8a7796: enable HS200 for eMMC
Date: Wed,  4 Jan 2017 18:39:54 +0100
Message-Id: <20170104173954.3135-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20170104173954.3135-1-wsa+renesas@sang-engineering.com>
References: <20170104173954.3135-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index f35e96ca7d6050..5fa6e91953d494 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
@@ -184,6 +184,7 @@
 	vmmc-supply = <&reg_3p3v>;
 	vqmmc-supply = <&reg_1p8v>;
 	bus-width = <8>;
+	mmc-hs200-1_8v;
 	non-removable;
 	status = "okay";
 };
-- 
2.10.2
