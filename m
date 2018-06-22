Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43466 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751325AbeFVNvf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jun 2018 09:51:35 -0400
Date: Fri, 22 Jun 2018 15:51:30 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        linux-spi <linux-spi@vger.kernel.org>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: r8a77995: Add MSIOF device nodes
Message-ID: <20180622135129.xeelks4zmbnbl7ff@verge.net.au>
References: <1529496081-10571-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <CAMuHMdX=g7xq5N72cfZ8+_m+-MgmoavadaFzNq+j5EHpQ+k+=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX=g7xq5N72cfZ8+_m+-MgmoavadaFzNq+j5EHpQ+k+=Q@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 20, 2018 at 02:51:47PM +0200, Geert Uytterhoeven wrote:
> Hi Ulrich,
> 
> On Wed, Jun 20, 2018 at 2:01 PM Ulrich Hecht
> <ulrich.hecht+renesas@gmail.com> wrote:
> > From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> >
> > This patch adds MSIOF device nodes for the R8A77995 SoC.
> >
> > Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > [uli: remove unimplemented ref clock, clock-names]
> > Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> 
> Thanks for the update!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> > @@ -798,6 +798,68 @@
> >                         compatible = "renesas,prr";
> >                         reg = <0 0xfff00044 0 4>;
> >                 };
> > +
> > +               msiof0: spi@e6e90000 {
> 
> To preserve sort order, the msiof nodes should be inserted in between the SCIF
> and VIN nodes.

Thanks, I have made that change and queued-up the following:

From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Subject: [PATCH] arm64: dts: r8a77995: Add MSIOF device nodes

This patch adds MSIOF device nodes for the R8A77995 SoC.

Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[uli: remove unimplemented ref clock, clock-names]
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
[simon: preserved node ordering by moving msiof nodes to before vin nodes]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 62 +++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 1de6ffca4772..6c0a8217d40f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -622,6 +622,68 @@
 			status = "disabled";
 		};
 
+		msiof0: spi@e6e90000 {
+			compatible = "renesas,msiof-r8a77995",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6e90000 0 0x64>;
+			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 211>;
+			dmas = <&dmac1 0x41>, <&dmac1 0x40>,
+			       <&dmac2 0x41>, <&dmac2 0x40>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 211>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof1: spi@e6ea0000 {
+			compatible = "renesas,msiof-r8a77995",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6ea0000 0 0x64>;
+			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 210>;
+			dmas = <&dmac1 0x43>, <&dmac1 0x42>,
+			       <&dmac2 0x43>, <&dmac2 0x42>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 210>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof2: spi@e6c00000 {
+			compatible = "renesas,msiof-r8a77995",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6c00000 0 0x64>;
+			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 209>;
+			dmas = <&dmac0 0x45>, <&dmac0 0x44>;
+			dma-names = "tx", "rx";
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 209>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof3: spi@e6c10000 {
+			compatible = "renesas,msiof-r8a77995",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6c10000 0 0x64>;
+			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 208>;
+			dmas = <&dmac0 0x47>, <&dmac0 0x46>;
+			dma-names = "tx", "rx";
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 208>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		vin4: video@e6ef4000 {
 			compatible = "renesas,vin-r8a77995";
 			reg = <0 0xe6ef4000 0 0x1000>;
-- 
2.11.0
