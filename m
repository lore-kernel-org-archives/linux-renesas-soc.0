Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:34950 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751584AbcHZUXR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2016 16:23:17 -0400
Received: by mail-lf0-f51.google.com with SMTP id f93so64320326lfi.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2016 13:23:16 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] ARM: dts: wheat: add Ethernet support
Date: Fri, 26 Aug 2016 23:23:13 +0300
Message-ID: <6321460.7sCGaKUd5m@wasted.cogentembedded.com>
In-Reply-To: <3665116.9BjHTnhfR3@wasted.cogentembedded.com>
References: <3665116.9BjHTnhfR3@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

R8A7792  SoC  doesn't have the  EtherMAC core, so SMSC LAN89218 Ethernet
chip was used instead on the Wheat debug board; this chip is compatible
with SMSC LAN9115 for which  there's a (device  tree aware)  driver.
Describe the chip  in the Wheat device tree unconditionally (the driver
should fail the probe if the debug board isn't connected); enable DHCP and
NFS root in the command line for the kernel boot...

Based  on the original (and large) patch by Vladimir Barinov 
<vladimir.barinov@cogentembedded.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/r8a7792-wheat.dts |   38 +++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

Index: renesas/arch/arm/boot/dts/r8a7792-wheat.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792-wheat.dts
+++ renesas/arch/arm/boot/dts/r8a7792-wheat.dts
@@ -21,7 +21,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
 		stdout-path = "serial0:115200n8";
 	};
 
@@ -29,6 +29,31 @@
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x40000000>;
 	};
+
+	d3_3v: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "D3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	ethernet@18000000 {
+		compatible = "smsc,lan89218", "smsc,lan9115";
+		reg = <0 0x18000000 0 0x100>;
+		phy-mode = "mii";
+		interrupt-parent = <&irqc>;
+		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+		smsc,irq-push-pull;
+		smsc,save-mac-address;
+		reg-io-width = <4>;
+		vddvario-supply = <&d3_3v>;
+		vdd33a-supply = <&d3_3v>;
+
+		pinctrl-0 = <&lan89218_pins>;
+		pinctrl-names = "default";
+	};
 };
 
 &extal_clk {
@@ -40,6 +65,17 @@
 		groups = "scif0_data";
 		function = "scif0";
 	};
+
+	lan89218_pins: lan89218 {
+		intc {
+			groups = "intc_irq0";
+			function = "intc";
+		};
+		lbsc {
+			groups = "lbsc_ex_cs0";
+			function = "lbsc";
+		};
+	};
 };
 
 &scif0 {
