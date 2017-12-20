Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:7888 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1756083AbdLTUEq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Dec 2017 15:04:46 -0500
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 1/9] ARM: dts: r8a7745: Add audio clocks
Date: Wed, 20 Dec 2017 20:01:57 +0000
Message-Id: <1513800125-53213-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1513800125-53213-1-git-send-email-biju.das@bp.renesas.com>
References: <1513800125-53213-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Describe the external audio clocks required by the sound driver.
Boards that provide audio clocks need to override the clock frequencies.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7745.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
index 2be7485..6d085f0 100644
--- a/arch/arm/boot/dts/r8a7745.dtsi
+++ b/arch/arm/boot/dts/r8a7745.dtsi
@@ -35,6 +35,27 @@
 		vin1 = &vin1;
 	};
 
+	/*
+	 * The external audio clocks are configured  as 0 Hz fixed
+	 * frequency clocks by default.  Boards that provide audio
+	 * clocks should override them.
+	 */
+	audio_clka: audio_clka {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+	audio_clkb: audio_clkb {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+	audio_clkc: audio_clkc {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
 	/* External CAN clock */
 	can_clk: can {
 		compatible = "fixed-clock";
-- 
1.9.1
