Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:41135 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751902AbdINKeZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Sep 2017 06:34:25 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/4] arm64: dts: renesas: r8a77995: Add USB2.0 PHY device node
Date: Thu, 14 Sep 2017 19:30:40 +0900
Message-Id: <1505385043-1554-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1505385043-1554-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1505385043-1554-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds USB2.0 PHY device node for r8a77995.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 72d04d7..59ed130 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -309,5 +309,17 @@
 			resets = <&cpg 310>;
 			status = "disabled";
 		};
+
+		usb2_phy0: usb-phy@ee080200 {
+			compatible = "renesas,usb2-phy-r8a77995",
+				     "renesas,rcar-gen3-usb2-phy";
+			reg = <0 0xee080200 0 0x700>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 703>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 703>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
 	};
 };
-- 
1.9.1
