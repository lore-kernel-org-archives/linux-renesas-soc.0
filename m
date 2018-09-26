Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52801 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727045AbeIZQmk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Sep 2018 12:42:40 -0400
Date: Wed, 26 Sep 2018 12:30:16 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/4] arm64: dts: renesas: r8a77995: Add LVDS support
Message-ID: <20180926103011.mdgyzclypjfzgfnh@verge.net.au>
References: <20180925163337.31212-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180925163337.31212-3-laurent.pinchart+renesas@ideasonboard.com>
 <cc873c59-fcb3-18b5-5e72-56ddaf9f53ce@cogentembedded.com>
 <20180926091312.ol7eu75775bu4tym@verge.net.au>
 <012a3ced-ffd4-46da-7f7d-617f06654516@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <012a3ced-ffd4-46da-7f7d-617f06654516@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 26, 2018 at 12:46:12PM +0300, Sergei Shtylyov wrote:
> On 9/26/2018 12:13 PM, Simon Horman wrote:
> 
> > > > From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > > 
> > > > The r8a77995 D3 platform has 2 LVDS channels connected to the DU.
> > > > 
> > > > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > > [uli: moved lvds* into the soc node, added PM domains, resets]
> > > > Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > ---
> > > >    arch/arm64/boot/dts/renesas/r8a77995.dtsi | 56 +++++++++++++++++++++++++++++++
> > > >    1 file changed, 56 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> > > > index 89a04a4496fd..214f4954b321 100644
> > > > --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> > > > @@ -972,12 +972,68 @@
> > > >    				port@1 {
> > > >    					reg = <1>;
> > > >    					du_out_lvds0: endpoint {
> > > > +						remote-endpoint = <&lvds0_in>;
> > > >    					};
> > > >    				};
> > > >    				port@2 {
> > > >    					reg = <2>;
> > > >    					du_out_lvds1: endpoint {
> > > > +						remote-endpoint = <&lvds1_in>;
> > > > +					};
> > > > +				};
> > > > +			};
> > > > +		};
> > > > +
> > > > +		lvds0: lvds-encoder@feb90000 {
> > > > +			compatible = "renesas,r8a77995-lvds";
> > > > +			reg = <0 0xfeb90000 0 0x20>;
> > > > +			clocks = <&cpg CPG_MOD 727>;
> > > > +			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> > > > +			resets = <&cpg 727>;
> > > > +			status = "disabled";
> > > > +
> > > > +			ports {
> > > > +				#address-cells = <1>;
> > > > +				#size-cells = <0>;
> > > > +
> > > > +				port@0 {
> > > > +					reg = <0>;
> > > > +					lvds0_in: endpoint {
> > > > +						remote-endpoint = <&du_out_lvds0>;
> > > > +					};
> > > > +				};
> > > > +
> > > > +				port@1 {
> > > > +					reg = <1>;
> > > > +					lvds0_out: endpoint {
> > > > +					};
> > > > +				};
> > > > +			};
> > > > +		};
> > > > +
> > > > +		lvds1: lvds-encoder@feb90100 {
> > > > +			compatible = "renesas,r8a77995-lvds";
> > > > +			reg = <0 0xfeb90100 0 0x20>;
> > > > +			clocks = <&cpg CPG_MOD 727>;
> > > 
> > >     Not 726?
> > > 
> > > > +			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> > > > +			resets = <&cpg 726>;
> > > 
> > >     ... like here?
> > 
> > I believe that discussion was already had for v2 of the similar patch
> > for r8a77990 and that it is intentional.
> 
>    Ah, sorry, missed that. Still looks like a documentation error... :-)

Yes, that is my understanding too.
