Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f48.google.com ([209.85.160.48]:39534 "EHLO
        mail-pl0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751328AbeCTIUR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Mar 2018 04:20:17 -0400
Received: by mail-pl0-f48.google.com with SMTP id k22-v6so532673pls.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Mar 2018 01:20:16 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Tue, 20 Mar 2018 17:20:31 +0900
Message-Id: <152153403134.8610.16591493940845260718.sendpatchset@little-apple>
In-Reply-To: <152153402203.8610.10666108438721508284.sendpatchset@little-apple>
References: <152153402203.8610.10666108438721508284.sendpatchset@little-apple>
Subject: [PATCH 1/2] arm: dts: r8a7778 Bock-W Ethernet has busted IRQs
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

The on-board ethernet on r8a7778 Bock-W does not work out of the
box. Booting with initramfs and trying to do ifconfig up/down will
show that something is busted.

Judging by the board schematics the IRQ signal from the LAN89218
chip gets routed to some magic board-specific FPGA and if the stars
happen to be aligned this signal may also reach the r8a7778 SoC.

This temporary hack tries to use the on-chip GPIO device in r8a7778 for
interrupts however on r8a7778 all the GPIO devices share the same interrupt
line in the GIC but I wonder if this really has been tested. I recall
writing the GPIO driver on r8a7779 and r8a73a4 and then extending to
R-Car Gen2 and Gen3. Not sure if it will work on r8a7778 or not.

Most likely the PFC needs to be configured to configure the IRQ0 signal
to use the irqpin driver, or the GPIO device may be used in a similar
fashion as this patch.

Unfortunately more effort is needed to track this down. A perhaps related
issue on Bock-W is that it sometimes hangs on boot without output on
the serial console. Yum.

Not for upstream merge.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Built on top of renesas-drivers-2018-03-13-v4.16-rc5

 arch/arm/boot/dts/r8a7778-bockw.dts |   12 ++++++++----
 arch/arm/boot/dts/r8a7778.dtsi      |    8 ++++----
 2 files changed, 12 insertions(+), 8 deletions(-)

--- 0001/arch/arm/boot/dts/r8a7778-bockw.dts
+++ work/arch/arm/boot/dts/r8a7778-bockw.dts	2018-03-20 13:56:14.270607110 +0900
@@ -66,13 +66,15 @@
 
 &bsc {
 	ethernet@18300000 {
-		compatible = "smsc,lan9220", "smsc,lan9115";
+		compatible = "smsc,lan89218", "smsc,lan9115";
 		reg = <0x18300000 0x1000>;
 
-		phy-mode = "mii";
-		interrupt-parent = <&irqpin>;
-		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <12 IRQ_TYPE_LEVEL_HIGH>;
 		reg-io-width = <4>;
+		smsc,force-internal-phy;
+		smsc,irq-active-high;
+		smsc,irq-push-pull;
 		vddvario-supply = <&fixedregulator3v3>;
 		vdd33a-supply = <&fixedregulator3v3>;
 	};
@@ -185,6 +187,7 @@
 	#sound-dai-cells = <0>;
 };
 
+#if 0
 &sdhi0 {
 	pinctrl-0 = <&sdhi0_pins>, <&sdhi0_pup_pins>;
 	pinctrl-names = "default";
@@ -194,6 +197,7 @@
 	status = "okay";
 	wp-gpios = <&gpio3 18 GPIO_ACTIVE_HIGH>;
 };
+#endif
 
 &hspi0 {
 	pinctrl-0 = <&hspi0_pins>;
--- 0001/arch/arm/boot/dts/r8a7778.dtsi
+++ work/arch/arm/boot/dts/r8a7778.dtsi	2018-03-20 14:01:03.260607110 +0900
@@ -88,7 +88,7 @@
 				GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
 		sense-bitfield-width = <2>;
 	};
-
+#if 0
 	gpio0: gpio@ffc40000 {
 		compatible = "renesas,gpio-r8a7778", "renesas,rcar-gen1-gpio";
 		reg = <0xffc40000 0x2c>;
@@ -99,7 +99,7 @@
 		#interrupt-cells = <2>;
 		interrupt-controller;
 	};
-
+#endif
 	gpio1: gpio@ffc41000 {
 		compatible = "renesas,gpio-r8a7778", "renesas,rcar-gen1-gpio";
 		reg = <0xffc41000 0x2c>;
@@ -110,7 +110,7 @@
 		#interrupt-cells = <2>;
 		interrupt-controller;
 	};
-
+#if 0
 	gpio2: gpio@ffc42000 {
 		compatible = "renesas,gpio-r8a7778", "renesas,rcar-gen1-gpio";
 		reg = <0xffc42000 0x2c>;
@@ -143,7 +143,7 @@
 		#interrupt-cells = <2>;
 		interrupt-controller;
 	};
-
+#endif
 	pfc: pin-controller@fffc0000 {
 		compatible = "renesas,pfc-r8a7778";
 		reg = <0xfffc0000 0x118>;
