Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58882 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756209AbdLVULv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Dec 2017 15:11:51 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3] arm64: dts: renesas: salvator-common: add GPIO extender
Date: Fri, 22 Dec 2017 21:11:46 +0100
Message-Id: <20171222201146.8414-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

We need to configure its GPIOs later.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since V2:
* added two more required properties (Thanks Geert!)

And no dependency anymore (my statement for V2 was wrong).

 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index a298df74ca6c03..7d43ec24cf9fd0 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -338,6 +338,13 @@
 &i2c4 {
 	status = "okay";
 
+	pca9654: gpio@20 {
+		compatible = "onnn,pca9654";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	csa_vdd: adc@7c {
 		compatible = "maxim,max9611";
 		reg = <0x7c>;
-- 
2.11.0
