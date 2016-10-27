Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:35674 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934700AbcJ0O7a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 10:59:30 -0400
Received: by mail-pf0-f194.google.com with SMTP id s8so2875041pfj.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Oct 2016 07:59:30 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com, joro@8bytes.org,
        geert+renesas@glider.be
Date: Thu, 27 Oct 2016 19:29:15 +0900
Message-Id: <20161027102915.26426.82003.sendpatchset@little-apple>
In-Reply-To: <20161027102856.26426.48132.sendpatchset@little-apple>
References: <20161027102856.26426.48132.sendpatchset@little-apple>
Subject: [PATCH 02/04] arm64: dts: r8a7795: Hook up SYS-DMAC to IPMMU
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Hook up r8a7795 DMAC nodes to IPMMU-MP1, IPMMU-DS0 and IPMMU-DS1.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 This patch can be merged any time, but it is however not recommended
 to enable IPMMU-MP1, IPMMU-DS0 or IPMMU-DS1 until various dependencies
 have been resolved:

 1) DMA-Engine slave devices need the following two patches merged:
  arm64: Wire up iommu_dma_{map, unmap}_resource()
  iommu/dma: Implement dma_{map,unmap}_resource()

 2) The Audio DMAC and the sound drivers need the above two patches
  as well as driver updates to correctly make use of the DMA MAP API.

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |   40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

--- 0002/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2016-10-27 18:04:48.460607110 +0900
@@ -358,6 +358,14 @@
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
+			iommus = <&ipmmu_mp1 0>, <&ipmmu_mp1 1>,
+			       <&ipmmu_mp1 2>, <&ipmmu_mp1 3>,
+			       <&ipmmu_mp1 4>, <&ipmmu_mp1 5>,
+			       <&ipmmu_mp1 6>, <&ipmmu_mp1 7>,
+			       <&ipmmu_mp1 8>, <&ipmmu_mp1 9>,
+			       <&ipmmu_mp1 10>, <&ipmmu_mp1 11>,
+			       <&ipmmu_mp1 12>, <&ipmmu_mp1 13>,
+			       <&ipmmu_mp1 14>, <&ipmmu_mp1 15>;
 		};
 
 		audma1: dma-controller@ec720000 {
@@ -391,6 +399,14 @@
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
+			iommus = <&ipmmu_mp1 16>, <&ipmmu_mp1 17>,
+			       <&ipmmu_mp1 18>, <&ipmmu_mp1 19>,
+			       <&ipmmu_mp1 20>, <&ipmmu_mp1 21>,
+			       <&ipmmu_mp1 22>, <&ipmmu_mp1 23>,
+			       <&ipmmu_mp1 24>, <&ipmmu_mp1 25>,
+			       <&ipmmu_mp1 26>, <&ipmmu_mp1 27>,
+			       <&ipmmu_mp1 28>, <&ipmmu_mp1 29>,
+			       <&ipmmu_mp1 30>, <&ipmmu_mp1 31>;
 		};
 
 		pfc: pfc@e6060000 {
@@ -557,6 +573,14 @@
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
+			iommus = <&ipmmu_ds0 0>, <&ipmmu_ds0 1>,
+			       <&ipmmu_ds0 2>, <&ipmmu_ds0 3>,
+			       <&ipmmu_ds0 4>, <&ipmmu_ds0 5>,
+			       <&ipmmu_ds0 6>, <&ipmmu_ds0 7>,
+			       <&ipmmu_ds0 8>, <&ipmmu_ds0 9>,
+			       <&ipmmu_ds0 10>, <&ipmmu_ds0 11>,
+			       <&ipmmu_ds0 12>, <&ipmmu_ds0 13>,
+			       <&ipmmu_ds0 14>, <&ipmmu_ds0 15>;
 		};
 
 		dmac1: dma-controller@e7300000 {
@@ -590,6 +614,14 @@
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
+			iommus = <&ipmmu_ds1 0>, <&ipmmu_ds1 1>,
+			       <&ipmmu_ds1 2>, <&ipmmu_ds1 3>,
+			       <&ipmmu_ds1 4>, <&ipmmu_ds1 5>,
+			       <&ipmmu_ds1 6>, <&ipmmu_ds1 7>,
+			       <&ipmmu_ds1 8>, <&ipmmu_ds1 9>,
+			       <&ipmmu_ds1 10>, <&ipmmu_ds1 11>,
+			       <&ipmmu_ds1 12>, <&ipmmu_ds1 13>,
+			       <&ipmmu_ds1 14>, <&ipmmu_ds1 15>;
 		};
 
 		dmac2: dma-controller@e7310000 {
@@ -623,6 +655,14 @@
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			#dma-cells = <1>;
 			dma-channels = <16>;
+			iommus = <&ipmmu_ds1 16>, <&ipmmu_ds1 17>,
+			       <&ipmmu_ds1 18>, <&ipmmu_ds1 19>,
+			       <&ipmmu_ds1 20>, <&ipmmu_ds1 21>,
+			       <&ipmmu_ds1 22>, <&ipmmu_ds1 23>,
+			       <&ipmmu_ds1 24>, <&ipmmu_ds1 25>,
+			       <&ipmmu_ds1 26>, <&ipmmu_ds1 27>,
+			       <&ipmmu_ds1 28>, <&ipmmu_ds1 29>,
+			       <&ipmmu_ds1 30>, <&ipmmu_ds1 31>;
 		};
 
 		avb: ethernet@e6800000 {
