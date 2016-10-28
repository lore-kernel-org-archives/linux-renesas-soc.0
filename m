Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:33618 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752327AbcJ1WbT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Oct 2016 18:31:19 -0400
Received: by mail-lf0-f45.google.com with SMTP id x79so66918766lff.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2016 15:31:18 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 11/12] ARM: dts: sk-rzg1e: add Ether support
Date: Sat, 29 Oct 2016 01:31:16 +0300
Message-ID: <1653044.nY120UqMZW@wasted.cogentembedded.com>
In-Reply-To: <4121805.SRTmqJtRfv@wasted.cogentembedded.com>
References: <4121805.SRTmqJtRfv@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define the SK-RZG1E board dependent part of the Ether device node.
Enable DHCP and NFS root  for the kernel booting.

Based on the original (and large) patch by Dmitry Shifrin
<dmitry.shifrin@cogentembedded.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/r8a7745-sk-rzg1e.dts |   15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

Index: renesas/arch/arm/boot/dts/r8a7745-sk-rzg1e.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7745-sk-rzg1e.dts
+++ renesas/arch/arm/boot/dts/r8a7745-sk-rzg1e.dts
@@ -20,7 +20,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
 		stdout-path = "serial0:115200n8";
 	};
 
@@ -37,3 +37,16 @@
 &scif2 {
 	status = "okay";
 };
+
+&ether {
+	phy-handle = <&phy1>;
+	renesas,ether-link-active-low;
+	status = "okay";
+
+	phy1: ethernet-phy@1 {
+		reg = <1>;
+		interrupt-parent = <&irqc>;
+		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+		micrel,led-mode = <1>;
+	};
+};
