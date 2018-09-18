Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:41890 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728880AbeIROq0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Sep 2018 10:46:26 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH] arm64: dts: renesas: gen3: use 400kHz for I2C DVFS bus
Date: Tue, 18 Sep 2018 11:14:33 +0200
Message-Id: <20180918091433.13019-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The PMIC and EEPROM can operate at 400kHz, so use this speed.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

RFC because I couldn't find docs for the PMIC. Tests showed that it does
work at 400kHz (checksuming over 256 byte reads). Geert, do you happen
to have docs? Other than that, for the EEPROM it also works and is also
documented and BSP uses 400kHz as well. Tested on Salvator XS, not ULCB.

 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 2 ++
 arch/arm64/boot/dts/renesas/ulcb.dtsi            | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index d298f7c9ada1..7f91ff524109 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -474,6 +474,8 @@
 &i2c_dvfs {
 	status = "okay";
 
+	clock-frequency = <400000>;
+
 	pmic: pmic@30 {
 		pinctrl-0 = <&irq0_pins>;
 		pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 7e6078508ba0..30506c5ba4e9 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -241,6 +241,8 @@
 &i2c_dvfs {
 	status = "okay";
 
+	clock-frequency = <400000>;
+
 	pmic: pmic@30 {
 		pinctrl-0 = <&irq0_pins>;
 		pinctrl-names = "default";
-- 
2.18.0
