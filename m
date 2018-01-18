Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f176.google.com ([209.85.192.176]:36585 "EHLO
        mail-pf0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752368AbeARTH6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jan 2018 14:07:58 -0500
Received: by mail-pf0-f176.google.com with SMTP id 23so15377389pfp.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jan 2018 11:07:58 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Fri, 19 Jan 2018 04:07:21 +0900
Message-Id: <151630244106.14098.1751390484334216468.sendpatchset@little-apple>
In-Reply-To: <151630243226.14098.14517816422611139335.sendpatchset@little-apple>
References: <151630243226.14098.14517816422611139335.sendpatchset@little-apple>
Subject: [PATCH/RFC 01/03] arm64: dts: renesas: r8a77970: Add PFC node for Eagle V3M
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add DT nodes for the PFC on the r8a77970 SoC and hook up the SCIF
console to make use of the PFC to configure the pins.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Depends on r8a77970 PFC support - included in latest renesas-drivers

 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts |   10 ++++++++++
 arch/arm64/boot/dts/renesas/r8a77970.dtsi      |    5 +++++
 2 files changed, 15 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ work/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts	2018-01-19 03:43:18.050607110 +0900
@@ -52,11 +52,21 @@
 	clock-frequency = <32768>;
 };
 
+&pfc {
+	scif0_pins: scif0 {
+		groups = "scif0_data";
+		function = "scif0";
+	};
+};
+
 &rwdt {
 	timeout-sec = <60>;
 	status = "okay";
 };
 
 &scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };
--- 0001/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ work/arch/arm64/boot/dts/renesas/r8a77970.dtsi	2018-01-19 03:43:36.990607110 +0900
@@ -117,6 +117,11 @@
 			reg = <0 0xe6160000 0 0x200>;
 		};
 
+		pfc: pin-controller@e6060000 {
+			compatible = "renesas,pfc-r8a77970";
+			reg = <0 0xe6060000 0 0x504>;
+		};
+
 		sysc: system-controller@e6180000 {
 			compatible = "renesas,r8a77970-sysc";
 			reg = <0 0xe6180000 0 0x440>;
