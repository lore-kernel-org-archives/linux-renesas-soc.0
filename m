Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:37252 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727133AbeIQORg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 10:17:36 -0400
Date: Mon, 17 Sep 2018 10:51:06 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Ulrich Hecht <uli@fpond.eu>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 13/16] arm64: dts: renesas: r8a77990: Add display
 output support
Message-ID: <20180917085105.uejmjkwxsvsna75p@verge.net.au>
References: <20180914091046.483-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180914091046.483-14-laurent.pinchart+renesas@ideasonboard.com>
 <20180917075054.gnfepzxxaxzb46mg@verge.net.au>
 <1591566.tkYZ6URfXP@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591566.tkYZ6URfXP@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 17, 2018 at 11:38:43AM +0300, Laurent Pinchart wrote:
> Hi Simon,
> 
> On Monday, 17 September 2018 10:50:55 EEST Simon Horman wrote:
> > On Fri, Sep 14, 2018 at 12:10:43PM +0300, Laurent Pinchart wrote:
> > > The R8A77990 (E3) platform has one RGB output and two LVDS outputs
> > > connected to the DU. Add the DT nodes for the DU, LVDS encoders and
> > > supporting VSP and FCP.
> > > 
> > > Signed-off-by: Laurent Pinchart
> > > <laurent.pinchart+renesas@ideasonboard.com>
> > > Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > > 
> > >  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 167 +++++++++++++++++++++++++
> > >  1 file changed, 167 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > > b/arch/arm64/boot/dts/renesas/r8a77990.dtsi index
> > > abb14af76c0e..600074ca3ee5 100644
> > > --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > > @@ -537,6 +537,173 @@
> > >  			resets = <&cpg 408>;
> > >  		};
> > 
> > These nodes should be placed after the gic to preserve the sorting
> > of nodes by bus address and then IP block.
> 
> Aren't they already ? :-)

Git didn't seem to think so. But its not a big deal,
I can fix this up locally.

