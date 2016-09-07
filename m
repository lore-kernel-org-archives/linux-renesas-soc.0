Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57254 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756483AbcIGHuz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Sep 2016 03:50:55 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 14/26] ARM: dts: wheat: add Ethernet support
Date: Wed,  7 Sep 2016 09:50:01 +0200
Message-Id: <1d9a17dd3f98e3e8d5484224bc9e96f6cb30288b.1473234371.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1473234371.git.horms+renesas@verge.net.au>
References: <cover.1473234371.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

R8A7792  SoC  doesn't have the  EtherMAC core, so SMSC LAN89218 Ethernet
chip was used instead on the Wheat debug board; this chip is compatible
with SMSC LAN9115 for which  there's a (device  tree aware)  driver.
Describe the chip  in the Wheat device tree unconditionally (the driver
should fail the probe if the debug board isn't connected); enable DHCP and
NFS root in the command line for the kernel boot...

Based  on the original (and large) patch by Vladimir Barinov
<vladimir.barinov@cogentembedded.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7792-wheat.dts | 38 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7792-wheat.dts b/arch/arm/boot/dts/r8a7792-wheat.dts
index 22ae14ffc917..e214d707f81d 100644
--- a/arch/arm/boot/dts/r8a7792-wheat.dts
+++ b/arch/arm/boot/dts/r8a7792-wheat.dts
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
-- 
2.7.0.rc3.207.g0ac5344
