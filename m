Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42956 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389176AbeIUNEU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Sep 2018 09:04:20 -0400
Date: Fri, 21 Sep 2018 09:16:44 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Ulrich Hecht <uli@fpond.eu>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 13/16] arm64: dts: renesas: r8a77990: Add display
 output support
Message-ID: <20180921071643.zjivbv3umlgcruzu@verge.net.au>
References: <20180914091046.483-1-laurent.pinchart+renesas@ideasonboard.com>
 <1591567.fSGLneYn9d@avalon>
 <20180919083506.xuilcubl54q5djxr@verge.net.au>
 <1942172.7Is2si9RQ9@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1942172.7Is2si9RQ9@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 19, 2018 at 04:11:36PM +0300, Laurent Pinchart wrote:
> Hi Simon,
> 
> On Wednesday, 19 September 2018 11:35:07 EEST Simon Horman wrote:
> > On Mon, Sep 17, 2018 at 11:59:32AM +0300, Laurent Pinchart wrote:
> > > On Monday, 17 September 2018 11:54:04 EEST Laurent Pinchart wrote:
> > >> On Monday, 17 September 2018 11:47:15 EEST Laurent Pinchart wrote:
> > >>> On Monday, 17 September 2018 11:14:20 EEST Simon Horman wrote:
> > >>>> On Mon, Sep 17, 2018 at 09:50:55AM +0200, Simon Horman wrote:
> > >>>>> On Fri, Sep 14, 2018 at 12:10:43PM +0300, Laurent Pinchart wrote:
> > >>>>>> The R8A77990 (E3) platform has one RGB output and two LVDS
> > >>>>>> outputs connected to the DU. Add the DT nodes for the DU, LVDS
> > >>>>>> encoders and supporting VSP and FCP.
> > >>>>>> 
> > >>>>>> Signed-off-by: Laurent Pinchart
> > >>>>>> <laurent.pinchart+renesas@ideasonboard.com>
> > >>>>>> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > >>>>>> ---
> > >>>>>> 
> > >>>>>>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 167 ++++++++++++++++++++
> > >>>>>>  1 file changed, 167 insertions(+)
> > >>>>>> 
> > >>>>>> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > >>>>>> b/arch/arm64/boot/dts/renesas/r8a77990.dtsi index
> > >>>>>> abb14af76c0e..600074ca3ee5 100644
> > >>>>>> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > >>>>>> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> 
> [snip]
> 
> > >>>>>> +		lvds0: lvds-encoder@feb90000 {
> > >>>>>> +			compatible = "renesas,r8a77990-lvds";
> > >>>>>> +			reg = <0 0xfeb90000 0 0x20>;
> > >>>>>> +			clocks = <&cpg CPG_MOD 727>;
> > >>>>>> +			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
> > >>>>>> +			resets = <&cpg 727>;
> > >>>>>> +			status = "disabled";
> > >>>>>> +
> > >>>>>> +			ports {
> > >>>>>> +				#address-cells = <1>;
> > >>>>>> +				#size-cells = <0>;
> > >>>>>> +
> > >>>>>> +				port@0 {
> > >>>>>> +					reg = <0>;
> > >>>>>> +					lvds0_in: endpoint {
> > >>>>>> +						remote-endpoint = <&du_out_lvds0>;
> > >>>>>> +					};
> > >>>>>> +				};
> > >>>>>> +
> > >>>>>> +				port@1 {
> > >>>>>> +					reg = <1>;
> > >>>>>> +					lvds0_out: endpoint {
> > >>>>>> +					};
> > >>>>>> +				};
> > >>>>>> +			};
> > >>>>>> +		};
> > >>>>>> +
> > >>>>>> +		lvds1: lvds-encoder@feb90100 {
> > >>>>>> +			compatible = "renesas,r8a77990-lvds";
> > >>>>>> +			reg = <0 0xfeb90100 0 0x20>;
> > >>>>>> +			clocks = <&cpg CPG_MOD 727>;
> > >>>>>> +			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
> > >>>>>> +			resets = <&cpg 726>;
> > >>>> 
> > >>>> Also, is the missmatch between the index for the clock and reset
> > >>>> intentional?
> > >>> 
> > >>> It is. According to the datasheet, the two LVDS encoders have
> > >>> different module stop bits, but share the same reset (lovely hardware
> > >>> design, it will be fun to support that in the driver :-S).
> > >> 
> > >> Sorry, I got it wrong. it's bit 725 that is shared between the two LVDS
> > >> encoders, to reset the two LVDS PLLs together. The encoders themselves
> > >> still have independent reset bits. I'll fix this.
> > > 
> > > And of course it's the clock you were commenting on, not the reset. *sigh*
> > > 
> > > According to the datasheets the two LVDS encoders share one MSTP. Whether
> > > that's a mistake in the documentation or not I can't tell yet, as I have
> > > only tested LVDS0.
> > 
> > Could we follow-up with the HW team?
> > I'm not opposed to taking the patch with this portion as-is
> > but it would be good to clarify this somehow.
> 
> I tried setting the clock to MSTP 726, and I then get vblank interrupt 
> timeouts. Furthermore I've now tested the LVDS1 output with a display panel, 
> and while I still can't get the backlight to work, the panel displays the 
> correct image with MSTP 727. I thus conclude that the above is correct.

Thanks for the follow-up, that sounds reasonable to me.

Am I correct in thinking a v3 of this patchset is on its way regardless?

> 
> > >>>>>> +			status = "disabled";
> > >>>>>> +
> > >>>>>> +			ports {
> > >>>>>> +				#address-cells = <1>;
> > >>>>>> +				#size-cells = <0>;
> > >>>>>> +
> > >>>>>> +				port@0 {
> > >>>>>> +					reg = <0>;
> > >>>>>> +					lvds1_in: endpoint {
> > >>>>>> +						remote-endpoint = <&du_out_lvds1>;
> > >>>>>> +					};
> > >>>>>> +				};
> > >>>>>> +
> > >>>>>> +				port@1 {
> > >>>>>> +					reg = <1>;
> > >>>>>> +					lvds1_out: endpoint {
> > >>>>>> +					};
> > >>>>>> +				};
> > >>>>>> +			};
> > >>>>>> +		};
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
> 
