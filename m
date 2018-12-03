Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from twhmllg3.macronix.com ([122.147.135.201]:45384 "EHLO
        TWHMLLG3.macronix.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbeLCJTe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Dec 2018 04:19:34 -0500
From: Mason Yang <masonccyang@mxic.com.tw>
To: broonie@kernel.org, marek.vasut@gmail.com,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        boris.brezillon@bootlin.com, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: juliensu@mxic.com.tw, Simon Horman <horms@verge.net.au>,
        zhengxunli@mxic.com.tw, Mason Yang <masonccyang@mxic.com.tw>
Subject: [PATCH v2 2/2] dt-binding: spi: Document Renesas R-Car Gen3 RPC controller bindings
Date: Mon,  3 Dec 2018 17:18:40 +0800
Message-Id: <1543828720-18345-3-git-send-email-masonccyang@mxic.com.tw>
In-Reply-To: <1543828720-18345-1-git-send-email-masonccyang@mxic.com.tw>
References: <1543828720-18345-1-git-send-email-masonccyang@mxic.com.tw>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document the bindings used by the Renesas R-Car Gen3 RPC SPI controller.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 .../devicetree/bindings/spi/spi-renesas-rpc.txt    | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt

diff --git a/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt b/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
new file mode 100644
index 0000000..c6c6d9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
@@ -0,0 +1,35 @@
+Renesas R-Car Gen3 RPC controller Device Tree Bindings
+------------------------------------------------------
+
+Required properties:
+- compatible: should be "renesas,r8a77995-rpc"
+- #address-cells: should be 1
+- #size-cells: should be 0
+- reg: should contain 2 entries, one for the registers and one for the direct
+       mapping area
+- reg-names: should contain "rpc_regs" and "dirmap"
+- interrupts: interrupt line connected to the RPC SPI controller
+- clock-names: should contain "clk_rpc"
+- clocks: should contain 1 entries for the module's clock
+
+Example:
+
+	rpc: spi@ee200000 {
+		compatible = "renesas,r8a77995-rpc";
+		reg = <0 0xee200000 0 0x8100>, <0 0x08000000 0 0x4000000>;
+		reg-names = "rpc_regs", "dirmap";
+		clocks = <&cpg CPG_MOD 917>;
+		power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+		resets = <&cpg 917>;
+		clock-names = "clk_rpc";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		flash@0 {
+			compatible = "jedec,spi-nor";
+			reg = <0>;
+			spi-max-frequency = <40000000>;
+			spi-tx-bus-width = <1>;
+			spi-rx-bus-width = <1>;
+		};
+	};
-- 
1.9.1
