Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:27341 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751054AbdIMRF5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Sep 2017 13:05:57 -0400
From: Chris Paterson <chris.paterson2@renesas.com>
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chris Paterson <chris.paterson2@renesas.com>
Subject: [PATCH 1/8] ARM: dts: r8a7745: Add APMU node and second CPU core
Date: Wed, 13 Sep 2017 18:05:34 +0100
Message-Id: <1505322341-9480-2-git-send-email-chris.paterson2@renesas.com>
In-Reply-To: <1505322341-9480-1-git-send-email-chris.paterson2@renesas.com>
References: <1505322341-9480-1-git-send-email-chris.paterson2@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Add DT node for the Advanced Power Management Unit (APMU), add the
second CPU core, and use "renesas,apmu" as "enable-method".

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
---
This patch is based on renesas-devel-20170913-v4.13.


 arch/arm/boot/dts/r8a7745.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
index 6e82991..8ed2ac5 100644
--- a/arch/arm/boot/dts/r8a7745.dtsi
+++ b/arch/arm/boot/dts/r8a7745.dtsi
@@ -30,6 +30,7 @@
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "renesas,apmu";
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -41,6 +42,15 @@
 			next-level-cache = <&L2_CA7>;
 		};
 
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <1>;
+			clock-frequency = <1000000000>;
+			power-domains = <&sysc R8A7745_PD_CA7_CPU1>;
+			next-level-cache = <&L2_CA7>;
+		};
+
 		L2_CA7: cache-controller-0 {
 			compatible = "cache";
 			cache-unified;
@@ -57,6 +67,12 @@
 		#size-cells = <2>;
 		ranges;
 
+		apmu@e6151000 {
+			compatible = "renesas,r8a7745-apmu", "renesas,apmu";
+			reg = <0 0xe6151000 0 0x188>;
+			cpus = <&cpu0 &cpu1>;
+		};
+
 		gic: interrupt-controller@f1001000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-- 
1.9.1
