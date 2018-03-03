Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:34885 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752116AbeCCTHU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 3 Mar 2018 14:07:20 -0500
Received: by mail-lf0-f65.google.com with SMTP id 70so17805998lfw.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 03 Mar 2018 11:07:19 -0800 (PST)
Subject: [PATCH v3 2/2] arm64: dts: renesas: eagle: add I2C0 support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
References: <23c5b1f4-d92b-455f-7288-5aabd002183a@cogentembedded.com>
Message-ID: <30bfc66d-2bfb-4d6e-8bdc-fcd9cb9522c2@cogentembedded.com>
Date: Sat, 3 Mar 2018 22:07:16 +0300
MIME-Version: 1.0
In-Reply-To: <23c5b1f4-d92b-455f-7288-5aabd002183a@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define the Eagle board dependent part of the I2C0 device node.

The I2C0 bus is populated by ON Semiconductor PCA9653 I/O expander and
Analog Devices ADV7511W HDMI transmitter (but we're only describing the
former chip now).

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
Changes in version 3:
- added Geert's tag.

Changes in version 2:
- refreshed with the patch adding EtherAVB pins removed for now...

 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -55,7 +55,27 @@
 	clock-frequency = <32768>;
 };
 
+&i2c0 {
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	io_expander: gpio@20 {
+		compatible = "onnn,pca9654";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
 &pfc {
+	i2c0_pins: i2c0 {
+		groups = "i2c0";
+		function = "i2c0";
+	};
+
 	scif0_pins: scif0 {
 		groups = "scif0_data";
 		function = "scif0";
