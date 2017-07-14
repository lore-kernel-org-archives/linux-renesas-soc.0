Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52759 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751388AbdGNHXW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jul 2017 03:23:22 -0400
Date: Fri, 14 Jul 2017 09:23:16 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a7796: Add resets property to
 VSP devices
Message-ID: <20170714072315.GF12105@verge.net.au>
References: <20170713105822.5327-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170713105822.5327-2-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdUPrefMOEELnY8v_Apn8DmBQ+=KHK0P7k4CyhbaXE2SnQ@mail.gmail.com>
 <20170714072030.GD12105@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170714072030.GD12105@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jul 14, 2017 at 09:20:31AM +0200, Simon Horman wrote:
> On Thu, Jul 13, 2017 at 01:17:10PM +0200, Geert Uytterhoeven wrote:
> > On Thu, Jul 13, 2017 at 12:58 PM, Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > > The VSP nodes are missing the resets property. Add it.
> > >
> > > Fixes: 5a89c826745f ("arm64: dts: renesas: r8a7796: Add VSP instances")
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thanks, I have squashed this into the commit referenced above.

The result is as follows:

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: arm64: dts: renesas: r8a7796: Add VSP instances

The r8a7796 has 5 VSP instances.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 55 ++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index b301554ff424..9ef1729a800c 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1570,6 +1570,17 @@
 			resets = <&cpg 615>;
 		};
 
+		vspb: vsp@fe960000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfe960000 0 0x8000>;
+			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 626>;
+			power-domains = <&sysc R8A7796_PD_A3VC>;
+			resets = <&cpg 626>;
+
+			renesas,fcp = <&fcpvb0>;
+		};
+
 		fcpvb0: fcp@fe96f000 {
 			compatible = "renesas,fcpv";
 			reg = <0 0xfe96f000 0 0x200>;
@@ -1578,6 +1589,17 @@
 			resets = <&cpg 607>;
 		};
 
+		vspi0: vsp@fe9a0000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfe9a0000 0 0x8000>;
+			interrupts = <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 631>;
+			power-domains = <&sysc R8A7796_PD_A3VC>;
+			resets = <&cpg 631>;
+
+			renesas,fcp = <&fcpvi0>;
+		};
+
 		fcpvi0: fcp@fe9af000 {
 			compatible = "renesas,fcpv";
 			reg = <0 0xfe9af000 0 0x200>;
@@ -1586,6 +1608,17 @@
 			resets = <&cpg 611>;
 		};
 
+		vspd0: vsp@fea20000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea20000 0 0x4000>;
+			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 623>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 623>;
+
+			renesas,fcp = <&fcpvd0>;
+		};
+
 		fcpvd0: fcp@fea27000 {
 			compatible = "renesas,fcpv";
 			reg = <0 0xfea27000 0 0x200>;
@@ -1594,6 +1627,17 @@
 			resets = <&cpg 603>;
 		};
 
+		vspd1: vsp@fea28000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea28000 0 0x4000>;
+			interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 622>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 622>;
+
+			renesas,fcp = <&fcpvd1>;
+		};
+
 		fcpvd1: fcp@fea2f000 {
 			compatible = "renesas,fcpv";
 			reg = <0 0xfea2f000 0 0x200>;
@@ -1602,6 +1646,17 @@
 			resets = <&cpg 602>;
 		};
 
+		vspd2: vsp@fea30000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea30000 0 0x4000>;
+			interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 621>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 621>;
+
+			renesas,fcp = <&fcpvd2>;
+		};
+
 		fcpvd2: fcp@fea37000 {
 			compatible = "renesas,fcpv";
 			reg = <0 0xfea37000 0 0x200>;
-- 
2.1.4
