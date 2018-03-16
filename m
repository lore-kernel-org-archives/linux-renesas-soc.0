Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36128 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753728AbeCPOwo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 10:52:44 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 27/69] arm64: dts: renesas: r8a7795-es1: Fix register mappings on VSPs
Date: Fri, 16 Mar 2018 15:50:57 +0100
Message-Id: <d9366032b63bb544fd7d2fd290a922e8484a52c5.1521206129.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1521206129.git.horms+renesas@verge.net.au>
References: <cover.1521206129.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The VSPD includes a CLUT on RPF2. Ensure that the register space is
mapped correctly to support this.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index 26769a11a190..f1d5e90503d5 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -80,7 +80,7 @@
 
 	vspd3: vsp@fea38000 {
 		compatible = "renesas,vsp2";
-		reg = <0 0xfea38000 0 0x4000>;
+		reg = <0 0xfea38000 0 0x8000>;
 		interrupts = <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cpg CPG_MOD 620>;
 		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-- 
2.11.0
