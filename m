Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.23]:12488 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388502AbeHANsa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Aug 2018 09:48:30 -0400
Date: Wed, 1 Aug 2018 13:59:51 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: jacopo mondi <jacopo@jmondi.org>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <531695573.235554.1533124791946@webmail.strato.com>
In-Reply-To: <20180801103507.GA29238@w540>
References: <1526386840-15368-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1526386840-15368-4-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20180801103507.GA29238@w540>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: r8a77995: Add LVDS support
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


> On August 1, 2018 at 12:35 PM jacopo mondi <jacopo@jmondi.org> wrote:
> 
> 
> Hi Ulrich,
>    I know this series needs to be re-spin when the D3/E3 LVDS PLL
> support will be added, but since I need it for testing on D3 the LVDS
> interface reset support, I noticed a small issue which I thought it is
> worth reporting.
> 
> On Tue, May 15, 2018 at 02:20:38PM +0200, Ulrich Hecht wrote:
> > From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >
> > The r8a77995 D3 platform has 2 LVDS channels connected to the DU.
> >
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > [uli: moved lvds* into the soc node, added PM domains, resets]
> > Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 56 +++++++++++++++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> > index ba98865..8e78110d 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> > @@ -757,12 +757,68 @@
> >  				port@1 {
> >  					reg = <1>;
> >  					du_out_lvds0: endpoint {
> > +						remote-endpoint = <&lvds0_in>;
> >  					};
> >  				};
> >
> >  				port@2 {
> >  					reg = <2>;
> >  					du_out_lvds1: endpoint {
> > +						remote-endpoint = <&lvds1_in>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +
> > +		lvds0: lvds-encoder@feb90000 {
> > +			compatible = "renesas,r8a77995-lvds";
> > +			reg = <0 0xfeb90000 0 0x20>;
> > +			clocks = <&cpg CPG_MOD 727>;
> > +			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> > +			resets = <&cpg 727>;
> > +			status = "disabled";
> > +
> > +			ports {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				port@0 {
> > +					reg = <0>;
> > +					lvds0_in: endpoint {
> > +						remote-endpoint = <&du_out_lvds0>;
> > +					};
> > +				};
> > +
> > +				port@1 {
> > +					reg = <1>;
> > +					lvds0_out: endpoint {
> > +					};
> > +				};
> > +			};
> > +		};
> > +
> > +		lvds1: lvds-encoder@feb90100 {
> > +			compatible = "renesas,r8a77995-lvds";
> > +			reg = <0 0xfeb90100 0 0x20>;
> > +			clocks = <&cpg CPG_MOD 727>;
> > +			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> > +			resets = <&cpg 727>;
> 
> The LVDS-IF1 CPG reset is SRCR7[26], this I think this should be
> <&cpg 726>
> 
> Please note that the most recent chip manual release has probably an
> error at page 3180, section 37-32
> 
> 5. When display on in the LVDS0-IF, it is necessary to reset (SRCR7[27]) and reset clearing (SRSTCLR7[27])
> LVDS0-IF module.
> When display on in the LVDS1-IF, it is necessary to reset (SRCR7[26]) and reset clearing (SRSTCLR7[26])
> LVDS0-IF module
>     ^- This should probablt be LVDS1-IF
> 

Thanks for the hint, I will keep this in mind.

CU
Uli
