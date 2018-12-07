Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from twhmllg4.macronix.com ([211.75.127.132]:27269 "EHLO
        TWHMLLG4.macronix.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbeLGLN6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Dec 2018 06:13:58 -0500
From: Mason Yang <masonccyang@mxic.com.tw>
To: broonie@kernel.org, marek.vasut@gmail.com,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        boris.brezillon@bootlin.com, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: juliensu@mxic.com.tw, Simon Horman <horms@verge.net.au>,
        zhengxunli@mxic.com.tw, Mason Yang <masonccyang@mxic.com.tw>
Subject: [PATCH v3 2/2] dt-binding: spi: Document Renesas R-Car Gen3 RPC controller bindings
Date: Fri,  7 Dec 2018 19:13:19 +0800
Message-Id: <1544181199-3373-3-git-send-email-masonccyang@mxic.com.tw>
In-Reply-To: <1544181199-3373-1-git-send-email-masonccyang@mxic.com.tw>
References: <1544181199-3373-1-git-send-email-masonccyang@mxic.com.tw>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document the bindings used by the Renesas R-Car Gen3 RPC controller.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 .../devicetree/bindings/spi/spi-renesas-rpc.txt    | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt

diff --git a/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt b/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
new file mode 100644
index 0000000..a191f70
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
@@ -0,0 +1,38 @@
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
+- interrupts: interrupt line connected to the RPC controller
+- clock-names: should contain "clk_rpc"
+- clocks: should contain 1 entries for the module's clock
+- rpc-mode: should contain "rpc-spi-flash" for rpc spi mode or
+			   "rpc-hyperflash" for rpc hyerflash mode.
+
+Example:
+
+	rpc: rpc@ee200000 {
+		compatible = "renesas,r8a77995-rpc";
+		reg = <0 0xee200000 0 0x8100>, <0 0x08000000 0 0x4000000>;
+		reg-names = "rpc_regs", "dirmap";
+		clocks = <&cpg CPG_MOD 917>;
+		power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+		resets = <&cpg 917>;
+		clock-names = "clk_rpc";
+		rpc-mode = "rpc-spi-flash";
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
