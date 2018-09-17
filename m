Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:58744 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727170AbeIQP1n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 11:27:43 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>, uli@fpond.eu,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 13/16] arm64: dts: renesas: r8a77990: Add display output support
Date: Mon, 17 Sep 2018 13:01:15 +0300
Message-ID: <5915801.JlFAhZJqeN@avalon>
In-Reply-To: <CAMuHMdW+K8A+xcfqt9KQ6nDzL9j_-XLi5Td3FPP6VMPNK0ni4A@mail.gmail.com>
References: <20180914091046.483-1-laurent.pinchart+renesas@ideasonboard.com> <3481349.HLygXACKyS@avalon> <CAMuHMdW+K8A+xcfqt9KQ6nDzL9j_-XLi5Td3FPP6VMPNK0ni4A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Monday, 17 September 2018 12:48:12 EEST Geert Uytterhoeven wrote:
> On Mon, Sep 17, 2018 at 11:09 AM Laurent Pinchart wrote:
> > On Monday, 17 September 2018 11:51:06 EEST Simon Horman wrote:
> >> On Mon, Sep 17, 2018 at 11:38:43AM +0300, Laurent Pinchart wrote:
> >>> On Monday, 17 September 2018 10:50:55 EEST Simon Horman wrote:
> >>>> On Fri, Sep 14, 2018 at 12:10:43PM +0300, Laurent Pinchart wrote:
> >>>>> The R8A77990 (E3) platform has one RGB output and two LVDS outputs
> >>>>> connected to the DU. Add the DT nodes for the DU, LVDS encoders
> >>>>> and supporting VSP and FCP.
> >>>>> 
> >>>>> Signed-off-by: Laurent Pinchart
> >>>>> <laurent.pinchart+renesas@ideasonboard.com>
> >>>>> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >>>>> ---
> >>>>> 
> >>>>>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 167 +++++++++++++++++
> >>>>>  1 file changed, 167 insertions(+)
> >>>>> 
> >>>>> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> >>>>> b/arch/arm64/boot/dts/renesas/r8a77990.dtsi index
> >>>>> abb14af76c0e..600074ca3ee5 100644
> >>>>> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> >>>>> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> >>>>> @@ -537,6 +537,173 @@
> >>>>>                         resets = <&cpg 408>;
> >>>>>                 };
> >>>> 
> >>>> These nodes should be placed after the gic to preserve the sorting
> >>>> of nodes by bus address and then IP block.
> >>> 
> >>> Aren't they already ? :-)
> >> 
> >> Git didn't seem to think so. But its not a big deal,
> >> I can fix this up locally.
> > 
> > Did it apply the below hunk to a different location ? 408 is the gic,
> > isn't it ?
> 
> The "-U <n>" option (with <n> sufficiently large) of "git diff" and "git
> show" is a great help for inspecting DT changes.

I know. This is what I have in my tree:

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/
renesas/r8a77990.dtsi
index abb14af76c0e..935bb313d29f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -522,32 +522,199 @@
 
 		gic: interrupt-controller@f1010000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
 			#address-cells = <0>;
 			interrupt-controller;
 			reg = <0x0 0xf1010000 0 0x1000>,
 			      <0x0 0xf1020000 0 0x20000>,
 			      <0x0 0xf1040000 0 0x20000>,
 			      <0x0 0xf1060000 0 0x20000>;
 			interrupts = <GIC_PPI 9
 					(GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
 			clocks = <&cpg CPG_MOD 408>;
 			clock-names = "clk";
 			power-domains = <&sysc 32>;
 			resets = <&cpg 408>;
 		};
 
+		vspb0: vsp@fe960000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfe960000 0 0x8000>;
+			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 626>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			resets = <&cpg 626>;
+			renesas,fcp = <&fcpvb0>;
+		};

[snip]

so I don't see where the problem that Simon pointed out is, especially given 
that I took care to sort nodes out properly this time.

-- 
Regards,

Laurent Pinchart
