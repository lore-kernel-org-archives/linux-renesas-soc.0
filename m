Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f174.google.com ([209.85.192.174]:45342 "EHLO
        mail-pf0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752638AbeBSMiJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Feb 2018 07:38:09 -0500
Received: by mail-pf0-f174.google.com with SMTP id j24so1138956pff.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2018 04:38:09 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 19 Feb 2018 21:37:58 +0900
Message-Id: <151904387813.30430.10543147136498508821.sendpatchset@little-apple>
Subject: [PATCH] ARM: dts: marzen: Add SDHI0 VCCQ Regulator
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add support for the on-board voltage regulator hooked up to GPIO3_20
on r8a7779 Marzen. The board schematics describes the regulator as U4
TPS2110A. Input wise, U4 has D0 fixed to ground, D1 tied to GPIO3_20
while IN1 is fixed to 3.3V and IN2 is fixed to 1.8V. OUT goes to the
pull-ups for the data pins of SDHI0.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm/boot/dts/r8a7779-marzen.dts |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

--- 0001/arch/arm/boot/dts/r8a7779-marzen.dts
+++ work/arch/arm/boot/dts/r8a7779-marzen.dts	2018-02-19 21:21:14.400607110 +0900
@@ -42,6 +42,19 @@
 		regulator-always-on;
 	};
 
+	vccq_sdhi0: regulator-vccq-sdhi0 {
+		compatible = "regulator-gpio";
+
+		regulator-name = "SDHI0 VccQ";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpios = <&gpio3 20 GPIO_ACTIVE_HIGH>;
+		gpios-states = <1>;
+		states = <3300000 1
+			  1800000 0>;
+	};
+
 	ethernet@18000000 {
 		compatible = "smsc,lan9220", "smsc,lan9115";
 		reg = <0x18000000 0x100>;
@@ -243,6 +256,7 @@
 	pinctrl-names = "default";
 
 	vmmc-supply = <&fixedregulator3v3>;
+	vqmmc-supply = <&vccq_sdhi0>;
 	bus-width = <4>;
 	status = "okay";
 };
