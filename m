Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:34559 "EHLO
	mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752912AbcFCVhk (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 3 Jun 2016 17:37:40 -0400
Received: by mail-lf0-f46.google.com with SMTP id k98so62468414lfi.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Jun 2016 14:37:40 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 11/11] ARM: dts: blanche: add Ethernet support
Date: Sat, 04 Jun 2016 00:37:37 +0300
Message-ID: <3446158.3RAgrIF8O1@wasted.cogentembedded.com>
In-Reply-To: <3446154.oZ24315zaL@wasted.cogentembedded.com>
References: <3446154.oZ24315zaL@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

R8A7792  SoC  doesn't have the EtherMAC core, so SMSC  LAN89218  Ethernet
chip was used instead on the Blanche board; this chip  is compatible with
SMSC LAN9115  for  which there's a (device tree aware) driver. Describe
the  chip in  the  Blanche device tree;  enable DHCP and NFS root in the
kernel command line for the kernel booting.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Acked-by: Simon Horman <horms+renesas@verge.net.au>

---
Changes in version 2:
- added Simon's ACK.

 arch/arm/boot/dts/r8a7792-blanche.dts |   23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

Index: renesas/arch/arm/boot/dts/r8a7792-blanche.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792-blanche.dts
+++ renesas/arch/arm/boot/dts/r8a7792-blanche.dts
@@ -21,7 +21,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
 		stdout-path = "serial0:115200n8";
 	};
 
@@ -29,6 +29,27 @@
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
+		reg-io-width = <4>;
+		vddvario-supply = <&d3_3v>;
+		vdd33a-supply = <&d3_3v>;
+	};
 };
 
 &extal_clk {
