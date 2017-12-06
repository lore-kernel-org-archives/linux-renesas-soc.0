Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47467 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754920AbdLFKYW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Dec 2017 05:24:22 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 60/61] ARM: dts: koelsch: Convert to named i2c-gpio bindings
Date: Wed,  6 Dec 2017 11:22:55 +0100
Message-Id: <c14f3ec4ebb0c685b5261380559782caa76bd161.1512555546.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1512555546.git.horms+renesas@verge.net.au>
References: <cover.1512555546.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Commits 7d29f509d2cfd807 ("dt-bindings: i2c: i2c-gpio: Add support for
named gpios") and 05c74778858d7d99 ("i2c: gpio: Add support for named
gpios in DT") introduced named i2c-gpio DT bindings, and deprecated the
more error-prone unnamed variant.

Switch to the new bindings, and add the missing GPIO_OPEN_DRAIN I/O
flags, which were implicitly assumed before.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7791-koelsch.dts | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index fac9cdea4965..a50924d12b6f 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -312,9 +312,8 @@
 		#size-cells = <0>;
 		compatible = "i2c-gpio";
 		status = "disabled";
-		gpios = <&gpio7 16 GPIO_ACTIVE_HIGH /* sda */
-			 &gpio7 15 GPIO_ACTIVE_HIGH /* scl */
-			>;
+		sda-gpios = <&gpio7 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpio7 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		i2c-gpio,delay-us = <5>;
 	};
 
-- 
2.11.0
