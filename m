Return-Path: <devicetree-owner@vger.kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170414211505.733692280@cogentembedded.com>
Date: Sat, 15 Apr 2017 00:09:42 +0300
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 1/3] ARM: dts: r8a7743: add PFC support
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=ARM-dts-r8a7743-add-PFC-support.patch
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define the generic R8A7743 part of the PFC device node.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/r8a7743.dtsi |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

Index: renesas/arch/arm/boot/dts/r8a7743.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7743.dtsi
+++ renesas/arch/arm/boot/dts/r8a7743.dtsi
@@ -1,7 +1,7 @@
 /*
  * Device Tree Source for the r8a7743 SoC
  *
- * Copyright (C) 2016 Cogent Embedded Inc.
+ * Copyright (C) 2016-2017 Cogent Embedded Inc.
  *
  * This file is licensed under the terms of the GNU General Public License
  * version 2. This program is licensed "as is" without any warranty of any
@@ -123,6 +123,11 @@
 			#power-domain-cells = <1>;
 		};
 
+		pfc: pin-controller@e6060000 {
+			compatible = "renesas,pfc-r8a7743";
+			reg = <0 0xe6060000 0 0x250>;
+		};
+
 		dmac0: dma-controller@e6700000 {
 			compatible = "renesas,dmac-r8a7743",
 				     "renesas,rcar-dmac";

