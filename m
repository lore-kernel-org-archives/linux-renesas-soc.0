Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53389 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387854AbeGWNH1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jul 2018 09:07:27 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/8] ARM: dts: porter: Add missing PMIC nodes
Date: Mon, 23 Jul 2018 14:06:19 +0200
Message-Id: <5058a96cb7e8dca97629c48084537fe5def8344f.1532345886.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1532345886.git.horms+renesas@verge.net.au>
References: <cover.1532345886.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Marek Vasut <marek.vasut@gmail.com>

Add PMIC nodes to Porter and connect CPU DVFS supply. There is
one DA9063L and one DA9210 on Porter, the only difference from
the other boards is that DA9063L is at I2C address 0x5a rather
than 0x58 .

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7791-porter.dts | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7791-porter.dts b/arch/arm/boot/dts/r8a7791-porter.dts
index a01101b49d99..5f77d73d7462 100644
--- a/arch/arm/boot/dts/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/r8a7791-porter.dts
@@ -375,10 +375,43 @@
 	clock-frequency = <400000>;
 };
 
+&i2c6 {
+	status = "okay";
+	clock-frequency = <100000>;
+
+	pmic@5a {
+		compatible = "dlg,da9063l";
+		reg = <0x5a>;
+		interrupt-parent = <&irqc0>;
+		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+
+		wdt {
+			compatible = "dlg,da9063-watchdog";
+		};
+	};
+
+	vdd_dvfs: regulator@68 {
+		compatible = "dlg,da9210";
+		reg = <0x68>;
+		interrupt-parent = <&irqc0>;
+		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
 &sata0 {
 	status = "okay";
 };
 
+&cpu0 {
+	cpu0-supply = <&vdd_dvfs>;
+};
+
 /* composite video input */
 &vin0 {
 	status = "okay";
-- 
2.11.0
