Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:44561 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750735AbeDXTZ2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 15:25:28 -0400
Received: by mail-lf0-f66.google.com with SMTP id g203-v6so21975838lfg.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Apr 2018 12:25:27 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2] arm64: dts: renesas: condor: add eMMC support
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
References: <611daf1f-42a2-d463-0814-ebf762871018@cogentembedded.com>
Message-ID: <bfa0f1e9-f6e1-c4e2-9c9a-0d25d7f56ad1@cogentembedded.com>
Date: Tue, 24 Apr 2018 22:25:24 +0300
MIME-Version: 1.0
In-Reply-To: <611daf1f-42a2-d463-0814-ebf762871018@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Define the Condor board dependent part of the MMC0 (connected to eMMC chip)
device node along with the necessary voltage regulators...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'renesas-devel-20180424-v4.17-rc2' tag of Simon
Horman's 'renesas.git' repo.

Changes in version 2:
- renamed the pin groups and their labels, alos changing their order;
- reordered this patch before the PCIe patch.

 arch/arm64/boot/dts/renesas/r8a77980-condor.dts |   43 ++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
+++ renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
@@ -27,6 +27,24 @@
 		/* first 128MB is reserved for secure area. */
 		reg = <0 0x48000000 0 0x78000000>;
 	};
+
+	d3_3v: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "D3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vddq_vin01: regulator-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDQ_VIN01";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &avb {
@@ -52,12 +70,37 @@
 	clock-frequency = <32768>;
 };
 
+&mmc0 {
+	pinctrl-0 = <&mmc_pins>;
+	pinctrl-1 = <&mmc_pins_uhs>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&d3_3v>;
+	vqmmc-supply = <&vddq_vin01>;
+	mmc-hs200-1_8v;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
 &pfc {
 	avb_pins: avb {
 		groups = "avb_mdio", "avb_rgmii";
 		function = "avb";
 	};
 
+	mmc_pins: mmc {
+		groups = "mmc_data8", "mmc_ctrl", "mmc_ds";
+		function = "mmc";
+		power-source = <3300>;
+	};
+
+	mmc_pins_uhs: mmc_uhs {
+		groups = "mmc_data8", "mmc_ctrl", "mmc_ds";
+		function = "mmc";
+		power-source = <1800>;
+	};
+
 	scif0_pins: scif0 {
 		groups = "scif0_data";
 		function = "scif0";
