Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:23054 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726442AbeK0XDc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Nov 2018 18:03:32 -0500
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
Subject: [PATCH 18/22] ARM: dts: r8a7744: Add QSPI support
Date: Tue, 27 Nov 2018 11:56:31 +0000
Message-Id: <1543319795-48325-19-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1543319795-48325-1-git-send-email-biju.das@bp.renesas.com>
References: <1543319795-48325-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the DT node for the QSPI interface to the SoC dtsi.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7744.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index 39f309c..abe0ee3 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -649,6 +649,22 @@
 			status = "disabled";
 		};
 
+		qspi: spi@e6b10000 {
+			compatible = "renesas,qspi-r8a7744", "renesas,qspi";
+			reg = <0 0xe6b10000 0 0x2c>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 917>;
+			dmas = <&dmac0 0x17>, <&dmac0 0x18>,
+			       <&dmac1 0x17>, <&dmac1 0x18>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			resets = <&cpg 917>;
+			status = "disabled";
+		};
+
 		scifa0: serial@e6c40000 {
 			compatible = "renesas,scifa-r8a7744",
 				     "renesas,rcar-gen2-scifa", "renesas,scifa";
-- 
2.7.4
