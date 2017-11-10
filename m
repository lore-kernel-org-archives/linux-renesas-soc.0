Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56098 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752619AbdKJNZv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Nov 2017 08:25:51 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v5 09/15] arm64: dts: renesas: r8a7795: Point VSPBC/VSPBD via FCPVB to IPMMU-VP0/1
Date: Fri, 10 Nov 2017 14:25:26 +0100
Message-Id: <20171110132532.1202-10-horms+renesas@verge.net.au>
In-Reply-To: <20171110132532.1202-1-horms+renesas@verge.net.au>
References: <20171110132532.1202-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Hook up the FCPVB devices to allow use of VSPBC/VSPBD with
IPMMU-VP0 and IPMMU-VP1.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5 [Simon Horman]
* Added reviewed by tag from Geert Uytterhoeven

v4 [Simon Horman]
* Use IPMMU-VP1 for FCPVP1 on ES2.0
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 4 ++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi     | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index 736281335653..3d50627c0670 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -151,6 +151,10 @@
 	       <&ipmmu_mp1 30>, <&ipmmu_mp1 31>;
 };
 
+&fcpvb1 {
+	iommus = <&ipmmu_vp0 7>;
+};
+
 &fcpf1 {
 	iommus = <&ipmmu_vp0 1>;
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 1202b84104a0..cf9708ac46eb 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -2062,6 +2062,7 @@
 			clocks = <&cpg CPG_MOD 606>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 			resets = <&cpg 606>;
+			iommus = <&ipmmu_vp1 7>;
 		};
 
 		fcpf0: fcp@fe950000 {
@@ -2099,6 +2100,7 @@
 			clocks = <&cpg CPG_MOD 607>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 			resets = <&cpg 607>;
+			iommus = <&ipmmu_vp0 5>;
 		};
 
 		vspi0: vsp@fe9a0000 {
-- 
2.11.0
