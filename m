Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33510 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727518AbeGTMx2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 08:53:28 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Michel Pollet <michel.pollet@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 7/9] ARM: dts: Renesas R9A06G032 SMP enable method
Date: Fri, 20 Jul 2018 14:05:15 +0200
Message-Id: <784cdc0263f46aff6b4e70fe4052123b264a395f.1532086734.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1532086734.git.horms+renesas@verge.net.au>
References: <cover.1532086734.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Michel Pollet <michel.pollet@bp.renesas.com>

Add a special enable method for the second CA7 of the R9A06G032
as well as the default value for the "cpu-release-addr" property.

Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r9a06g032.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index 339d0958011e..afe29c95a006 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -29,6 +29,8 @@
 			compatible = "arm,cortex-a7";
 			reg = <1>;
 			clocks = <&sysctrl 84>;
+			enable-method = "renesas,r9a06g032-smp";
+			cpu-release-addr = <0 0x4000c204>;
 		};
 	};
 
-- 
2.11.0
