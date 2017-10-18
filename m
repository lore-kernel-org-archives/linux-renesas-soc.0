Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56560 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964939AbdJRFWb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Oct 2017 01:22:31 -0400
Date: Wed, 18 Oct 2017 07:22:08 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH  2/2] ARM: dts: r8a7743: Add xhci support to SoC dtsi
Message-ID: <20171018052208.h7xayzow5opmmdeo@verge.net.au>
References: <1508148769-47488-1-git-send-email-biju.das@bp.renesas.com>
 <1508148769-47488-3-git-send-email-biju.das@bp.renesas.com>
 <TY1PR06MB0992D251A9DB8DB83E7099C9D84C0@TY1PR06MB0992.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR06MB0992D251A9DB8DB83E7099C9D84C0@TY1PR06MB0992.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 17, 2017 at 01:39:33AM +0000, Yoshihiro Shimoda wrote:
> Hi Biju-san,
> 
> IIUC, when we submitted a patch for dts[i] file,
> we don't need to submit such a patch to usb maintainers.
> 
> > From: Biju Das, Sent: Monday, October 16, 2017 7:13 PM
> > 
> > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > 
> > Add node for xhci. Boards DT files will enable it if needed.
> > 
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> >  arch/arm/boot/dts/r8a7743.dtsi | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
> > index 699c040..386bf07 100644
> > --- a/arch/arm/boot/dts/r8a7743.dtsi
> > +++ b/arch/arm/boot/dts/r8a7743.dtsi
> > @@ -931,6 +931,26 @@
> >  			status = "disabled";
> >  		};
> > 
> > +		/*
> > +		 * pci1 and xhci share the same phy, therefore only one of them
> > +		 * can be active at any one time. If both of them are enabled,
> > +		 * a race condition will determine who'll control the phy.
> > +		 * A firmware file is needed by the xhci driver in order for
> > +		 * USB 3.0 to work properly.
> > +		 */
> > +		xhci: usb@ee000000 {
> > +			compatible = "renesas,xhci-r8a7743",
> > +				     "renesas,rcar-gen2-xhci";
> > +			reg = <0 0xee000000 0 0xc00>;
> > +			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&cpg CPG_MOD 328>;
> > +			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
> > +			resets = <&cpg 328>;
> > +			phys = <&usb2 1>;
> > +			phy-names = "usb";
> > +			status = "disabled";
> > +		};
> > +
> >  		sdhi0: sd@ee100000 {
> >  			compatible = "renesas,sdhi-r8a7743";
> >  			reg = <0 0xee100000 0 0x328>;
> 
> It seems good to me. So,
> 
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks, applied.
