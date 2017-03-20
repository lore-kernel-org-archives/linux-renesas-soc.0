Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:35073 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753099AbdCTImD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2017 04:42:03 -0400
Received: by mail-pf0-f196.google.com with SMTP id n11so4736142pfg.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2017 01:41:33 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com, joro@8bytes.org,
        geert+renesas@glider.be
Date: Mon, 20 Mar 2017 17:36:03 +0900
Message-Id: <148999896364.20118.3947892206748012490.sendpatchset@little-apple>
In-Reply-To: <148999891819.20118.10698449216124481808.sendpatchset@little-apple>
References: <148999891819.20118.10698449216124481808.sendpatchset@little-apple>
Subject: [PATCH v3 05/09] arm64: dts: r8a7795: Point VSPBC/VSPBD via FCPVB to IPMMU-VP
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Hook up the FCPVB devices to allow use of VSPBC/VSPBD with IPMMU-VP.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V2:
 - New patch

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |    2 ++
 1 file changed, 2 insertions(+)

--- 0008/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2017-03-20 16:21:50.950607110 +0900
@@ -1632,6 +1632,7 @@
 			compatible = "renesas,fcpv";
 			reg = <0 0xfe92f000 0 0x200>;
 			clocks = <&cpg CPG_MOD 606>;
+			iommus = <&ipmmu_vp 7>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 		};
 
@@ -1673,6 +1674,7 @@
 			compatible = "renesas,fcpv";
 			reg = <0 0xfe96f000 0 0x200>;
 			clocks = <&cpg CPG_MOD 607>;
+			iommus = <&ipmmu_vp 5>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 		};
 
