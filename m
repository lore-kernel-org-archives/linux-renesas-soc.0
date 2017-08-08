Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:20590 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751998AbdHHLLP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Aug 2017 07:11:15 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Chris Paterson <chris.paterson2@renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  2/3] ARM: dts: r8a7743: Add APMU node and second CPU core
Date: Tue,  8 Aug 2017 11:56:32 +0100
Message-Id: <1502189793-59679-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1502189793-59679-1-git-send-email-biju.das@bp.renesas.com>
References: <1502189793-59679-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add DT nodes for the Advanced Power Management Unit (APMU) and the
second CPU core.  Use the enable-method to point out that the APMU
should be used for SMP support.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7743.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index f62e858..77da319 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -21,6 +21,7 @@
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "renesas,apmu";
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -32,6 +33,15 @@
 			next-level-cache = <&L2_CA15>;
 		};
 
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a15";
+			reg = <1>;
+			clock-frequency = <1500000000>;
+			power-domains = <&sysc R8A7743_PD_CA15_CPU1>;
+			next-level-cache = <&L2_CA15>;
+		};
+
 		L2_CA15: cache-controller-0 {
 			compatible = "cache";
 			cache-unified;
@@ -48,6 +58,12 @@
 		#size-cells = <2>;
 		ranges;
 
+		apmu@e6152000 {
+			compatible = "renesas,r8a7743-apmu", "renesas,apmu";
+			reg = <0 0xe6152000 0 0x188>;
+			cpus = <&cpu0 &cpu1>;
+		};
+
 		gic: interrupt-controller@f1001000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-- 
1.9.1
