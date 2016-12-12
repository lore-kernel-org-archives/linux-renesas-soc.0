Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57225 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750991AbcLLIaU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2016 03:30:20 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] arm64: dts: h3ulcb: Provide sd0_uhs node
Date: Mon, 12 Dec 2016 09:30:13 +0100
Message-Id: <8ebcb400af619ee0ddeb39c06fc35511b20cc697.1481530910.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1481530910.git.horms+renesas@verge.net.au>
References: <cover.1481530910.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Provide separaate sd0 and sd0_uhs nodes rather than duplicate sd0 nodes.

Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Fixes: 93373c309a70 ("arm64: dts: h3ulcb: rename SDHI0 pins")
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
index 6ffb0517421a..dbea2c3d8f0c 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
@@ -169,7 +169,7 @@
 		power-source = <3300>;
 	};
 
-	sdhi0_pins_uhs: sd0 {
+	sdhi0_pins_uhs: sd0_uhs {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
 		power-source = <1800>;
-- 
2.7.0.rc3.207.g0ac5344