> > > +		vspb0: vsp@fe960000 {
> > > +			compatible = "renesas,vsp2";
> > > +			reg = <0 0xfe960000 0 0x8000>;
> > > +			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> > > +			clocks = <&cpg CPG_MOD 626>;
> > > +			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
> > > +			resets = <&cpg 626>;
> > > +			renesas,fcp = <&fcpvb0>;
> > > +		};
> > > +
> > > +		fcpvb0: fcp@fe96f000 {
> > > +			compatible = "renesas,fcpv";
> > > +			reg = <0 0xfe96f000 0 0x200>;
> > > +			clocks = <&cpg CPG_MOD 607>;
> > > +			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
> > > +			resets = <&cpg 607>;
> > > +			iommus = <&ipmmu_vp0 5>;
> > > +		};
> > > +
> > > +		vspi0: vsp@fe9a0000 {
> > > +			compatible = "renesas,vsp2";
> > > +			reg = <0 0xfe9a0000 0 0x8000>;
> > > +			interrupts = <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>;
> > > +			clocks = <&cpg CPG_MOD 622>;
> > 
> > R-Car Series, 3rd Generation, v1.00, Table Table 8A.21 indicates
> > that this clock should be <&cpg CPG_MOD 631>. The clock above is
> > (according to my reading of the documentation) correctly
> > used for vspd1 below.
> 
> Bad copy and paste, thank you for pointing it out, it will be fixed in v3.
> 
> > > +			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
> > > +			resets = <&cpg 631>;
> > > +			renesas,fcp = <&fcpvi0>;
> > > +		};
> > > +
> > > +		fcpvi0: fcp@fe9af000 {
> > > +			compatible = "renesas,fcpv";
> > > +			reg = <0 0xfe9af000 0 0x200>;
> > > +			clocks = <&cpg CPG_MOD 611>;
> > > +			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
> > > +			resets = <&cpg 611>;
> > > +			iommus = <&ipmmu_vp0 8>;
> > > +		};
> > > +
> > > +		vspd0: vsp@fea20000 {
> > > +			compatible = "renesas,vsp2";
> > > +			reg = <0 0xfea20000 0 0x7000>;
> > > +			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
> > > +			clocks = <&cpg CPG_MOD 623>;
> > > +			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
> > > +			resets = <&cpg 623>;
> > > +			renesas,fcp = <&fcpvd0>;
> > > +		};
> > > +
> > > +		fcpvd0: fcp@fea27000 {
> > > +			compatible = "renesas,fcpv";
> > > +			reg = <0 0xfea27000 0 0x200>;
> > > +			clocks = <&cpg CPG_MOD 603>;
> > > +			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
> > > +			resets = <&cpg 603>;
> > > +			iommus = <&ipmmu_vi0 8>;
> > > +		};
> > > +
> > > +		vspd1: vsp@fea28000 {
> > > +			compatible = "renesas,vsp2";
> > > +			reg = <0 0xfea28000 0 0x7000>;
> > > +			interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
> > > +			clocks = <&cpg CPG_MOD 622>;
> > > +			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
> > > +			resets = <&cpg 622>;
> > > +			renesas,fcp = <&fcpvd1>;
> > > +		};
> > > +
> > > +		fcpvd1: fcp@fea2f000 {
> > > +			compatible = "renesas,fcpv";
> > > +			reg = <0 0xfea2f000 0 0x200>;
> > > +			clocks = <&cpg CPG_MOD 602>;
> > > +			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
> > > +			resets = <&cpg 602>;
> > > +			iommus = <&ipmmu_vi0 9>;
> > > +		};
> > > +
> > > +		du: display@feb00000 {
> > > +			compatible = "renesas,du-r8a77990";
> > > +			reg = <0 0xfeb00000 0 0x80000>;
> > > +			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> > > +			clocks = <&cpg CPG_MOD 724>,
> > > +				 <&cpg CPG_MOD 723>;
> > > +			clock-names = "du.0", "du.1";
> > > +			vsps = <&vspd0 0 &vspd1 0>;
> > > +			status = "disabled";
> > > +
> > > +			ports {
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +
> > > +				port@0 {
> > > +					reg = <0>;
> > > +					du_out_rgb: endpoint {
> > > +					};
> > > +				};
> > > +
> > > +				port@1 {
> > > +					reg = <1>;
> > > +					du_out_lvds0: endpoint {
> > > +						remote-endpoint = <&lvds0_in>;
> > > +					};
> > > +				};
> > > +
> > > +				port@2 {
> > > +					reg = <2>;
> > > +					du_out_lvds1: endpoint {
> > > +						remote-endpoint = <&lvds1_in>;
> > > +					};
> > > +				};
> > > +			};
> > > +		};
> > > +
> > > +		lvds0: lvds-encoder@feb90000 {
> > > +			compatible = "renesas,r8a77990-lvds";
> > > +			reg = <0 0xfeb90000 0 0x20>;
> > > +			clocks = <&cpg CPG_MOD 727>;
> > > +			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
> > > +			resets = <&cpg 727>;
> > > +			status = "disabled";
> > > +
> > > +			ports {
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +
> > > +				port@0 {
> > > +					reg = <0>;
> > > +					lvds0_in: endpoint {
> > > +						remote-endpoint = <&du_out_lvds0>;
> > > +					};
> > > +				};
> > > +
> > > +				port@1 {
> > > +					reg = <1>;
> > > +					lvds0_out: endpoint {
> > > +					};
> > > +				};
> > > +			};
> > > +		};
> > > +
> > > +		lvds1: lvds-encoder@feb90100 {
> > > +			compatible = "renesas,r8a77990-lvds";
> > > +			reg = <0 0xfeb90100 0 0x20>;
> > > +			clocks = <&cpg CPG_MOD 727>;
> > > +			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
> > > +			resets = <&cpg 726>;
> > > +			status = "disabled";
> > > +
> > > +			ports {
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +
> > > +				port@0 {
> > > +					reg = <0>;
> > > +					lvds1_in: endpoint {
> > > +						remote-endpoint = <&du_out_lvds1>;
> > > +					};
> > > +				};
> > > +
> > > +				port@1 {
> > > +					reg = <1>;
> > > +					lvds1_out: endpoint {
> > > +					};
> > > +				};
> > > +			};
> > > +		};
> > > +
> > >  		prr: chipid@fff00044 {
> > >  			compatible = "renesas,prr";
> > >  			reg = <0 0xfff00044 0 4>;
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
> 
