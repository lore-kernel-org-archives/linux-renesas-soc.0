Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49549 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754226AbcHSA7e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Aug 2016 20:59:34 -0400
Received: from localhost.localdomain (227.178-201-80.adsl-dyn.isp.belgacom.be [80.201.178.227])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id B972E208C6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Aug 2016 18:03:33 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH/HACK 4/7] ARM: shmobile: r8a7791: Enable IOMMU usage for the VSP1
Date: Thu, 18 Aug 2016 19:03:57 +0300
Message-Id: <1471536240-25082-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1471536240-25082-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1471536240-25082-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Each VSP instance has two memory bus master ports, one of data transfer
and one for command transfer. Specify the related IOMMUs.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm/boot/dts/r8a7791.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 411c36dbbe7b..4cb4076bcd13 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -984,6 +984,8 @@
 		clocks = <&mstp1_clks R8A7791_CLK_VSP1_S>;
 		power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
 
+		iommus = <&ipmmu_mx 4 &ipmmu_mx 10>;
+
 		renesas,has-lut;
 		renesas,has-sru;
 		renesas,#rpf = <5>;
@@ -998,6 +1000,8 @@
 		clocks = <&mstp1_clks R8A7791_CLK_VSP1_DU0>;
 		power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
 
+		iommus = <&ipmmu_mx 5 &ipmmu_mx 13>;
+
 		renesas,has-lif;
 		renesas,has-lut;
 		renesas,#rpf = <4>;
@@ -1012,6 +1016,8 @@
 		clocks = <&mstp1_clks R8A7791_CLK_VSP1_DU1>;
 		power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
 
+		iommus = <&ipmmu_mx 5 &ipmmu_mx 14>;
+
 		renesas,has-lif;
 		renesas,has-lut;
 		renesas,#rpf = <4>;
-- 
Regards,

Laurent Pinchart
