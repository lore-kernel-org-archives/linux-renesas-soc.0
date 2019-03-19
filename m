Return-Path: <SRS0=zxXW=RW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069EDC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 12:22:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D28B12133D
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 12:22:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727267AbfCSMWS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Mar 2019 08:22:18 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:29865 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727111AbfCSMWS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Mar 2019 08:22:18 -0400
X-IronPort-AV: E=Sophos;i="5.58,497,1544454000"; 
   d="scan'208";a="10581627"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 19 Mar 2019 21:22:16 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4660C4016D78;
        Tue, 19 Mar 2019 21:22:14 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 2/2] ARM: dts: iwg23s-sbc: Add HDMI support
Date:   Tue, 19 Mar 2019 12:21:39 +0000
Message-Id: <1552998099-22972-3-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552998099-22972-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1552998099-22972-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds HDMI video output support to the iwg23s board
from iWave. Due to a problem with the bootloader not dealing
with the configuration of one of the pins correctly, we have
to use a gpio-hog for the interrupt line to make sure the pin
is configured as GPIO-input when requesting the interrupt.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 79 +++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index 77d1824..9f9eb15 100644
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
2.7.4

