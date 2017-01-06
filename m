Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43774 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S940161AbdAFLSu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jan 2017 06:18:50 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 09/25] ARM: dts: r8a7790: Use renesas,rcar-gen2-usb-phy fallback binding
Date: Fri,  6 Jan 2017 12:18:18 +0100
Message-Id: <3b0922c55e17b11e41f27c7730804623414bcf19.1483700969.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1483700969.git.horms+renesas@verge.net.au>
References: <cover.1483700969.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

A fallback binding for the Renesas R-Car Gen2 PHY driver was
added by commit 7777cb8ba08d ("phy: rcar-gen2: add fallback binding").
This patch makes use of this binding in the DT for the r8a7790 SoC.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7790.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 0c8900d4b824..b7ed7466308b 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -883,7 +883,8 @@
 	};
 
 	usbphy: usb-phy@e6590100 {
-		compatible = "renesas,usb-phy-r8a7790";
+		compatible = "renesas,usb-phy-r8a7790",
+			     "renesas,rcar-gen2-usb-phy";
 		reg = <0 0xe6590100 0 0x100>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.7.0.rc3.207.g0ac5344
