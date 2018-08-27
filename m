Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50402 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726895AbeH0Qnm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Aug 2018 12:43:42 -0400
Date: Mon, 27 Aug 2018 14:57:05 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Nguyen An Hoan <na-hoan@jinso.co.jp>, broonie@kernel.org,
        linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        magnus.damm@gmail.com, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
Subject: Re: [PATCH 1/2] arm64: dts: r8a77965: add FDP1 device nodes
Message-ID: <20180827125704.jg4zuj2pfjykbcga@verge.net.au>
References: <1535086349-10657-1-git-send-email-na-hoan@jinso.co.jp>
 <1535086349-10657-2-git-send-email-na-hoan@jinso.co.jp>
 <8040588.1BRXcikCUd@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8040588.1BRXcikCUd@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Aug 24, 2018 at 11:45:52AM +0300, Laurent Pinchart wrote:
> Hello Nguyen An,
> 
> Thank you for the patch.
> 
> On Friday, 24 August 2018 07:52:28 EEST Nguyen An Hoan wrote:
> > From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> 
> You're missing a commit message. I agree that for simple patches like this one 
> the subject line often contains enough information, but adding a commit 
> message is still a good practice that we try to enforce through the kernel. 
> For instance, looking at git history for r8a7796, you could use
> 
> "The r8a77965 has a single FDP1 instance."
> 
> > Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> 
> Apart from that,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Simon, could you update the commit message when taking this patch in your 
> tree, to avoid the need for a v2 ?

Yes, can do.

Can I confirm that it is safe, from a regression point of view,
to apply this patch without patch 2/2?

> > ---
> >  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> > b/arch/arm64/boot/dts/renesas/r8a77965.dtsi index 9c4f405..bef519f 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> > @@ -1578,6 +1578,16 @@
> >  			status = "disabled";
> >  		};
> > 
> > +		fdp1@fe940000 {
> > +			compatible = "renesas,fdp1";
> > +			reg = <0 0xfe940000 0 0x2400>;
> > +			interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&cpg CPG_MOD 119>;
> > +			power-domains = <&sysc R8A77965_PD_A3VP>;
> > +			resets = <&cpg 119>;
> > +			renesas,fcp = <&fcpf0>;
> > +		};
> > +
> >  		fcpf0: fcp@fe950000 {
> >  			compatible = "renesas,fcpf";
> >  			reg = <0 0xfe950000 0 0x200>;
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
> 
