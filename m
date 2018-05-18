Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:42686 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751320AbeERTqW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 15:46:22 -0400
Received: by mail-lf0-f67.google.com with SMTP id b18-v6so15579589lfa.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 May 2018 12:46:21 -0700 (PDT)
Subject: [PATCH 2/2] arm64: dts: renesas: v3hsk: add GEther support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Simon Horman <horms@verge.net.au>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
References: <a4230699-e46f-0782-e3b1-22d58b9033c8@cogentembedded.com>
Message-ID: <7a853b57-747e-7536-89fe-2e0c847f58f4@cogentembedded.com>
Date: Fri, 18 May 2018 22:46:19 +0300
MIME-Version: 1.0
In-Reply-To: <a4230699-e46f-0782-e3b1-22d58b9033c8@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define the V3H Starter Kit board dependent part of the GEther device node.

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
@@ -15,6 +15,7 @@
 
 	aliases {
 		serial0 = &scif0;
+		ethernet0 = &gether;
 	};
 
 	chosen {
@@ -36,7 +37,27 @@
 	clock-frequency = <32768>;
 };
 
+&gether {
+	pinctrl-0 = <&gether_pins>;
+	pinctrl-names = "default";
+
+	phy-mode = "rgmii";
+	phy-handle = <&phy0>;
+	renesas,no-ether-link;
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
 &pfc {
+	gether_pins: gether {
+		groups = "gether_mdio_a", "gether_rgmii",
+			 "gether_txcrefclk", "gether_txcrefclk_mega";
+		function = "gether";
+	};
+
 	scif0_pins: scif0 {
 		groups = "scif0_data";
 		function = "scif0";
