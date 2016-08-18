Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49687 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753911AbcHSCjr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Aug 2016 22:39:47 -0400
Received: from localhost.localdomain (227.178-201-80.adsl-dyn.isp.belgacom.be [80.201.178.227])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id EDAEA208A1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Aug 2016 18:03:32 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH/HACK 1/7] ARM: shmobile: r8a7790: Enable IOMMU usage for the DU
Date: Thu, 18 Aug 2016 19:03:54 +0300
Message-Id: <1471536240-25082-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1471536240-25082-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1471536240-25082-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm/boot/dts/r8a7790.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index d18558f21102..87c4344424a0 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1010,6 +1010,8 @@
 		clock-names = "du.0", "du.1", "du.2", "lvds.0", "lvds.1";
 		status = "disabled";
 
+		iommus = <&ipmmu_mx 15 &ipmmu_mx 16>;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -1916,7 +1918,6 @@
 		interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
 		#iommu-cells = <1>;
-		status = "disabled";
 	};
 
 	ipmmu_rt: mmu@ffc80000 {
-- 
Regards,

Laurent Pinchart
