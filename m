Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:33008 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754691AbdC1Ji6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Mar 2017 05:38:58 -0400
Received: by mail-pg0-f65.google.com with SMTP id 79so20017772pgf.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Mar 2017 02:38:24 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com, joro@8bytes.org,
        geert+renesas@glider.be
Date: Tue, 28 Mar 2017 18:32:52 +0900
Message-Id: <149069357209.22662.10603698005141361415.sendpatchset@little-apple>
In-Reply-To: <149069355375.22662.10367253365715059744.sendpatchset@little-apple>
References: <149069355375.22662.10367253365715059744.sendpatchset@little-apple>
Subject: [PATCH 02/03] arm64: dts: r8a7795: Connect USB3 Host to IPMMU-HC
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Point the USB3.0 Host CH0 and CH1 devices to IPMMU-HC.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |    2 ++
 1 file changed, 2 insertions(+)

--- 0002/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2017-03-28 18:10:51.020607110 +0900
@@ -1419,6 +1419,7 @@
 			reg = <0 0xee000000 0 0xc00>;
 			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 328>;
+			iommus = <&ipmmu_hc 12>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 328>;
 			status = "disabled";
@@ -1429,6 +1430,7 @@
 			reg = <0 0xee040000 0 0xc00>;
 			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 327>;
+			iommus = <&ipmmu_hc 14>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 327>;
 			status = "disabled";
