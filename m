Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:37254 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755187AbdIRNsh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Sep 2017 09:48:37 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <damm+renesas@opensource.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 12/12] ARM: dts: sh73a0: Remove CMT renesas,channels-mask
Date: Mon, 18 Sep 2017 15:48:35 +0200
Message-Id: <1505742515-31727-13-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1505742515-31727-1-git-send-email-geert+renesas@glider.be>
References: <1505742515-31727-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Update the DTS to remove the now deprecated "renesas,channels-mask"
property.

The channel information is now kept in the device driver and can easily
be determined based on the compat string.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Take over from Magnus,
  - Split in per-SoC patches,

v2:
  - Rebased on top of power-domain changes,
  - Added Acked-by and Tested-by from Geert.
---
 arch/arm/boot/dts/sh73a0.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/sh73a0.dtsi b/arch/arm/boot/dts/sh73a0.dtsi
index 4ea5c5a16c57eed5..43495792f801d9b3 100644
--- a/arch/arm/boot/dts/sh73a0.dtsi
+++ b/arch/arm/boot/dts/sh73a0.dtsi
@@ -98,9 +98,6 @@
 		clocks = <&mstp3_clks SH73A0_CLK_CMT1>;
 		clock-names = "fck";
 		power-domains = <&pd_c5>;
-
-		renesas,channels-mask = <0x3f>;
-
 		status = "disabled";
 	};
 
-- 
2.7.4
