Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:38466 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751281AbeDVKHr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 22 Apr 2018 06:07:47 -0400
Received: by mail-pf0-f196.google.com with SMTP id o76so2165630pfi.5
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Apr 2018 03:07:47 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>
Date: Sun, 22 Apr 2018 19:08:32 +0900
Message-Id: <152439171246.19829.15567089587915785015.sendpatchset@little-apple>
In-Reply-To: <152439168688.19829.5853068596124565316.sendpatchset@little-apple>
References: <152439168688.19829.5853068596124565316.sendpatchset@little-apple>
Subject: [PATCH 03/04] arm64: dts: renesas: r8a77970: Enable IPMMU devices
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Remove 'status = "disabled"' to make sure all IPMMU devices are enabled
in DT on the r8a77970 SoC.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77970.dtsi |    2 --
 1 file changed, 2 deletions(-)

--- 0001/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77970.dtsi	2018-04-22 18:23:37.480607110 +0900
@@ -137,7 +137,6 @@
 			renesas,ipmmu-main = <&ipmmu_mm 9>;
 			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_ir: mmu@ff8b0000 {
@@ -146,7 +145,6 @@
 			renesas,ipmmu-main = <&ipmmu_mm 3>;
 			power-domains = <&sysc R8A77970_PD_A3IR>;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		ipmmu_rt: mmu@ffc80000 {
