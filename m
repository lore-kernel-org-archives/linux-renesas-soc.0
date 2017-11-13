Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:24915 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754205AbdKMRog (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2017 12:44:36 -0500
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  1/3] ARM: dts: r8a7743: Add default PCIe bus clock
Date: Mon, 13 Nov 2017 17:43:10 +0000
Message-Id: <1510594992-63806-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1510594992-63806-1-git-send-email-biju.das@bp.renesas.com>
References: <1510594992-63806-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds a default PCIe bus clock node.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
This patch has dependency on below patch

* ARM: dts: r8a7743: Add CAN[01] SoC support
https://patchwork.kernel.org/patch/10046875/

 arch/arm/boot/dts/r8a7743.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index 12c7b92..de4b8c6 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -1189,6 +1189,13 @@
 		clock-frequency = <0>;
 	};
 
+	/* External PCIe clock - can be overridden by the board */
+	pcie_bus_clk: pcie_bus {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
 	/* External SCIF clock */
 	scif_clk: scif {
 		compatible = "fixed-clock";
-- 
1.9.1
