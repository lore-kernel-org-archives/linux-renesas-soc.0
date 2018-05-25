Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:53298 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965827AbeEYLFx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 May 2018 07:05:53 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] arm64: dts: salvator-xs: update I2C ch4 clock to 400kHz
Date: Fri, 25 May 2018 13:05:42 +0200
Message-Id: <20180525110542.10620-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180525110542.10620-1-wsa+renesas@sang-engineering.com>
References: <20180525110542.10620-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Any of the following devices connected to I2C ch4 of the Salvator-XS
board will operate at 400 kHz:

    PCA9654E, 9FGV0841, ADV7482WBBCZ, MAX9611, 5P49V6901A

This patch updates the clock frequency to 400 KHz.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/salvator-xs.dtsi | 2 ++
 1 file changed, 2 insertions(+)

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
