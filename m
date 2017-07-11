Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33287 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932268AbdGKJAe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jul 2017 05:00:34 -0400
Date: Tue, 11 Jul 2017 11:00:23 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2.1 4/7] arm64: dts: renesas: r8a7796: Add HDMI encoder
 instance
Message-ID: <20170711090022.GD4517@verge.net.au>
References: <20170621093133.5677-5-laurent.pinchart+renesas@ideasonboard.com>
 <20170621121730.22025-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170710090749.GM13680@verge.net.au>
 <4337078.Ri4fPy66DN@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4337078.Ri4fPy66DN@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 10, 2017 at 12:49:45PM +0300, Laurent Pinchart wrote:
> Hi Simon,
> 
> On Monday 10 Jul 2017 11:07:50 Simon Horman wrote:
> > On Wed, Jun 21, 2017 at 03:17:30PM +0300, Laurent Pinchart wrote:
> > > Add the HDMI encoder to the R8A7796 DT in disabled state.
> > > 
> > > Signed-off-by: Laurent Pinchart
> > > <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > > 
> > >  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 25 +++++++++++++++++++++++++
> > >  1 file changed, 25 insertions(+)
> > > 
> > > Changes since v2:
> > > 
> > > - Rename node to hdmi@fead0000
> > > 
> > > diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > > b/arch/arm64/boot/dts/renesas/r8a7796.dtsi index
> > > ad9cd1c3199f..8c1a770c41cd 100644
> > > --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > > @@ -1532,6 +1532,31 @@
> > > 
> > >  			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> > >  		
> > >  		};
> > > 
> > > +		hdmi0: hdmi@fead0000 {
> > > +			compatible = "renesas,r8a7796-hdmi", "renesas,rcar-
> gen3-hdmi";
> > > +			reg = <0 0xfead0000 0 0x10000>;
> > > +			interrupts = <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>;
> > > +			clocks = <&cpg CPG_MOD 729>, <&cpg CPG_CORE 
> R8A7796_CLK_HDMI>;
> > > +			clock-names = "iahb", "isfr";
> > > +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> > > +			resets = <&cpg 729>;
> > > +			status = "disabled";
> > > +
> > > +			ports {
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +				port@0 {
> > > +					reg = <0>;
> > > +					dw_hdmi0_in: endpoint {
> > > +						remote-endpoint = 
> <&du_out_hdmi0>;
> > 
> > du_out_hdmi0 is used here but does not exist until the following patch is
> > applied. What to do?
> 
> Good point. I'll resubmit patches 4/7 and 5/7 with a fix.

Thanks, that seems better.
I have queued up the resulting series.
