Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:56106 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753960AbdKJUHT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Nov 2017 15:07:19 -0500
Received: by mail-lf0-f68.google.com with SMTP id e143so12301263lfg.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Nov 2017 12:07:18 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20171110200714.406365231@cogentembedded.com>
Date: Fri, 10 Nov 2017 23:02:21 +0300
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 3/3] arm64: dts: renesas: eagle: add EtherAVB pins
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=arm64-dts-renesas-eagle-add-EtherAVB-pins.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the (previously omitted) EtherAVB pin data to the Eagle board's
device tree.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts |    8 ++++++++
 1 file changed, 8 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -34,6 +34,9 @@
 };
 
 &avb {
+	pinctrl-0 = <&avb_pins>;
+	pinctrl-names = "default";
+
 	renesas,no-ether-link;
 	phy-handle = <&phy0>;
 	status = "okay";
@@ -53,6 +56,11 @@
 };
 
 &pfc {
+	avb_pins: avb {
+		groups = "avb0_mdio", "avb0_mii";
+		function = "avb0";
+	};
+
 	scif0_pins: scif0 {
 		groups = "scif0_data";
 		function = "scif0";
