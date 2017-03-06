Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42782 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752599AbdCFIwG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2017 03:52:06 -0500
Date: Mon, 6 Mar 2017 09:44:20 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: renesas: r8a7796: Enable SCIF DMA
Message-ID: <20170306084419.GC11468@verge.net.au>
References: <1481129067-21949-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1481129067-21949-4-git-send-email-ulrich.hecht+renesas@gmail.com>
 <CAMuHMdUGbb4CjpGzXapprrcuKAfKw3wkYc77JOn1EKNRsMm3VA@mail.gmail.com>
 <20170302143638.GS6301@verge.net.au>
 <CAMuHMdXaEDn30U=LTp7szRQYwTp48SfR6MFCYQ+aTBWXF41tEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXaEDn30U=LTp7szRQYwTp48SfR6MFCYQ+aTBWXF41tEQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Mar 03, 2017 at 10:54:01AM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Thu, Mar 2, 2017 at 3:36 PM, Simon Horman <horms@verge.net.au> wrote:
> > On Tue, Feb 21, 2017 at 03:27:25PM +0100, Geert Uytterhoeven wrote:
> >> On Wed, Dec 7, 2016 at 5:44 PM, Ulrich Hecht
> >> <ulrich.hecht+renesas@gmail.com> wrote:
> >> > Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> >> > ---
> >> >  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 13 +++++++++++++
> >> >  1 file changed, 13 insertions(+)
> >> >
> >> > diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> >> > index c5f0df5..782063a 100644
> >> > --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> >> > +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> >> > @@ -430,6 +430,9 @@
> >> >                                  <&cpg CPG_CORE R8A7796_CLK_S3D1>,
> >> >                                  <&scif_clk>;
> >> >                         clock-names = "fck", "brg_int", "scif_clk";
> >> > +                       dmas = <&dmac1 0x51>, <&dmac1 0x50>,
> >> > +                              <&dmac2 0x51>, <&dmac2 0x50>;
> >> > +                       dma-names = "tx", "rx", "tx", "rx";
> >> >                         power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> >> >                         status = "disabled";
> >>
> >> Apparently the DMA properties were added to the HSCIF nodes instead
> >> of the SCIF nodes while applying this patch?
> >>
> >> 3 lines of context is not sufficient to distinguish between the various SCIF
> >> and HSCIF nodes :-(
> >
> > Thanks, I have updated renesas-devel accordingly.
> >
> > I notice in renesas-devel there seems to be one "tx", "rx" DMA per SCIF
> > rather than two added in Ulrich's patch. Is there a reason for that?
> 
> You mean renesas-drivers?

Yes.

> Oops, looks like I cherry-picked an older version of the patch, and failed to
> notice after reverting your wrong version
> (perhaps the final version was never part of a pull request from Uli?).
> 
> BTW, your version  is wrong, too: the second pair of DMA channels
> should point to dmac2, not dmac1, e.g.:
> 
>                   scif0: serial@e6e60000 {
>                           compatible = "renesas,scif-r8a7796",
>                                        "renesas,rcar-gen3-scif", "renesas,scif";
>                           reg = <0 0xe6e60000 0 64>;
>                           interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
>                           clocks = <&cpg CPG_MOD 207>,
>                                    <&cpg CPG_CORE R8A7796_CLK_S3D1>,
>                                    <&scif_clk>;
>                           clock-names = "fck", "brg_int", "scif_clk";
>   +                       dmas = <&dmac1 0x51>, <&dmac1 0x50>,
> - +                              <&dmac1 0x51>, <&dmac1 0x50>;
> + +                              <&dmac2 0x51>, <&dmac2 0x50>;
> 
>   +                       dma-names = "tx", "rx", "tx", "rx";
>                           power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
>                           status = "disabled";
>                   };

Thanks for noticing. I plan to squash the following incremental change into
the relevant commit. Hopefully that will be the end of this saga.

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 84ecd4248fae..951e351ddae1 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -569,7 +569,7 @@
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac1 0x51>, <&dmac1 0x50>,
-			       <&dmac1 0x51>, <&dmac1 0x50>;
+			       <&dmac2 0x51>, <&dmac2 0x50>;
 			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			status = "disabled";
@@ -585,7 +585,7 @@
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac1 0x53>, <&dmac1 0x52>,
-			       <&dmac1 0x53>, <&dmac1 0x52>;
+			       <&dmac2 0x53>, <&dmac2 0x52>;
 			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			status = "disabled";
@@ -644,7 +644,7 @@
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac1 0x5b>, <&dmac1 0x5a>,
-			       <&dmac1 0x5b>, <&dmac1 0x5a>;
+			       <&dmac2 0x5b>, <&dmac2 0x5a>;
 			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			status = "disabled";
