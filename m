Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:33420 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753084AbdCTImD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2017 04:42:03 -0400
Received: by mail-pg0-f66.google.com with SMTP id 79so9834217pgf.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2017 01:41:24 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com, joro@8bytes.org,
        geert+renesas@glider.be
Date: Mon, 20 Mar 2017 17:35:54 +0900
Message-Id: <148999895453.20118.17344954792745460322.sendpatchset@little-apple>
In-Reply-To: <148999891819.20118.10698449216124481808.sendpatchset@little-apple>
References: <148999891819.20118.10698449216124481808.sendpatchset@little-apple>
Subject: [PATCH v3 04/09] arm64: dts: r8a7795: Point FDP1 via FCPF to IPMMU-VP
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Hook up the FCPF devices to allow use of FDP1 with IPMMU-VP.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V2:
 - New patch

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |    3 +++
 1 file changed, 3 insertions(+)

--- 0007/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2017-03-20 16:19:28.230607110 +0900
@@ -1639,6 +1639,7 @@
 			compatible = "renesas,fcpf";
 			reg = <0 0xfe950000 0 0x200>;
 			clocks = <&cpg CPG_MOD 615>;
+			iommus = <&ipmmu_vp 0>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 		};
 
@@ -1646,6 +1647,7 @@
 			compatible = "renesas,fcpf";
 			reg = <0 0xfe951000 0 0x200>;
 			clocks = <&cpg CPG_MOD 614>;
+			iommus = <&ipmmu_vp 1>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 		};
 
@@ -1653,6 +1655,7 @@
 			compatible = "renesas,fcpf";
 			reg = <0 0xfe952000 0 0x200>;
 			clocks = <&cpg CPG_MOD 613>;
+			iommus = <&ipmmu_vp 2>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 		};
 
