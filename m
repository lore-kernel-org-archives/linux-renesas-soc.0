Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:58724 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755265AbdIRNsh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Sep 2017 09:48:37 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <damm+renesas@opensource.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 01/12] ARM: dts: r8a73a4: Update CMT compat string
Date: Mon, 18 Sep 2017 15:48:24 +0200
Message-Id: <1505742515-31727-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1505742515-31727-1-git-send-email-geert+renesas@glider.be>
References: <1505742515-31727-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Use the recently updated r8a73a4 CMT1 compat string.

With this change in place we can keep device-specific configuration in
the driver and the driver can be able to support CMT1 specific features.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Take over from Magnus,
  - Update compatible values,
  - Split in per-SoC patches,

v2:
  - Added Acked-by and Tested-by from Geert,
  - Added Acked-by from Laurent.
---
 arch/arm/boot/dts/r8a73a4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a73a4.dtsi b/arch/arm/boot/dts/r8a73a4.dtsi
index 310222634570d98f..3d2c218f2bc816a4 100644
--- a/arch/arm/boot/dts/r8a73a4.dtsi
+++ b/arch/arm/boot/dts/r8a73a4.dtsi
@@ -131,7 +131,7 @@
 	};
 
 	cmt1: timer@e6130000 {
-		compatible = "renesas,cmt-48-r8a73a4", "renesas,cmt-48-gen2";
+		compatible = "renesas,r8a73a4-cmt1", "renesas,rcar-gen2-cmt1";
 		reg = <0 0xe6130000 0 0x1004>;
 		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks R8A73A4_CLK_CMT1>;
-- 
2.7.4
