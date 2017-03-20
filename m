Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:35462 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753006AbdCTImD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2017 04:42:03 -0400
Received: by mail-pf0-f196.google.com with SMTP id n11so4734246pfg.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2017 01:41:05 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com, joro@8bytes.org,
        geert+renesas@glider.be
Date: Mon, 20 Mar 2017 17:35:36 +0900
Message-Id: <148999893649.20118.17724268009849243177.sendpatchset@little-apple>
In-Reply-To: <148999891819.20118.10698449216124481808.sendpatchset@little-apple>
References: <148999891819.20118.10698449216124481808.sendpatchset@little-apple>
Subject: [PATCH v3 02/09] arm64: dts: r8a7795: Tie Audio/SYS-DMAC to IPMMU-DS0/1 and MP1
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Hook up r8a7795 DMAC nodes to the IPMMUs. In particular Audio-DMAC0
and Audio-DMAC1 get connected to IPMMU-MP1, while SYS-DMAC0 gets tied
to IPMMU-DS0 and SYS-DMAC1 and SYS-DMAC2 get tied to IPMMU-DS1.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

 Changes from V2:
 - Updated description with more detail about SYS-DMAC and Audio-DMAC
 - Updated title/subject to include Audio-DMAC
 - Added Reviewed-by from Laurent - thanks!

 Changes from V1:
 - None

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |   40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

--- 0002/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2017-03-20 15:45:51.330607110 +0900
@@ -548,6 +548,14 @@
 					"ch12", "ch13", "ch14", "ch15";
 			clocks = <&cpg CPG_MOD 219>;
 			clock-names = "fck";
+			iommus = <&ipmmu_ds0 0>, <&ipmmu_ds0 1>,
+			       <&ipmmu_ds0 2>, <&ipmmu_ds0 3>,
+			       <&ipmmu_ds0 4>, <&ipmmu_ds0 5>,
+			       <&ipmmu_ds0 6>, <&ipmmu_ds0 7>,
+			       <&ipmmu_ds0 8>, <&ipmmu_ds0 9>,
+			       <&ipmmu_ds0 10>, <&ipmmu_ds0 11>,
+			       <&ipmmu_ds0 12>, <&ipmmu_ds0 13>,
+			       <&ipmmu_ds0 14>, <&ipmmu_ds0 15>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
@@ -581,6 +589,14 @@
 					"ch12", "ch13", "ch14", "ch15";
 			clocks = <&cpg CPG_MOD 218>;
 			clock-names = "fck";
+			iommus = <&ipmmu_ds1 0>, <&ipmmu_ds1 1>,
+			       <&ipmmu_ds1 2>, <&ipmmu_ds1 3>,
+			       <&ipmmu_ds1 4>, <&ipmmu_ds1 5>,
+			       <&ipmmu_ds1 6>, <&ipmmu_ds1 7>,
+			       <&ipmmu_ds1 8>, <&ipmmu_ds1 9>,
+			       <&ipmmu_ds1 10>, <&ipmmu_ds1 11>,
+			       <&ipmmu_ds1 12>, <&ipmmu_ds1 13>,
+			       <&ipmmu_ds1 14>, <&ipmmu_ds1 15>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
@@ -614,6 +630,14 @@
 					"ch12", "ch13", "ch14", "ch15";
 			clocks = <&cpg CPG_MOD 217>;
 			clock-names = "fck";
+			iommus = <&ipmmu_ds1 16>, <&ipmmu_ds1 17>,
+			       <&ipmmu_ds1 18>, <&ipmmu_ds1 19>,
+			       <&ipmmu_ds1 20>, <&ipmmu_ds1 21>,
+			       <&ipmmu_ds1 22>, <&ipmmu_ds1 23>,
+			       <&ipmmu_ds1 24>, <&ipmmu_ds1 25>,
+			       <&ipmmu_ds1 26>, <&ipmmu_ds1 27>,
+			       <&ipmmu_ds1 28>, <&ipmmu_ds1 29>,
+			       <&ipmmu_ds1 30>, <&ipmmu_ds1 31>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
@@ -647,6 +671,14 @@
 					"ch12", "ch13", "ch14", "ch15";
 			clocks = <&cpg CPG_MOD 502>;
 			clock-names = "fck";
+			iommus = <&ipmmu_mp1 0>, <&ipmmu_mp1 1>,
+			       <&ipmmu_mp1 2>, <&ipmmu_mp1 3>,
+			       <&ipmmu_mp1 4>, <&ipmmu_mp1 5>,
+			       <&ipmmu_mp1 6>, <&ipmmu_mp1 7>,
+			       <&ipmmu_mp1 8>, <&ipmmu_mp1 9>,
+			       <&ipmmu_mp1 10>, <&ipmmu_mp1 11>,
+			       <&ipmmu_mp1 12>, <&ipmmu_mp1 13>,
+			       <&ipmmu_mp1 14>, <&ipmmu_mp1 15>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
@@ -680,6 +712,14 @@
 					"ch12", "ch13", "ch14", "ch15";
 			clocks = <&cpg CPG_MOD 501>;
 			clock-names = "fck";
+			iommus = <&ipmmu_mp1 16>, <&ipmmu_mp1 17>,
+			       <&ipmmu_mp1 18>, <&ipmmu_mp1 19>,
+			       <&ipmmu_mp1 20>, <&ipmmu_mp1 21>,
+			       <&ipmmu_mp1 22>, <&ipmmu_mp1 23>,
+			       <&ipmmu_mp1 24>, <&ipmmu_mp1 25>,
+			       <&ipmmu_mp1 26>, <&ipmmu_mp1 27>,
+			       <&ipmmu_mp1 28>, <&ipmmu_mp1 29>,
+			       <&ipmmu_mp1 30>, <&ipmmu_mp1 31>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
