Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47467 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754887AbdLFKXy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Dec 2017 05:23:54 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 36/61] ARM: dts: iwg20d-q7-common: Add can0 support to carrier board
Date: Wed,  6 Dec 2017 11:22:31 +0100
Message-Id: <47f3c7b66b6d316f86b0ce957c99958da0268e36.1512555546.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1512555546.git.horms+renesas@verge.net.au>
References: <cover.1512555546.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

This patch enables CAN0 interface exposed through connector J20 on the
carrier board.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/iwg20d-q7-common.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
index c865499ad2a1..3e4bc4d6b9d3 100644
--- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
+++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
@@ -59,6 +59,13 @@
 	};
 };
 
+&can0 {
+	pinctrl-0 = <&can0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &hsusb {
 	status = "okay";
 	pinctrl-0 = <&usb0_pins>;
@@ -90,6 +97,11 @@
 };
 
 &pfc {
+	can0_pins: can0 {
+		groups = "can0_data_d";
+		function = "can0";
+	};
+
 	avb_pins: avb {
 		groups = "avb_mdio", "avb_gmii";
 		function = "avb";
-- 
2.11.0
