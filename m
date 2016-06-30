Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:34258 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752038AbcF3XHq (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 30 Jun 2016 19:07:46 -0400
Received: by mail-lf0-f49.google.com with SMTP id h129so65891770lfh.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jun 2016 16:07:01 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] ARM: dts: r8a7792: add PFC support
Date: Fri, 01 Jul 2016 02:06:58 +0300
Message-ID: <7894702.b5qeLxoHdo@wasted.cogentembedded.com>
In-Reply-To: <2144803.0K8qXzjIFq@wasted.cogentembedded.com>
References: <2144803.0K8qXzjIFq@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define the generic R8A7792 part of the PFC device node.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/r8a7792.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7792.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792.dtsi
+++ renesas/arch/arm/boot/dts/r8a7792.dtsi
@@ -108,6 +108,12 @@
 			#power-domain-cells = <1>;
 		};
 
+
+		pfc: pin-controller@e6060000 {
+			compatible = "renesas,pfc-r8a7792";
+			reg = <0 0xe6060000 0 0x144>;
+		};
+
 		dmac0: dma-controller@e6700000 {
 			compatible = "renesas,dmac-r8a7792",
 				     "renesas,rcar-dmac";
