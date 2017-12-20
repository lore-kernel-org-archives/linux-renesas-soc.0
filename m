Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f175.google.com ([209.85.192.175]:46323 "EHLO
        mail-pf0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753269AbdLTMY6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Dec 2017 07:24:58 -0500
Received: by mail-pf0-f175.google.com with SMTP id c204so12482599pfc.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Dec 2017 04:24:58 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Wed, 20 Dec 2017 21:23:54 +0900
Message-Id: <151377263489.17613.8433322549941624829.sendpatchset@little-apple>
In-Reply-To: <151377262568.17613.8610167192375932687.sendpatchset@little-apple>
References: <151377262568.17613.8610167192375932687.sendpatchset@little-apple>
Subject: [PATCH/RFC 01/03] arm64: dts: r8a77965: Enable IPMMU MM, DS0 and DS1
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Enable the IPMMU-MM, IPMMU-DS0 and IPMMU-DS1 devices on r8a77965.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77965.dtsi |    3 ---
 1 file changed, 3 deletions(-)

--- 0021/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77965.dtsi	2017-11-22 13:08:13.800607110 +0900
@@ -107,7 +107,6 @@
 			reg = <0 0xe6740000 0 0x1000>; /* IPMMU-DS0 */
 			renesas,ipmmu-main = <&ipmmu_mm 0>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_ds1: mmu@e7740000 {
@@ -115,7 +114,6 @@
 			reg = <0 0xe7740000 0 0x1000>; /* IPMMU-DS1 */
 			renesas,ipmmu-main = <&ipmmu_mm 1>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_mm: mmu@e67b0000 {
@@ -124,7 +122,6 @@
 			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		cpg: clock-controller@e6150000 {
