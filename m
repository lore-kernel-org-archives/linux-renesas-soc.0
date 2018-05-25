Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:53278 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965886AbeEYLFw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 May 2018 07:05:52 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] arm64: dts: salvator-x: update I2C ch4 clock to 400kHz
Date: Fri, 25 May 2018 13:05:41 +0200
Message-Id: <20180525110542.10620-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180525110542.10620-1-wsa+renesas@sang-engineering.com>
References: <20180525110542.10620-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Any of the following devices connected to I2C ch4 of the Salvator-X board
will operate at 400 kHz:

    PCA9654, 9FGV0841, ADV7482WBBCZ, MAX9611, 5P49V5923

This patch updates the clock frequency to 400 KHz.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/salvator-x.dtsi | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
2.11.0
