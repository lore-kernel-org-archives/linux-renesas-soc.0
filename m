Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:38096 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726617AbeJCRyb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Oct 2018 13:54:31 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 5/6] ARM: dts: r8a77470: Add SDHI1 support
Date: Wed,  3 Oct 2018 12:05:43 +0100
Message-Id: <1538564744-15590-6-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1538564744-15590-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1538564744-15590-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Althought interface SDHI1 found on the RZ/G1C SoC (a.k.a.
r8a77470) is compatible with the R-Car Gen3 ones, its OF
compatibility is restricted to the SoC specific compatible
string to avoid confusion, as from a more generic perspective
the RZ/G1C is sharing the most similarities with the R-Car
Gen2 family of SoCs, and there is a combination of R-Car
Gen2 compatible SDHI IPs and R-Car Gen3 compatible SDHI IP
on this specific chip.
This patch adds the SoC specific part of SDHI1 support, and
since SDHI1 comes with internal DMA, its DT node looks fairly
different from SDHI0 and SDHI2.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>

---
v2:
* New patch
---
 arch/arm/boot/dts/r8a77470.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index e01df9c..3e39777 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -427,6 +427,17 @@
 			status = "disabled";
 		};
 
+		sdhi1: sd@ee300000 {
+			compatible = "renesas,sdhi-mmc-r8a77470";
+			reg = <0 0xee300000 0 0x2000>;
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 313>;
+			max-frequency = <156000000>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 313>;
+			status = "disabled";
+		};
+
 		sdhi2: sd@ee160000 {
 			compatible = "renesas,sdhi-r8a77470",
 				     "renesas,rcar-gen2-sdhi";
-- 
2.7.4
