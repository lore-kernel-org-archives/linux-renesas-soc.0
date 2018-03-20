Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:39498 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751524AbeCTHux (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Mar 2018 03:50:53 -0400
Received: by mail-pl0-f66.google.com with SMTP id k22-v6so500449pls.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Mar 2018 00:50:53 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>
Date: Tue, 20 Mar 2018 16:51:07 +0900
Message-Id: <152153226789.8528.13236911976628814785.sendpatchset@little-apple>
Subject: [PATCH] arm64: dts: renesas: r8a77970: Update IPMMU DS1 bit number
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Judging by "R-Car-Gen3-rev0.80" IPMMU IMSSTR register documentation
for [R-Car V3M] the DS1 bit field should be bit 0.

Update the ipmmu-main property to make it match the data sheet.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---
 Based on top of renesas-drivers-2018-03-13-v4.16-rc5

 arch/arm64/boot/dts/renesas/r8a77970.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 0001/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77970.dtsi	2018-03-20 15:26:18.250607110 +0900
@@ -160,7 +160,7 @@
 		ipmmu_ds1: mmu@e7740000 {
 			compatible = "renesas,ipmmu-r8a77970";
 			reg = <0 0xe7740000 0 0x1000>;
-			renesas,ipmmu-main = <&ipmmu_mm 1>;
+			renesas,ipmmu-main = <&ipmmu_mm 0>;
 			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
