Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55692 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752216AbdKAKgX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Nov 2017 06:36:23 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v4 07/15] arm64: dts: renesas: r8a7795: Point FDP1 via FCPF to IPMMU-VP0/1
Date: Wed,  1 Nov 2017 11:34:44 +0100
Message-Id: <20171101103452.7491-8-horms+renesas@verge.net.au>
In-Reply-To: <20171101103452.7491-1-horms+renesas@verge.net.au>
References: <20171101103452.7491-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Hook up the FCPF devices to allow use of FDP1 with IPMMU-VP.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v4 [Simon Horman]
* Broke out of larger patch
* Use IPMMU-VP1 for FCPF1 on ES2.0

v1 - v3 [Magnus Damm]
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 4 ++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi     | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index ee1e39ae3c7b..451072397601 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -146,6 +146,10 @@
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
index 7addd5ea07e0..74076d76f5a5 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -2052,6 +2052,7 @@
 			clocks = <&cpg CPG_MOD 615>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 			resets = <&cpg 615>;
+			iommus = <&ipmmu_vp0 0>;
 		};
 
 		fcpf1: fcp@fe951000 {
@@ -2060,6 +2061,7 @@
 			clocks = <&cpg CPG_MOD 614>;
 			power-domains = <&sysc R8A7795_PD_A3VP>;
 			resets = <&cpg 614>;
+			iommus = <&ipmmu_vp1 1>;
 		};
 
 		vspbd: vsp@fe960000 {
-- 
2.11.0
