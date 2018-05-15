Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34240 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752472AbeEOIBZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 May 2018 04:01:25 -0400
Date: Tue, 15 May 2018 10:01:06 +0200
From: Simon Horman <horms@verge.net.au>
To: jacopo mondi <jacopo@jmondi.org>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH] ARM: dts: r8a7740: Add CEU1
Message-ID: <20180515080106.idteatq7h6f4sgki@verge.net.au>
References: <20180507123757.4708-1-horms+renesas@verge.net.au>
 <20180515071006.vmtxzwrppzrgekmf@verge.net.au>
 <20180515072132.GP5956@w540>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180515072132.GP5956@w540>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 15, 2018 at 09:21:32AM +0200, jacopo mondi wrote:
> Hi Simon,
> 
> On Tue, May 15, 2018 at 09:10:06AM +0200, Simon Horman wrote:
> > On Mon, May 07, 2018 at 02:37:57PM +0200, Simon Horman wrote:
> > > Describe CEU1 peripheral for Renesas R-Mobile A1 R8A7740 Soc.
> > >
> > > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> >
> > Would anyone care to review this change?
> 
> That would be me, as I've sent patches for CEU0 on R-Mobile A1, sorry
> about that.

No problem :)

> > > ---
> > >  arch/arm/boot/dts/r8a7740.dtsi | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > >  Depends and based on:
> > >  "[PATCH v2 2/2] ARM: dts: r8a7740: Add CEU0"
> > >
> > > diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
> > > index 508d93440ee8..af4c071c9178 100644
> > > --- a/arch/arm/boot/dts/r8a7740.dtsi
> > > +++ b/arch/arm/boot/dts/r8a7740.dtsi
> > > @@ -77,6 +77,16 @@
> > >  		status = "disabled";
> > >  	};
> > >
> > > +	ceu1: ceu@fe914000 {
> > > +		reg = <0xfe910000 0x3000>;
> 
> The reg property start address does not match the device node unit
> address (which is the correct one according to documentation).

Thanks, v2 posted.
