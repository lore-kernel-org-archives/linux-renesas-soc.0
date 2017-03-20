Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:34105 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753113AbdCTImD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2017 04:42:03 -0400
Received: by mail-pf0-f195.google.com with SMTP id o126so16080785pfb.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2017 01:41:42 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com, joro@8bytes.org,
        geert+renesas@glider.be
Date: Mon, 20 Mar 2017 17:36:12 +0900
Message-Id: <148999897296.20118.6099961740611728210.sendpatchset@little-apple>
In-Reply-To: <148999891819.20118.10698449216124481808.sendpatchset@little-apple>
References: <148999891819.20118.10698449216124481808.sendpatchset@little-apple>
Subject: [PATCH v3 06/09] arm64: dts: r8a7795: Point VSPI via FCPVI to IPMMU-VP
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Hook up the FCPVI devices to allow use of VSPI with IPMMU-VP.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V2:
 - New patch

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |    3 +++
 1 file changed, 3 insertions(+)

--- 0010/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2017-03-20 16:26:53.600607110 +0900
@@ -1692,6 +1692,7 @@
 			compatible = "renesas,fcpv";
 			reg = <0 0xfe9af000 0 0x200>;
 			clocks = <&cpg CPG_MOD 611>;
+			iommus = <&ipmmu_vp 8>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 		};
 
@@ -1709,6 +1710,7 @@
 			compatible = "renesas,fcpv";
 			reg = <0 0xfe9bf000 0 0x200>;
 			clocks = <&cpg CPG_MOD 610>;
+			iommus = <&ipmmu_vp 9>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 		};
 
@@ -1726,6 +1728,7 @@
 			compatible = "renesas,fcpv";
 			reg = <0 0xfe9cf000 0 0x200>;
 			clocks = <&cpg CPG_MOD 609>;
+			iommus = <&ipmmu_vp 10>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 		};
 
