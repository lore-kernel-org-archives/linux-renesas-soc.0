Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34793 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752162AbdI2Lys (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 07:54:48 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 33/48] ARM: dts: alt: use correct logic for SD WP pins
Date: Fri, 29 Sep 2017 13:53:25 +0200
Message-Id: <a2f74d0e655eac78dbbd4ade88ee08b1f8ec7ec1.1506683482.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1506683482.git.horms+renesas@verge.net.au>
References: <cover.1506683482.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

The WP pins are ACTIVE_HIGH, fix it in the DTS.

Fixes: 2b41091b896b ("ARM: dts: alt: add SDHI0 and 1 support")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7794-alt.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7794-alt.dts b/arch/arm/boot/dts/r8a7794-alt.dts
index e45f92b5eb11..bd98790d964e 100644
--- a/arch/arm/boot/dts/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/r8a7794-alt.dts
@@ -304,7 +304,7 @@
 	vmmc-supply = <&vcc_sdhi0>;
 	vqmmc-supply = <&vccq_sdhi0>;
 	cd-gpios = <&gpio6 6 GPIO_ACTIVE_LOW>;
-	wp-gpios = <&gpio6 7 GPIO_ACTIVE_LOW>;
+	wp-gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;
 	sd-uhs-sdr50;
 	sd-uhs-sdr104;
 	status = "okay";
@@ -318,7 +318,7 @@
 	vmmc-supply = <&vcc_sdhi1>;
 	vqmmc-supply = <&vccq_sdhi1>;
 	cd-gpios = <&gpio6 14 GPIO_ACTIVE_LOW>;
-	wp-gpios = <&gpio6 15 GPIO_ACTIVE_LOW>;
+	wp-gpios = <&gpio6 15 GPIO_ACTIVE_HIGH>;
 	sd-uhs-sdr50;
 	status = "okay";
 };
-- 
2.1.4
