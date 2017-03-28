Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:32888 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754440AbdC1JiZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Mar 2017 05:38:25 -0400
Received: by mail-pg0-f68.google.com with SMTP id 79so20016846pgf.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Mar 2017 02:38:24 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com, joro@8bytes.org,
        geert+renesas@glider.be
Date: Tue, 28 Mar 2017 18:32:42 +0900
Message-Id: <149069356279.22662.11780869318220176981.sendpatchset@little-apple>
In-Reply-To: <149069355375.22662.10367253365715059744.sendpatchset@little-apple>
References: <149069355375.22662.10367253365715059744.sendpatchset@little-apple>
Subject: [PATCH 01/03] arm64: dts: r8a7795: Connect USB-DMAC0/1 to IPMMU-HC
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Point the USB-DMAC0 and USB-DMAC1 devices to IPMMU-HC.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |    2 ++
 1 file changed, 2 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2017-03-28 18:09:09.580607110 +0900
@@ -1442,6 +1442,7 @@
 				      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 330>;
+			iommus = <&ipmmu_hc 9>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 330>;
 			#dma-cells = <1>;
@@ -1456,6 +1457,7 @@
 				      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "ch0", "ch1";
 			clocks = <&cpg CPG_MOD 331>;
+			iommus = <&ipmmu_hc 10>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 331>;
 			#dma-cells = <1>;
