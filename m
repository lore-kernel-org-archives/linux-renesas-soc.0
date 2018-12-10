Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:55347 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726606AbeLJMPp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 07:15:45 -0500
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH] ARM: dts: r8a7743: Remove aliases from SoC dtsi
Date: Mon, 10 Dec 2018 12:07:03 +0000
Message-Id: <1544443624-65471-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch removes aliases from SoC dtsi tree. Device aliases are
board-specific, if needed define it in board dts rather than SoC
dtsi.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7743.dtsi | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index 182464d..24e6c2b 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -15,25 +15,6 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		i2c0 = &i2c0;
-		i2c1 = &i2c1;
-		i2c2 = &i2c2;
-		i2c3 = &i2c3;
-		i2c4 = &i2c4;
-		i2c5 = &i2c5;
-		i2c6 = &iic0;
-		i2c7 = &iic1;
-		i2c8 = &iic3;
-		spi0 = &qspi;
-		spi1 = &msiof0;
-		spi2 = &msiof1;
-		spi3 = &msiof2;
-		vin0 = &vin0;
-		vin1 = &vin1;
-		vin2 = &vin2;
-	};
-
 	/*
 	 * The external audio clocks are configured as 0 Hz fixed frequency
 	 * clocks by default.
-- 
2.7.4
