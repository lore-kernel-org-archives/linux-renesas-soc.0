Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:36393 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932498AbcJ0O5Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 10:57:25 -0400
Received: by mail-pf0-f194.google.com with SMTP id n85so2870209pfi.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Oct 2016 07:57:25 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com, joro@8bytes.org,
        geert+renesas@glider.be
Date: Thu, 27 Oct 2016 19:29:25 +0900
Message-Id: <20161027102925.26426.6785.sendpatchset@little-apple>
In-Reply-To: <20161027102856.26426.48132.sendpatchset@little-apple>
References: <20161027102856.26426.48132.sendpatchset@little-apple>
Subject: [PATCH 03/04] arm64: dts: r8a7795: Point FCP devices to IPMMU
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Hook in the FCP devices to allow use of the VSP and DU
together with the IPMMU.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 The patch can be merged as is, but it is recommended not
 to enable IPMMU-VI until the DU driver gets updated in
 mainline with the following patch series and further
 updates:
 
 [PATCH 0/6] R-Car DU: Fix IOMMU operation when connected to VSP
 
 arch/arm64/boot/dts/renesas/r8a7795.dtsi |    4 ++++
 1 file changed, 4 insertions(+)

--- 0004/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2016-10-27 18:06:14.180607110 +0900
@@ -1569,6 +1569,7 @@
 			reg = <0 0xfea27000 0 0x200>;
 			clocks = <&cpg CPG_MOD 603>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			iommus = <&ipmmu_vi 8>;
 		};
 
 		vspd1: vsp@fea28000 {
@@ -1586,6 +1587,7 @@
 			reg = <0 0xfea2f000 0 0x200>;
 			clocks = <&cpg CPG_MOD 602>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			iommus = <&ipmmu_vi 9>;
 		};
 
 		vspd2: vsp@fea30000 {
@@ -1603,6 +1605,7 @@
 			reg = <0 0xfea37000 0 0x200>;
 			clocks = <&cpg CPG_MOD 601>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			iommus = <&ipmmu_vi 10>;
 		};
 
 		vspd3: vsp@fea38000 {
@@ -1620,6 +1623,7 @@
 			reg = <0 0xfea3f000 0 0x200>;
 			clocks = <&cpg CPG_MOD 600>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			iommus = <&ipmmu_vi 11>;
 		};
 
 		fdp1@fe940000 {
