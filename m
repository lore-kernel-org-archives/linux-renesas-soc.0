Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:12102 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751770AbdJWRKx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Oct 2017 13:10:53 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 9/9] ARM: dts: r8a7745: Add IIC cores to dtsi
Date: Mon, 23 Oct 2017 18:09:30 +0100
Message-Id: <1508778570-28795-10-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1508778570-28795-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1508778570-28795-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add iic0 and iic1 nodes to SoC dtsi. Also, define aliases i2c6
and i2c7. Board specific DT files will enable the interfaces
if needed.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
---
Changes in v2:
* added changelog

 arch/arm/boot/dts/r8a7745.dtsi | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
index 6c9a0d6..d0b9212 100644
--- a/arch/arm/boot/dts/r8a7745.dtsi
+++ b/arch/arm/boot/dts/r8a7745.dtsi
@@ -25,6 +25,8 @@
 		i2c3 = &i2c3;
 		i2c4 = &i2c4;
 		i2c5 = &i2c5;
+		i2c6 = &iic0;
+		i2c7 = &iic1;
 		spi0 = &qspi;
 		spi1 = &msiof0;
 		spi2 = &msiof1;
@@ -752,6 +754,40 @@
 			status = "disabled";
 		};
 
+		iic0: i2c@e6500000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,iic-r8a7745",
+				     "renesas,rcar-gen2-iic",
+				     "renesas,rmobile-iic";
+			reg = <0 0xe6500000 0 0x425>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 318>;
+			dmas = <&dmac0 0x61>, <&dmac0 0x62>,
+			       <&dmac1 0x61>, <&dmac1 0x62>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7745_PD_ALWAYS_ON>;
+			resets = <&cpg 318>;
+			status = "disabled";
+		};
+
+		iic1: i2c@e6510000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,iic-r8a7745",
+				     "renesas,rcar-gen2-iic",
+				     "renesas,rmobile-iic";
+			reg = <0 0xe6510000 0 0x425>;
+			interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 323>;
+			dmas = <&dmac0 0x65>, <&dmac0 0x66>,
+			       <&dmac1 0x65>, <&dmac1 0x66>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7745_PD_ALWAYS_ON>;
+			resets = <&cpg 323>;
+			status = "disabled";
+		};
+
 		mmcif0: mmc@ee200000 {
 			compatible = "renesas,mmcif-r8a7745",
 				     "renesas,sh-mmcif";
-- 
2.7.4
