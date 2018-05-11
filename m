Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:29593 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752509AbeEKEb6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 May 2018 00:31:58 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 4/4] arm64: dts: renesas: r8a77990: ebisu: Enable EthernetAVB
Date: Fri, 11 May 2018 13:31:21 +0900
Message-Id: <1526013081-28005-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1526013081-28005-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1526013081-28005-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch enables EthernetAVB for r8a77990 Ebisu board.

Based on a patch from Takeshi Kihara <takeshi.kihara.df@renesas.com>

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 63ee134..7a09d05 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -7,6 +7,7 @@
 
 /dts-v1/;
 #include "r8a77990.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Renesas Ebisu board based on r8a77990";
@@ -14,6 +15,7 @@
 
 	aliases {
 		serial0 = &scif2;
+		ethernet0 = &avb;
 	};
 
 	chosen {
@@ -28,10 +30,36 @@
 	};
 };
 
+&avb {
+	pinctrl-0 = <&avb_pins>;
+	pinctrl-names = "default";
+	renesas,no-ether-link;
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-txid";
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		rxc-skew-ps = <1500>;
+		reg = <0>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &extal_clk {
 	clock-frequency = <48000000>;
 };
 
+&pfc {
+	avb_pins: avb {
+		mux {
+			groups = "avb_link", "avb_mii";
+			function = "avb";
+		};
+	};
+};
+
 &scif2 {
 	status = "okay";
 };
-- 
1.9.1
