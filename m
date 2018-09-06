Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58489 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbeIFNpG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Sep 2018 09:45:06 -0400
Date: Thu, 6 Sep 2018 11:10:33 +0200
From: Simon Horman <horms@verge.net.au>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, damm+renesas@opensource.se,
        ulrich.hecht+renesas@gmail.com, linux-renesas-soc@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH v2 6/8] arm64: dts: r8a77990: Add VIN and CSI-2 device
 nodes
Message-ID: <20180906091029.gezk3zkalppxjb3e@verge.net.au>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
 <1536161385-25562-7-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1536161385-25562-7-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 05, 2018 at 05:29:43PM +0200, Jacopo Mondi wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> 
> Add device nodes for VIN4, VIN5 and CSI40 to R-Car E3 R8A77990 device tree.
> 
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks.

I took the liberty of re-arranging the node order to preserve the existing
sort order in the .dtsi file.

The result is as follows:


>From 053f0c7e8547095a959cbd3bbaf602388c8bbca7 Mon Sep 17 00:00:00 2001
From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Date: Wed, 5 Sep 2018 17:29:43 +0200
Subject: [PATCH] arm64: dts: r8a77990: Add VIN and CSI-2 device nodes

Add device nodes for VIN4, VIN5 and CSI40 to R-Car E3 R8A77990 device tree.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
[simon: sorted nodes by bus address, then IP block]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 79 +++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index e3009c5f5210..c010358ba076 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -481,6 +481,54 @@
 			status = "disabled";
 		};
 
+		vin4: video@e6ef4000 {
+			compatible = "renesas,vin-r8a77990";
+			reg = <0 0xe6ef4000 0 0x1000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 807>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 807>;
+			renesas,id = <4>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					vin4csi40: endpoint {
+						remote-endpoint= <&csi40vin4>;
+					};
+				};
+			};
+		};
+
+		vin5: video@e6ef5000 {
+			compatible = "renesas,vin-r8a77990";
+			reg = <0 0xe6ef5000 0 0x1000>;
+			interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 806>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 806>;
+			renesas,id = <5>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					vin5csi40: endpoint {
+						remote-endpoint= <&csi40vin5>;
+					};
+				};
+			};
+		};
+
 		xhci0: usb@ee000000 {
 			compatible = "renesas,xhci-r8a77990",
 				     "renesas,rcar-gen3-xhci";
@@ -546,6 +594,37 @@
 			resets = <&cpg 408>;
 		};
 
+		csi40: csi2@feaa0000 {
+			compatible = "renesas,r8a77990-csi2", "renesas,rcar-gen3-csi2";
+			reg = <0 0xfeaa0000 0 0x10000>;
+			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 716>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 716>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <1>;
+
+					csi40vin4: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&vin4csi40>;
+					};
+					csi40vin5: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&vin5csi40>;
+					};
+				};
+			};
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
-- 
2.11.0
