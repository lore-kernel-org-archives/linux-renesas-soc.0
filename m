Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34188 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752227AbeEOIBC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 May 2018 04:01:02 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        jacopo mondi <jacopo@jmondi.org>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2] ARM: dts: r8a7740: Add CEU1
Date: Tue, 15 May 2018 10:00:38 +0200
Message-Id: <20180515080038.7438-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Describe CEU1 peripheral for Renesas R-Mobile A1 R8A7740 Soc.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v2
* Correct register range start address

  Based on renesas-devel-20180514-v4.17-rc5
---
 arch/arm/boot/dts/r8a7740.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
index 508d93440ee8..35e2fc957458 100644
--- a/arch/arm/boot/dts/r8a7740.dtsi
+++ b/arch/arm/boot/dts/r8a7740.dtsi
@@ -77,6 +77,16 @@
 		status = "disabled";
 	};
 
+	ceu1: ceu@fe914000 {
+		reg = <0xfe914000 0x3000>;
+		compatible = "renesas,r8a7740-ceu";
+		interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp1_clks R8A7740_CLK_CEU21>;
+		clock-names = "ceu21";
+		power-domains = <&pd_a4r>;
+		status = "disabled";
+	};
+
 	cmt1: timer@e6138000 {
 		compatible = "renesas,cmt-48-r8a7740", "renesas,cmt-48";
 		reg = <0xe6138000 0x170>;
-- 
2.11.0
