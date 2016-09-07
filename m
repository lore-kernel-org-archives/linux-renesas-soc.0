Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57254 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934191AbcIGHup (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Sep 2016 03:50:45 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 11/26] ARM: dts: blanche: add support for general purpose LEDs
Date: Wed,  7 Sep 2016 09:49:58 +0200
Message-Id: <996453571b33ba2ae07211ff9e8a09b28e49aec5.1473234371.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1473234371.git.horms+renesas@verge.net.au>
References: <cover.1473234371.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Add support for the general purpose LEDs on the Blanche board.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7792-blanche.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7792-blanche.dts b/arch/arm/boot/dts/r8a7792-blanche.dts
index 3c6f42b9fe9f..f3ea43b7b724 100644
--- a/arch/arm/boot/dts/r8a7792-blanche.dts
+++ b/arch/arm/boot/dts/r8a7792-blanche.dts
@@ -159,6 +159,23 @@
 		};
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		led17 {
+			gpios = <&gpio10 10 GPIO_ACTIVE_HIGH>;
+		};
+		led18 {
+			gpios = <&gpio10 11 GPIO_ACTIVE_HIGH>;
+		};
+		led19 {
+			gpios = <&gpio10 12 GPIO_ACTIVE_HIGH>;
+		};
+		led20 {
+			gpios = <&gpio10 23 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
 	vcc_sdhi0: regulator-vcc-sdhi0 {
 		compatible = "regulator-fixed";
 
-- 
2.7.0.rc3.207.g0ac5344
