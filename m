Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47630 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752548AbcLAO0J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Dec 2016 09:26:09 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/4] ARM: dts: r8a7791: Use renesas,rcar-gen2-usb-phy fallback binding
Date: Thu,  1 Dec 2016 15:25:52 +0100
Message-Id: <1480602354-1446-3-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1480602354-1446-1-git-send-email-horms+renesas@verge.net.au>
References: <1480602354-1446-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

A fallback binding for the Renesas R-Car Gen2 PHY driver was
added by commit 7777cb8ba08d ("phy: rcar-gen2: add fallback binding").
This patch makes use of this binding in the DT for the r8a7791 SoC.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7791.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 4c50de2faef1..a14f0ae8c8dd 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -934,7 +934,8 @@
 	};
 
 	usbphy: usb-phy@e6590100 {
-		compatible = "renesas,usb-phy-r8a7791";
+		compatible = "renesas,usb-phy-r8a7791",
+			     "renesas,rcar-gen2-usb-phy";
 		reg = <0 0xe6590100 0 0x100>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.7.0.rc3.207.g0ac5344
