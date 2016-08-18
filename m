Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49550 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754161AbcHSA7g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Aug 2016 20:59:36 -0400
Received: from localhost.localdomain (227.178-201-80.adsl-dyn.isp.belgacom.be [80.201.178.227])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 37BB7208A6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Aug 2016 18:03:33 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH/HACK 2/7] ARM: shmobile: r8a7791: Enable IOMMU usage for the DU
Date: Thu, 18 Aug 2016 19:03:55 +0300
Message-Id: <1471536240-25082-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1471536240-25082-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1471536240-25082-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm/boot/dts/r8a7791.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 8f0086bbd96b..411c36dbbe7b 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -1032,6 +1032,8 @@
 		clock-names = "du.0", "du.1", "lvds.0";
 		status = "disabled";
 
+		iommus = <&ipmmu_mx 15>;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -1710,7 +1712,6 @@
 		interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
 		#iommu-cells = <1>;
-		status = "disabled";
 	};
 
 	ipmmu_rt: mmu@ffc80000 {
-- 
Regards,

Laurent Pinchart
