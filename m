Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:35874 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753051AbdCTImD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2017 04:42:03 -0400
Received: by mail-pg0-f66.google.com with SMTP id 81so10492303pgh.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2017 01:41:14 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com, joro@8bytes.org,
        geert+renesas@glider.be
Date: Mon, 20 Mar 2017 17:35:45 +0900
Message-Id: <148999894550.20118.15551453303152614062.sendpatchset@little-apple>
In-Reply-To: <148999891819.20118.10698449216124481808.sendpatchset@little-apple>
References: <148999891819.20118.10698449216124481808.sendpatchset@little-apple>
Subject: [PATCH v3 03/09] arm64: dts: r8a7795: Point DU/VSPD via FCPVD to IPMMU-VI
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Hook up the FCPVD devices to allow use of the VSP and DU
together with IPMMU-VI.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V2:
 - New patch

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |    4 ++++
 1 file changed, 4 insertions(+)

--- 0004/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi	2017-03-20 15:57:39.990607110 +0900
@@ -1738,6 +1738,7 @@
 			compatible = "renesas,fcpv";
 			reg = <0 0xfea27000 0 0x200>;
 			clocks = <&cpg CPG_MOD 603>;
+			iommus = <&ipmmu_vi 8>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 		};
 
@@ -1755,6 +1756,7 @@
 			compatible = "renesas,fcpv";
 			reg = <0 0xfea2f000 0 0x200>;
 			clocks = <&cpg CPG_MOD 602>;
+			iommus = <&ipmmu_vi 9>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 		};
 
@@ -1772,6 +1774,7 @@
 			compatible = "renesas,fcpv";
 			reg = <0 0xfea37000 0 0x200>;
 			clocks = <&cpg CPG_MOD 601>;
+			iommus = <&ipmmu_vi 10>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 		};
 
@@ -1789,6 +1792,7 @@
 			compatible = "renesas,fcpv";
 			reg = <0 0xfea3f000 0 0x200>;
 			clocks = <&cpg CPG_MOD 600>;
+			iommus = <&ipmmu_vi 11>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 		};
 
