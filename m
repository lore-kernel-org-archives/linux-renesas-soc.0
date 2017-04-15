Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:33460 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754157AbdDOUUl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Apr 2017 16:20:41 -0400
Received: by mail-lf0-f51.google.com with SMTP id 88so5693245lfr.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Apr 2017 13:20:41 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170415202036.987901107@cogentembedded.com>
Date: Sat, 15 Apr 2017 23:18:26 +0300
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 1/3] ARM: dts: r8a7745: add PFC support
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=ARM-dts-r8a7745-add-PFC-support.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define the generic R8A7745 part of the PFC device node.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/r8a7745.dtsi |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

Index: renesas/arch/arm/boot/dts/r8a7745.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7745.dtsi
+++ renesas/arch/arm/boot/dts/r8a7745.dtsi
@@ -1,7 +1,7 @@
 /*
  * Device Tree Source for the r8a7745 SoC
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
+			compatible = "renesas,pfc-r8a7745";
+			reg = <0 0xe6060000 0 0x11c>;
+		};
+
 		dmac0: dma-controller@e6700000 {
 			compatible = "renesas,dmac-r8a7745",
 				     "renesas,rcar-dmac";
