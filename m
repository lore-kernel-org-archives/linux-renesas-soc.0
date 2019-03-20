Return-Path: <SRS0=0aVP=RX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF226C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 19:44:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B5DB021873
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 19:44:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfCTToS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Mar 2019 15:44:18 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:46720 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbfCTToQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Mar 2019 15:44:16 -0400
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id qKkD1z00A3XaVaC01KkDUd; Wed, 20 Mar 2019 20:44:14 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h6h8H-0002Nf-0s; Wed, 20 Mar 2019 20:44:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h6h8H-0003sd-00; Wed, 20 Mar 2019 20:44:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] ARM: dts: rskrza1: Add I2C support
Date:   Wed, 20 Mar 2019 20:44:09 +0100
Message-Id: <20190320194410.14870-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190320194410.14870-1-geert+renesas@glider.be>
References: <20190320194410.14870-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable the I2C bus, and add the following devices:
  - Two CAT9554 port expanders (8 GPIOs, interrupt not wired by
    default),
  - R1EX24016ASAS0A EEPROM.

The bus also contains a MAX9856 Audio Codec, which is not yet supported.

All devices (incl. the audio codec) are documented to support an I2C bus
running at 400 kHz.

Pinctrl is based on the RZ/A BSP.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Pending acceptance of the DT binding patches documenting the
"onnn,cat9554" and "renesas,r1ex24016" compatible values.
---
 arch/arm/boot/dts/r7s72100-rskrza1.dts | 33 ++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
index 8ee44a100e9a44c4..60e80ecbbf6826bc 100644
--- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
@@ -47,6 +47,34 @@
 	clock-frequency = <13330000>;
 };
 
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+	status = "okay";
+
+	clock-frequency = <400000>;
+
+	io_expander1: gpio@20 {
+		compatible = "onnn,cat9554";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	io_expander2: gpio@21 {
+		compatible = "onnn,cat9554";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	eeprom@50 {
+		compatible = "renesas,r1ex24016", "atmel,24c16";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
 &usb_x1_clk {
 	clock-frequency = <48000000>;
 };
@@ -56,6 +84,11 @@
 };
 
 &pinctrl {
+	/* RIIC ch3 (Port Expander, EEPROM (MAC Addr), Audio Codec) */
+	i2c3_pins: i2c3 {
+		pinmux = <RZA1_PINMUX(1, 6, 1)>,	/* RIIC3SCL */
+			 <RZA1_PINMUX(1, 7, 1)>;	/* RIIC3SDA */
+	};
 
 	/* Serial Console */
 	scif2_pins: serial2 {
-- 
2.17.1

