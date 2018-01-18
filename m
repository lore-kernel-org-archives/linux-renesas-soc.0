Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:41282 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752368AbeARTIP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jan 2018 14:08:15 -0500
Received: by mail-pg0-f66.google.com with SMTP id 136so14506671pgd.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jan 2018 11:08:15 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Fri, 19 Jan 2018 04:07:37 +0900
Message-Id: <151630245794.14098.8902060257525149943.sendpatchset@little-apple>
In-Reply-To: <151630243226.14098.14517816422611139335.sendpatchset@little-apple>
References: <151630243226.14098.14517816422611139335.sendpatchset@little-apple>
Subject: [PATCH/RFC 03/03] arm64: dts: renesas: eagle: NOR flash SPI bitbang prototype
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Drive the NOR flash chips via SPI bitbang instead of via the two
channels of QSPI hardware. This is useful to test the on-chip GPIO
devices.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts |   36 ++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

--- 0002/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ work/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts	2018-01-19 03:47:16.380607110 +0900
@@ -31,6 +31,42 @@
 		/* first 128MB is reserved for secure area. */
 		reg = <0x0 0x48000000 0x0 0x38000000>;
 	};
+
+	spi_flash@0 {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		
+		gpio-sck = <&gpio5 0 0>;
+		gpio-mosi = <&gpio5 1 0>;
+		gpio-miso = <&gpio5 2 0>;
+		cs-gpios = <&gpio5 5 0>;
+		num-chipselects = <1>;
+
+		flash@0 {
+			compatible = "jedec,spi-nor";
+			reg = <0>;
+			spi-max-frequency = <30000000>;
+		};
+	};
+
+	spi_flash@1 {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		
+		gpio-sck = <&gpio5 6 0>;
+		gpio-mosi = <&gpio5 7 0>;
+		gpio-miso = <&gpio5 8 0>;
+		cs-gpios = <&gpio5 11 0>;
+		num-chipselects = <1>;
+
+		flash@1 {
+			compatible = "jedec,spi-nor";
+			reg = <0>;
+			spi-max-frequency = <30000000>;
+		};
+	};
 };
 
 &avb {
