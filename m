Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58074 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729176AbeI1Qpf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 12:45:35 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 7/7] ARM: dts: iwg20d-q7-common: Move pciec node out of common dtsi
Date: Fri, 28 Sep 2018 12:22:14 +0200
Message-Id: <e0a39511dafd7e302a974f5cbdfc9c8afffa98d8.1538123642.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1538123642.git.horms+renesas@verge.net.au>
References: <cover.1538123642.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Biju Das <biju.das@bp.renesas.com>

PCIe is not populated by default on iWave RZ/G1N board. RZ/G1N board
is almost identical to RZ/G1M. In order to reuse the common dtsi for
both the boards, it is required to move pcie node from common dtsi
to board specific dts.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/iwg20d-q7-common.dtsi         | 4 ----
 arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts | 4 ++++
 arch/arm/boot/dts/r8a7743-iwg20d-q7.dts         | 4 ++++
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
index 5cae74eb6cdd..ca9154dd8052 100644
--- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
+++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
@@ -160,10 +160,6 @@
 	clock-frequency = <100000000>;
 };
 
-&pciec {
-	status = "okay";
-};
-
 &pfc {
 	can0_pins: can0 {
 		groups = "can0_data_d";
diff --git a/arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts
index 327545119ee3..0d006aea99da 100644
--- a/arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts
+++ b/arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts
@@ -14,3 +14,7 @@
 	model = "iW-RainboW-G20D-Q7 RZ/G1M based plus camera daughter board";
 	compatible = "iwave,g20d", "iwave,g20m", "renesas,r8a7743";
 };
+
+&pciec {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts b/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
index b683db4da8b1..498e223a5f93 100644
--- a/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
+++ b/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
@@ -13,3 +13,7 @@
 	model = "iWave Systems RainboW-G20D-Qseven board based on RZ/G1M";
 	compatible = "iwave,g20d", "iwave,g20m", "renesas,r8a7743";
 };
+
+&pciec {
+	status = "okay";
+};
-- 
2.11.0
