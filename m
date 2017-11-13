Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:24915 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754232AbdKMRol (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2017 12:44:41 -0500
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  3/3] ARM: dts: iwg20d-q7: Enable PCIe Controller
Date: Mon, 13 Nov 2017 17:43:12 +0000
Message-Id: <1510594992-63806-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1510594992-63806-1-git-send-email-biju.das@bp.renesas.com>
References: <1510594992-63806-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable PCIe Controller & set PCIe bus clock frequency.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
This patch has dependency on below patch

* ARM: dts: iwg20d-q7-common: Add can0 support to carrier board
https://patchwork.kernel.org/patch/10046879/

 arch/arm/boot/dts/iwg20d-q7-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
index 3e4bc4d..54470c6 100644
--- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
+++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
@@ -96,6 +96,14 @@
 	pinctrl-names = "default";
 };
 
+&pcie_bus_clk {
+	clock-frequency = <100000000>;
+};
+
+&pciec {
+	status = "okay";
+};
+
 &pfc {
 	can0_pins: can0 {
 		groups = "can0_data_d";
-- 
1.9.1
