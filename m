Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:38932 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753087AbdK1Nrl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Nov 2017 08:47:41 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Magnus Damm <damm+renesas@opensource.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 04/12] ARM: dts: r8a7793: Update CMT compat strings
Date: Tue, 28 Nov 2017 14:47:28 +0100
Message-Id: <1511876856-9495-5-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1511876856-9495-1-git-send-email-geert+renesas@glider.be>
References: <1511876856-9495-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Use recently updated R-Car Gen2 CMT0 and CMT1 compat strings.

With this change in place we can keep device-specific configuration in
the driver and the driver can be able to support CMT1 specific features.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - Rebased against renesas-devel-20171127-v4.15-rc1,

v3:
  - Take over from Magnus,
  - Update compatible values,
  - Split in per-SoC patches,

v2:
  - Added Acked-by and Tested-by from Geert,
  - Added Acked-by from Laurent.
---
 arch/arm/boot/dts/r8a7793.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index f3aeed4f6656918e..035b5a7639bc7eb7 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -248,7 +248,7 @@
 	};
 
 	cmt0: timer@ffca0000 {
-		compatible = "renesas,cmt-48-r8a7793", "renesas,cmt-48-gen2";
+		compatible = "renesas,r8a7793-cmt0", "renesas,rcar-gen2-cmt0";
 		reg = <0 0xffca0000 0 0x1004>;
 		interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
@@ -263,7 +263,7 @@
 	};
 
 	cmt1: timer@e6130000 {
-		compatible = "renesas,cmt-48-r8a7793", "renesas,cmt-48-gen2";
+		compatible = "renesas,r8a7793-cmt1", "renesas,rcar-gen2-cmt1";
 		reg = <0 0xe6130000 0 0x1004>;
 		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.7.4
