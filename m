Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40695 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754811AbeDZKaR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 06:30:17 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 10/10] arm64: dts: renesas: r8a77965: Add address properties to rcar_sound port nodes
Date: Thu, 26 Apr 2018 12:29:51 +0200
Message-Id: <20180426102951.8683-11-horms+renesas@verge.net.au>
In-Reply-To: <20180426102951.8683-1-horms+renesas@verge.net.au>
References: <20180426102951.8683-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The rcar_sound port nodes have unit names and thus should have register
properties.

This is flagged by dtc as follows:
 # make dtbs W=1
 ...
 DTC     arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb
arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@0: node has a unit name, but no reg property
 DTC     arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dtb
arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dtb: Warning (unit_address_vs_reg): /soc/sound@ec500000/ports/port@0: node has a unit name, but no reg property

Prior to this patch the port nodes only defined in board DTS files.
As the register properties are common this patch defines the port nodes
and provides register properties in the SoC DTS file.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index b12f41755aea..88202eff6e12 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -856,6 +856,14 @@
 				ssi1: ssi-1 {
 				};
 			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+				};
+			};
 		};
 
 		xhci0: usb@ee000000 {
-- 
2.11.0
