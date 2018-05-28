Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:49038 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932279AbeE1T3v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 May 2018 15:29:51 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2] arm64: dts: salvator-x(s): Update I2C ch4 clock to 400kHz
Date: Mon, 28 May 2018 21:29:47 +0200
Message-Id: <20180528192947.2808-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Any of the following devices connected to I2C ch4 of the Salvator-X(S)
boards will operate at 400 kHz:

    PCA9654, 9FGV0841, ADV7482WBBCZ, MAX9611, 5P49V5923, 5P49V6901A

This patch updates the clock frequency to 400 KHz.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[wsa: squashed commits into one]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since V1:
	* squashed commits into single one

 arch/arm64/boot/dts/renesas/salvator-x.dtsi  | 2 ++
 arch/arm64/boot/dts/renesas/salvator-xs.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-x.dtsi b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
index 468868c8ed9f..2828482eba1c 100644
--- a/arch/arm64/boot/dts/renesas/salvator-x.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
@@ -20,6 +20,8 @@
 };
 
 &i2c4 {
+	clock-frequency = <400000>;
+
 	versaclock5: clock-generator@6a {
 		compatible = "idt,5p49v5923";
 		reg = <0x6a>;
diff --git a/arch/arm64/boot/dts/renesas/salvator-xs.dtsi b/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
index bf4d200fb546..1ac03b7564aa 100644
--- a/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
@@ -20,6 +20,8 @@
 };
 
 &i2c4 {
+	clock-frequency = <400000>;
+
 	versaclock6: clock-generator@6a {
 		compatible = "idt,5p49v6901";
 		reg = <0x6a>;
-- 
2.11.0
