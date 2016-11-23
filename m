Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57433 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936222AbcKWUPv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Nov 2016 15:15:51 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 17/31] ARM: dts: sk-rzg1m: add Ether support
Date: Wed, 23 Nov 2016 21:14:24 +0100
Message-Id: <d05ab65b1d0b7fdd0f25439a3bf234324a419d94.1479931687.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1479931686.git.horms+renesas@verge.net.au>
References: <cover.1479931686.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Define the SK-RZG1M board dependent part of the Ether device node.
Enable DHCP and NFS root  for the kernel booting.

Based on the original (and large) patch by Dmitry Shifrin
<dmitry.shifrin@cogentembedded.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7743-sk-rzg1m.dts | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts b/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
index ed26961c9434..3a22538208f2 100644
--- a/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
+++ b/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
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
-- 
2.7.0.rc3.207.g0ac5344
