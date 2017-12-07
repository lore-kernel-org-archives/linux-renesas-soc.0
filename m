Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35788 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751958AbdLGJzE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Dec 2017 04:55:04 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 25/54] arm64: dts: renesas: r8a7795: Point FDP1 via FCPF to IPMMU-VP0/1
Date: Thu,  7 Dec 2017 10:53:28 +0100
Message-Id: <afdeb149aaecdd7151f4e43f2531dee59e53ced0.1512640145.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1512640145.git.horms+renesas@verge.net.au>
References: <cover.1512640145.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Hook up the FCPF devices to allow use of FDP1 with IPMMU-VP.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 4 ++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi     | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index 1eafa5382e86..6b4dfa42f5b2 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -150,6 +150,10 @@
 	       <&ipmmu_mp1 30>, <&ipmmu_mp1 31>;
 };
 
+&fcpf1 {
+	iommus = <&ipmmu_vp0 1>;
+};
+
 &fcpvd2 {
 	iommus = <&ipmmu_vi0 10>;
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 6187e9c33e88..f7d7c98a7f73 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -2070,6 +2070,7 @@
 			clocks = <&cpg CPG_MOD 615>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 			resets = <&cpg 615>;
+			iommus = <&ipmmu_vp0 0>;
 		};
 
 		fcpf1: fcp@fe951000 {
@@ -2078,6 +2079,7 @@
 			clocks = <&cpg CPG_MOD 614>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 			resets = <&cpg 614>;
+			iommus = <&ipmmu_vp1 1>;
 		};
 
 		vspbd: vsp@fe960000 {
-- 
2.11.0
