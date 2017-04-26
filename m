Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45776 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2997096AbdDZKGy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Apr 2017 06:06:54 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 7/9] ARM: dts: r8a7791: update PFC node name to pin-controller
Date: Wed, 26 Apr 2017 12:05:36 +0200
Message-Id: <20170426100538.22060-8-horms+renesas@verge.net.au>
In-Reply-To: <20170426100538.22060-1-horms+renesas@verge.net.au>
References: <20170426100538.22060-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The device trees for Renesas SoCs use either pfc or pin-controller as the
node name for the PFC device. This patch is intended to take a step towards
unifying the node name used as pin-controller which appears to be the more
generic of the two and thus more in keeping with the DT specs.

My analysis is that this is a user-visible change to the extent that kernel
logs, and sysfs entries change from e6060000.pfc and pfc@e6060000 to
e6060000.pin-controller and pin-controller@e6060000.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7791.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 4d0c2ce59900..540c5b27b842 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -562,7 +562,7 @@
 		status = "disabled";
 	};
 
-	pfc: pfc@e6060000 {
+	pfc: pin-controller@e6060000 {
 		compatible = "renesas,pfc-r8a7791";
 		reg = <0 0xe6060000 0 0x250>;
 	};
-- 
2.12.2.816.g2cccc81164
