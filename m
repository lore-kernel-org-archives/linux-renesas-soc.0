Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49550 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754217AbcHSA7h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Aug 2016 20:59:37 -0400
Received: from localhost.localdomain (227.178-201-80.adsl-dyn.isp.belgacom.be [80.201.178.227])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 7C06F208B7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Aug 2016 18:03:33 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH/HACK 3/7] ARM: shmobile: r8a7790: Enable IOMMU usage for the VSP1
Date: Thu, 18 Aug 2016 19:03:56 +0300
Message-Id: <1471536240-25082-4-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1471536240-25082-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1471536240-25082-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Each VSP instance has two memory bus master ports, one of data transfer
and one for command transfer. Specify the related IOMMUs.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm/boot/dts/r8a7790.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 87c4344424a0..637cb8be363f 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -945,6 +945,8 @@
 		clocks = <&mstp1_clks R8A7790_CLK_VSP1_R>;
 		power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
 
+		iommus = <&ipmmu_mx 4 &ipmmu_mx 6>;
+
 		renesas,has-sru;
 		renesas,#rpf = <5>;
 		renesas,#uds = <1>;
@@ -958,6 +960,8 @@
 		clocks = <&mstp1_clks R8A7790_CLK_VSP1_S>;
 		power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
 
+		iommus = <&ipmmu_mx 4 &ipmmu_mx 10>;
+
 		renesas,has-lut;
 		renesas,has-sru;
 		renesas,#rpf = <5>;
@@ -972,6 +976,8 @@
 		clocks = <&mstp1_clks R8A7790_CLK_VSP1_DU0>;
 		power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
 
+		iommus = <&ipmmu_mx 5 &ipmmu_mx 13>;
+
 		renesas,has-lif;
 		renesas,has-lut;
 		renesas,#rpf = <4>;
@@ -986,6 +992,8 @@
 		clocks = <&mstp1_clks R8A7790_CLK_VSP1_DU1>;
 		power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
 
+		iommus = <&ipmmu_mx 5 &ipmmu_mx 14>;
+
 		renesas,has-lif;
 		renesas,has-lut;
 		renesas,#rpf = <4>;
-- 
Regards,

Laurent Pinchart
