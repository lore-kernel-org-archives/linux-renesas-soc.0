Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:35902 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753359AbdCTIzQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2017 04:55:16 -0400
Received: by mail-pg0-f68.google.com with SMTP id 81so10558033pgh.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2017 01:54:50 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 20 Mar 2017 17:49:21 +0900
Message-Id: <148999976116.21495.8298900753704826597.sendpatchset@little-apple>
Subject: [PATCH] arm64: dts: r8a7795: Correct SATA device size to 2MiB
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Update the r8a7795 SATA device node to use a 2MiB I/O space as specified
in the "72. Serial-ATA" section of R-Car-Gen3-rev0.52E.pdf

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-devel-20170313-v4.11-rc2

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 0001/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2017-03-20 17:41:36.390607110 +0900
@@ -1209,7 +1209,7 @@
 
 		sata: sata@ee300000 {
 			compatible = "renesas,sata-r8a7795";
-			reg = <0 0xee300000 0 0x1fff>;
+			reg = <0 0xee300000 0 0x200000>;
 			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 815>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
