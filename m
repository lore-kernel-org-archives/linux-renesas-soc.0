Return-Path: <devicetree-owner@vger.kernel.org>
From: Kieran Bingham <kbingham@kernel.org>
To: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT
        (AARCH64 ARCHITECTURE)), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/4] arm64: dts: renesas: r8a77995: add VSPBS instance
Date: Mon, 12 Feb 2018 22:25:28 +0000
Message-Id: <1518474330-8713-4-git-send-email-kbingham@kernel.org>
In-Reply-To: <1518474330-8713-1-git-send-email-kbingham@kernel.org>
References: <1518474330-8713-1-git-send-email-kbingham@kernel.org>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The r8a77995 has a VSPBS to support image processing such as blending of
2 input images.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 196a917afea6..50c891f6649f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -692,6 +692,16 @@
 			status = "disabled";
 		};
 
+		vspbs: vsp@fe960000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfe960000 0 0x4000>;
+			interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 627>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 627>;
+			renesas,fcp = <&fcpvb0>;
+		};
+
 		fcpvb0: fcp@fe96f000 {
 			compatible = "renesas,fcpv";
 			reg = <0 0xfe96f000 0 0x200>;
-- 
2.7.4

