Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:34169 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754308AbdDOUUp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Apr 2017 16:20:45 -0400
Received: by mail-lf0-f44.google.com with SMTP id t144so52826796lff.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Apr 2017 13:20:44 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170415202040.456202938@cogentembedded.com>
Date: Sat, 15 Apr 2017 23:18:27 +0300
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 2/3] ARM: dts: sk-rzg1e: add SCIF2 pins
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=ARM-dts-sk-rzg1e-add-SCIF2-pins.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the (previously omitted) SCIF2 pin data to the SK-RZG1E board's
device tree.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/r8a7745-sk-rzg1e.dts |   12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

Index: renesas/arch/arm/boot/dts/r8a7745-sk-rzg1e.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7745-sk-rzg1e.dts
+++ renesas/arch/arm/boot/dts/r8a7745-sk-rzg1e.dts
@@ -1,7 +1,7 @@
 /*
  * Device Tree Source for the SK-RZG1E board
  *
- * Copyright (C) 2016 Cogent Embedded, Inc.
+ * Copyright (C) 2016-2017 Cogent Embedded, Inc.
  *
  * This file is licensed under the terms of the GNU General Public License
  * version 2. This program is licensed "as is" without any warranty of any
@@ -34,7 +34,17 @@
 	clock-frequency = <20000000>;
 };
 
+&pfc {
+	scif2_pins: scif2 {
+		groups = "scif2_data";
+		function = "scif2";
+	};
+};
+
 &scif2 {
+	pinctrl-0 = <&scif2_pins>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };
 
