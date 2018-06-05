Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:34830 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751590AbeFEJvD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jun 2018 05:51:03 -0400
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3BA91AA3
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Jun 2018 11:51:01 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 1/2] ARM: dts: rcar-gen2: Convert to new DU DT bindings
Date: Tue,  5 Jun 2018 12:51:05 +0300
Message-Id: <20180605095106.25586-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180605095106.25586-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20180605095106.25586-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The DU DT bindings have been updated to drop the reg-names property.
Update the r8a7792 and r8a7794 device trees accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v4:

- Fixed typo in commit message
- Squashed the r8a7792 and r8a7794 changes together
---
 arch/arm/boot/dts/r8a7792.dtsi | 1 -
 arch/arm/boot/dts/r8a7794.dtsi | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
index f44257dd86f6..d48652a00bf3 100644
--- a/arch/arm/boot/dts/r8a7792.dtsi
+++ b/arch/arm/boot/dts/r8a7792.dtsi
@@ -832,7 +832,6 @@
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a7792";
 			reg = <0 0xfeb00000 0 0x40000>;
-			reg-names = "du";
 			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 724>,
diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index 736196903d22..ff8390c0c45c 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -1352,7 +1352,6 @@
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a7794";
 			reg = <0 0xfeb00000 0 0x40000>;
-			reg-names = "du";
 			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>;
-- 
Regards,

Laurent Pinchart
