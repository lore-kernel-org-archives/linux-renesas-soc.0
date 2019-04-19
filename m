Return-Path: <SRS0=xIzj=SV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 952FDC282DF
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:23:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 701DD222D2
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:23:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727295AbfDSSXR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:23:17 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58840 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726804AbfDSSXR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Apr 2019 14:23:17 -0400
Received: from penelope.horms.nl (unknown [62.153.215.140])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1BFDC25BEAC;
        Sat, 20 Apr 2019 00:34:53 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id CB2B5E21BE7; Fri, 19 Apr 2019 16:34:49 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 05/21] ARM: dts: iwg23s-sbc: Add HDMI support
Date:   Fri, 19 Apr 2019 16:34:32 +0200
Message-Id: <26c9d79b3730dff03d1c3ea6aee3e2968d36fe15.1555655522.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1555655522.git.horms+renesas@verge.net.au>
References: <cover.1555655522.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

This patch adds HDMI video output support to the iwg23s board
from iWave. Due to a problem with the bootloader not dealing
with the configuration of one of the pins correctly, we have
to use a gpio-hog for the interrupt line to make sure the pin
is configured as GPIO-input when requesting the interrupt.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 79 +++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index 77d18242ef59..9f9eb15a1e65 100644
--- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
@@ -22,6 +22,17 @@
 		stdout-path = "serial1:115200n8";
 	};
 
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&bridge_out>;
+			};
+		};
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x20000000>;
@@ -80,10 +91,34 @@
 	status = "okay";
 };
 
+&du {
+	pinctrl-0 = <&du0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			endpoint {
+				remote-endpoint = <&bridge_in>;
+			};
+		};
+	};
+};
+
 &extal_clk {
 	clock-frequency = <20000000>;
 };
 
+&gpio2 {
+	interrupt-fixup {
+		gpio-hog;
+		gpios = <29 GPIO_ACTIVE_HIGH>;
+		line-name = "hdmi-hpd-int";
+		input;
+	};
+};
+
 &i2c3 {
 	pinctrl-0 = <&i2c3_pins>;
 	pinctrl-names = "default";
@@ -97,12 +132,56 @@
 	};
 };
 
+&i2c4 {
+	pinctrl-0 = <&i2c4_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <100000>;
+
+	hdmi@39 {
+		compatible = "sil,sii9022";
+		reg = <0x39>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				bridge_in: endpoint {
+					remote-endpoint = <&du_out_rgb0>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				bridge_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
 &pfc {
 	avb_pins: avb {
 		groups = "avb_mdio", "avb_gmii_tx_rx";
 		function = "avb";
 	};
 
+	du0_pins: du0 {
+		groups = "du0_rgb888", "du0_sync", "du0_disp", "du0_clk0_out";
+		function = "du0";
+	};
+
+	i2c4_pins: i2c4 {
+		groups = "i2c4_e";
+		function = "i2c4";
+	};
+
 	i2c3_pins: i2c3 {
 		groups = "i2c3_c";
 		function = "i2c3";
-- 
2.11.0

