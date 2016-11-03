Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49962 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756414AbcKCPHh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Nov 2016 11:07:37 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v8 3/3] ARM: dts: alt: Enable UHS-I SDR-104
Date: Thu,  3 Nov 2016 16:07:25 +0100
Message-Id: <1478185645-25556-4-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1478185645-25556-1-git-send-email-horms+renesas@verge.net.au>
References: <1478185645-25556-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

And the sd-uhs-sdr104 property to SDHI0.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7794-alt.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/r8a7794-alt.dts b/arch/arm/boot/dts/r8a7794-alt.dts
index 325d3f972c57..ccb80d66076f 100644
--- a/arch/arm/boot/dts/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/r8a7794-alt.dts
@@ -277,6 +277,7 @@
 	cd-gpios = <&gpio6 6 GPIO_ACTIVE_LOW>;
 	wp-gpios = <&gpio6 7 GPIO_ACTIVE_LOW>;
 	sd-uhs-sdr50;
+	sd-uhs-sdr104;
 	status = "okay";
 };
 
-- 
2.7.0.rc3.207.g0ac5344
