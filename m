Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:36049 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755292AbcJEVsM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Oct 2016 17:48:12 -0400
Received: by mail-lf0-f46.google.com with SMTP id b75so617347lfg.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Oct 2016 14:48:11 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 11/11] ARM: dts: sk-rzg1m: add Ether support
Date: Thu, 06 Oct 2016 00:48:09 +0300
Message-ID: <1764267.cmIUehPqzi@wasted.cogentembedded.com>
In-Reply-To: <2056698.ncAHq8vRQ3@wasted.cogentembedded.com>
References: <2056698.ncAHq8vRQ3@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define the SK-RZG1M board dependent part of the Ether device node.
Enable DHCP and NFS root  for the kernel booting.

Based on the original (and large) patch by Dmitry Shifrin
<dmitry.shifrin@cogentembedded.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- new patch.

 arch/arm/boot/dts/r8a7743-sk-rzg1m.dts |   15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

Index: renesas/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
+++ renesas/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
@@ -20,7 +20,7 @@
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
 		stdout-path = "serial0:115200n8";
 	};
 
@@ -42,3 +42,16 @@
 &scif0 {
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
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		micrel,led-mode = <1>;
+	};
+};
