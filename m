Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56098 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752619AbdKJNZw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Nov 2017 08:25:52 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v5 10/15] arm64: dts: renesas: r8a7795: Point VSPI via FCPVI to IPMMU-VP0/1
Date: Fri, 10 Nov 2017 14:25:27 +0100
Message-Id: <20171110132532.1202-11-horms+renesas@verge.net.au>
In-Reply-To: <20171110132532.1202-1-horms+renesas@verge.net.au>
References: <20171110132532.1202-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Hook up the FCPVI devices to allow use of VSPI with
IPMMU-VP0 and IPMMU-VP1.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5 [Simon Horman]
* Added reviewed by tag from Geert Uytterhoeven

v4 [Simon Horman]
* broke out of larger patch
* Use IPMMU-VP1 for FCPVI1 on ES2.0

v1 - v3 [Magnus Damm]
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 4 ++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi     | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index 3d50627c0670..b2d2f04c5e1c 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -159,6 +159,10 @@
 	iommus = <&ipmmu_vp0 1>;
 };
 
+&fcpvi1 {
+	iommus = <&ipmmu_vp0 9>;
+};
+
 &fcpvd2 {
 	iommus = <&ipmmu_vi0 10>;
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index cf9708ac46eb..851324eac5ed 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -2120,6 +2120,7 @@
 			clocks = <&cpg CPG_MOD 611>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 			resets = <&cpg 611>;
+			iommus = <&ipmmu_vp0 8>;
 		};
 
 		vspi1: vsp@fe9b0000 {
@@ -2139,6 +2140,7 @@
 			clocks = <&cpg CPG_MOD 610>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 			resets = <&cpg 610>;
+			iommus = <&ipmmu_vp1 9>;
 		};
 
 		vspd0: vsp@fea20000 {
-- 
2.11.0
