Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56774 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935361AbdEOSpa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2017 14:45:30 -0400
Date: Mon, 15 May 2017 20:45:26 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a7795: Use GIC_SPI for HDMI
 interrupts
Message-ID: <20170515184525.GB23926@verge.net.au>
References: <20170515095241.17703-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170515145254.GA21549@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170515145254.GA21549@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 15, 2017 at 04:53:05PM +0200, Simon Horman wrote:
> On Mon, May 15, 2017 at 12:52:41PM +0300, Laurent Pinchart wrote:
> > Use the GIC_SPI macro instead of hardcoding its value in the HDMI
> > interrupts specifiers.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > Hi Simon,
> > 
> > Sorry for having messed that up in the original patch :-/ Feel free to squash
> > this fix in "arm64: dts: renesas: r8a7795: Add HDMI encoder support" if you
> > want to rebase, or just apply it on top.
> 
> No problem, I've also made a few DT errors of late :)
> 
> I have squashed this change as you suggest.
> I plan to push it a bit later today and if not tomorrow.

For the record, updated patch is as follows:


From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

arm64: dts: renesas: r8a7795: Add HDMI encoder support

Add DT nodes for the two HDMI encoders in disabled state.

Based on work by Koji Matsuoka.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

arm64: dts: renesas: r8a7795: Use GIC_SPI for HDMI interrupts

Use the GIC_SPI macro instead of hardcoding its value in the HDMI
interrupts specifiers.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 52 ++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 7d87dff70ac8..ee0129634cdf 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1758,6 +1758,56 @@
 			renesas,fcp = <&fcpf2>;
 		};
 
+		hdmi0: hdmi0@fead0000 {
+			compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
+			reg = <0 0xfead0000 0 0x10000>;
+			interrupts = <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 729>, <&cpg CPG_CORE R8A7795_CLK_HDMI>;
+			clock-names = "iahb", "isfr";
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 729>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					dw_hdmi0_in: endpoint {
+						remote-endpoint = <&du_out_hdmi0>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		hdmi1: hdmi1@feae0000 {
+			compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
+			reg = <0 0xfeae0000 0 0x10000>;
+			interrupts = <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 728>, <&cpg CPG_CORE R8A7795_CLK_HDMI>;
+			clock-names = "iahb", "isfr";
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 728>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					dw_hdmi1_in: endpoint {
+						remote-endpoint = <&du_out_hdmi1>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a7795";
 			reg = <0 0xfeb00000 0 0x80000>,
@@ -1789,11 +1839,13 @@
 				port@1 {
 					reg = <1>;
 					du_out_hdmi0: endpoint {
+						remote-endpoint = <&dw_hdmi0_in>;
 					};
 				};
 				port@2 {
 					reg = <2>;
 					du_out_hdmi1: endpoint {
+						remote-endpoint = <&dw_hdmi1_in>;
 					};
 				};
 				port@3 {
-- 
2.1.4
