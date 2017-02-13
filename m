Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:24526 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752438AbdBMS0I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2017 13:26:08 -0500
From: Chris Brandt <chris.brandt@renesas.com>
To: Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 3/3] ARM: dts: r7s72100: Add reset handler
Date: Mon, 13 Feb 2017 13:25:32 -0500
Message-Id: <20170213182532.4042-4-chris.brandt@renesas.com>
In-Reply-To: <20170213182532.4042-1-chris.brandt@renesas.com>
References: <20170213182532.4042-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

For the RZ/A1, the only way to do a reset is to overflow the WDT.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s72100.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 614ba79..6fb4ef4 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -371,6 +371,11 @@
 			<0xe8202000 0x1000>;
 	};
 
+	wdt: timer@fcfe0000 {
+		compatible = "renesas,r7s72100-reset", "renesas,wdt-reset";
+		reg = <0xfcfe0000 0x6>;
+	};
+
 	i2c0: i2c@fcfee000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.10.1
