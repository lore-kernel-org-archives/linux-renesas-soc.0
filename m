Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750888AbeERLRL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:17:11 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 062/102] arm64: dts: renesas: r8a7795: Add address properties to rcar_sound port nodes
Date: Fri, 18 May 2018 13:15:24 +0200
Message-Id: <2d87dc0e5be26fd45d7e5d0a8e59aad6c74d54c1.1526637994.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526637994.git.horms+renesas@verge.net.au>
References: <cover.1526637994.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The rcar_sound port nodes have unit names and thus should have register
properties.

This is flagged by dtc as follows:
 # make dtbs W=1
 ...
 DTC     arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@0: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@1: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@2: node has a unit name, but no reg property
  ...
  DTC     arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dtb
arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@0: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@1: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@2: node has a unit name, but no reg property
  DTC     arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dtb
arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@0: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@1: node has a unit name, but no reg property
arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@2: node has a unit name, but no reg property

Prior to this patch the port nodes only defined in board DTS files.
As the register properties are common this patch defines the port nodes
and provides register properties in the SoC DTS file.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index b1c52dae4d49..9b080a864ea1 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1711,6 +1711,20 @@
 					dma-names = "rx", "tx", "rxu", "txu";
 				};
 			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+				};
+				port@1 {
+					reg = <1>;
+				};
+				port@2 {
+					reg = <2>;
+				};
+			};
 		};
 
 		audma0: dma-controller@ec700000 {
-- 
2.11.0
