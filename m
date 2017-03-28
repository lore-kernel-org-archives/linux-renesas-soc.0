Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:33136 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753932AbdC1JjR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Mar 2017 05:39:17 -0400
Received: by mail-pg0-f66.google.com with SMTP id 79so20018820pgf.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Mar 2017 02:39:16 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com, joro@8bytes.org,
        geert+renesas@glider.be
Date: Tue, 28 Mar 2017 18:33:01 +0900
Message-Id: <149069358130.22662.6490709289181526281.sendpatchset@little-apple>
In-Reply-To: <149069355375.22662.10367253365715059744.sendpatchset@little-apple>
References: <149069355375.22662.10367253365715059744.sendpatchset@little-apple>
Subject: [PATCH 03/03] arm64: dts: r8a7795: Tie USB2 and USB1 Host to IPMMU-HC
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Point the USB2.0 Host CH0, CH1 and CH2 devices to IPMMU-HC.
This includes 3 channels of both EHCI and OHCI.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

--- 0004/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2017-03-28 18:13:26.230607110 +0900
@@ -1551,6 +1551,7 @@
 			clocks = <&cpg CPG_MOD 703>;
 			phys = <&usb2_phy0>;
 			phy-names = "usb";
+			iommus = <&ipmmu_hc 4>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 703>;
 			status = "disabled";
@@ -1563,6 +1564,7 @@
 			clocks = <&cpg CPG_MOD 702>;
 			phys = <&usb2_phy1>;
 			phy-names = "usb";
+			iommus = <&ipmmu_hc 5>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 702>;
 			status = "disabled";
@@ -1575,6 +1577,7 @@
 			clocks = <&cpg CPG_MOD 701>;
 			phys = <&usb2_phy2>;
 			phy-names = "usb";
+			iommus = <&ipmmu_hc 6>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 701>;
 			status = "disabled";
@@ -1587,6 +1590,7 @@
 			clocks = <&cpg CPG_MOD 703>;
 			phys = <&usb2_phy0>;
 			phy-names = "usb";
+			iommus = <&ipmmu_hc 4>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 703>;
 			status = "disabled";
@@ -1599,6 +1603,7 @@
 			clocks = <&cpg CPG_MOD 702>;
 			phys = <&usb2_phy1>;
 			phy-names = "usb";
+			iommus = <&ipmmu_hc 5>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 702>;
 			status = "disabled";
@@ -1611,6 +1616,7 @@
 			clocks = <&cpg CPG_MOD 701>;
 			phys = <&usb2_phy2>;
 			phy-names = "usb";
+			iommus = <&ipmmu_hc 6>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 701>;
 			status = "disabled";
