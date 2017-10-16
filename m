Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49756 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750914AbdJPH6s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2017 03:58:48 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 1/3] dt-bindings: mmc: renesas_sdhi: provide example in bindings documentation
Date: Mon, 16 Oct 2017 09:58:20 +0200
Message-Id: <20171016075822.18177-2-horms+renesas@verge.net.au>
In-Reply-To: <20171016075822.18177-1-horms+renesas@verge.net.au>
References: <20171016075822.18177-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Provide an example of the usage of the DT bindings for TMIO
in their documentation. The example given is for the r8a7790 (R-Car H2).

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v2
* Correct description of example, it is for the r8a7790 (R-Car H2)
  rather than the r8a7779 (R-Car H1)
---
 Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
index 54ef642f23a0..53f8b5280ecd 100644
--- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
@@ -43,3 +43,57 @@ Optional properties:
 - pinctrl-names: should be "default", "state_uhs"
 - pinctrl-0: should contain default/high speed pin ctrl
 - pinctrl-1: should contain uhs mode pin ctrl
+
+Example: R8A7790 (R-Car H2) SDHI controller nodes
+
+	sdhi0: sd@ee100000 {
+		compatible = "renesas,sdhi-r8a7790";
+		reg = <0 0xee100000 0 0x328>;
+		interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp3_clks R8A7790_CLK_SDHI0>;
+		dmas = <&dmac0 0xcd>, <&dmac0 0xce>,
+		       <&dmac1 0xcd>, <&dmac1 0xce>;
+		dma-names = "tx", "rx", "tx", "rx";
+		max-frequency = <195000000>;
+		power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+		status = "disabled";
+	};
+
+	sdhi1: sd@ee120000 {
+		compatible = "renesas,sdhi-r8a7790";
+		reg = <0 0xee120000 0 0x328>;
+		interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp3_clks R8A7790_CLK_SDHI1>;
+		dmas = <&dmac0 0xc9>, <&dmac0 0xca>,
+		       <&dmac1 0xc9>, <&dmac1 0xca>;
+		dma-names = "tx", "rx", "tx", "rx";
+		max-frequency = <195000000>;
+		power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+		status = "disabled";
+	};
+
+	sdhi2: sd@ee140000 {
+		compatible = "renesas,sdhi-r8a7790";
+		reg = <0 0xee140000 0 0x100>;
+		interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp3_clks R8A7790_CLK_SDHI2>;
+		dmas = <&dmac0 0xc1>, <&dmac0 0xc2>,
+		       <&dmac1 0xc1>, <&dmac1 0xc2>;
+		dma-names = "tx", "rx", "tx", "rx";
+		max-frequency = <97500000>;
+		power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+		status = "disabled";
+	};
+
+	sdhi3: sd@ee160000 {
+		compatible = "renesas,sdhi-r8a7790";
+		reg = <0 0xee160000 0 0x100>;
+		interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp3_clks R8A7790_CLK_SDHI3>;
+		dmas = <&dmac0 0xd3>, <&dmac0 0xd4>,
+		       <&dmac1 0xd3>, <&dmac1 0xd4>;
+		dma-names = "tx", "rx", "tx", "rx";
+		max-frequency = <97500000>;
+		power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+		status = "disabled";
+	};
-- 
2.11.0
