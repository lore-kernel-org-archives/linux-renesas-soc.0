Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:57900 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754414AbdCFQlh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2017 11:41:37 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/8] ARM: dts: r8a7791: Remove unit-address and reg from integrated cache
Date: Mon,  6 Mar 2017 17:40:40 +0100
Message-Id: <1488818443-25196-6-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1488818443-25196-1-git-send-email-geert+renesas@glider.be>
References: <1488818443-25196-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The Cortex-A15 cache controller is an integrated controller, and thus
the device node representing it should not have a unit-addresses or reg
property.

Fixes: 6f9314ce258c8504 ("ARM: dts: r8a7791: Fix W=1 dtc warnings")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7791.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 9f9e48511836ddc6..7cad65a28f251172 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -74,9 +74,8 @@
 			next-level-cache = <&L2_CA15>;
 		};
 
-		L2_CA15: cache-controller@0 {
+		L2_CA15: cache-controller-0 {
 			compatible = "cache";
-			reg = <0>;
 			power-domains = <&sysc R8A7791_PD_CA15_SCU>;
 			cache-unified;
 			cache-level = <2>;
-- 
2.7.4
