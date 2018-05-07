Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35461 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751996AbeEGMiH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 May 2018 08:38:07 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] ARM: dts: r8a7740: Add CEU1
Date: Mon,  7 May 2018 14:37:57 +0200
Message-Id: <20180507123757.4708-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Describe CEU1 peripheral for Renesas R-Mobile A1 R8A7740 Soc.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7740.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

 Depends and based on:
 "[PATCH v2 2/2] ARM: dts: r8a7740: Add CEU0"

diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
index 508d93440ee8..af4c071c9178 100644
--- a/arch/arm/boot/dts/r8a7740.dtsi
+++ b/arch/arm/boot/dts/r8a7740.dtsi
@@ -77,6 +77,16 @@
 		status = "disabled";
 	};
 
+	ceu1: ceu@fe914000 {
+		reg = <0xfe910000 0x3000>;
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
