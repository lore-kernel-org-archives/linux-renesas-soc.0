Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart+renesas@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran@bingham.xyz>
Subject: [PATCH v4 4/4] arm64: dts: renesas: r8a7796: Add FDP1 instance
Date: Mon, 24 Oct 2016 12:03:38 +0300
Message-Id: <1477299818-31935-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1477299818-31935-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1477299818-31935-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

The r8a7796 has a single FDP1 instance.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 9217da983525..fbec7a29121a 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -251,5 +251,14 @@
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
+
+		fdp1@fe940000 {
+			compatible = "renesas,fdp1";
+			reg = <0 0xfe940000 0 0x2400>;
+			interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 119>;
+			power-domains = <&sysc R8A7796_PD_A3VC>;
+			renesas,fcp = <&fcpf0>;
+		};
 	};
 };
-- 
Regards,

Laurent Pinchart
