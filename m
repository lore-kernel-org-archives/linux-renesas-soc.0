Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:53952 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752007AbdLUMVu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Dec 2017 07:21:50 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2] arm64: dts: renesas: salvator-common: add GPIO extender
Date: Thu, 21 Dec 2017 13:21:36 +0100
Message-Id: <20171221122136.17773-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

We need to configure its GPIOs later.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index a298df74ca6c03..ab4763f09dc7fd 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -338,6 +338,11 @@
 &i2c4 {
 	status = "okay";
 
+	pca9654: gpio@20 {
+		compatible = "onnn,pca9654";
+		reg = <0x20>;
+	};
+
 	csa_vdd: adc@7c {
 		compatible = "maxim,max9611";
 		reg = <0x7c>;
-- 
2.11.0
