Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37696 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759050AbcJTKBI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Oct 2016 06:01:08 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Simon Horman <horms@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: r8a7779: Fix DU reg property
Date: Thu, 20 Oct 2016 13:00:58 +0300
Message-ID: <3220182.XWJ5KRRtK6@avalon>
In-Reply-To: <20161020084229.GE4612@verge.net.au>
References: <1476829382-14785-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <20161020084229.GE4612@verge.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Thursday 20 Oct 2016 10:42:30 Simon Horman wrote:
> Hi Laurent,
> 
> On Wed, Oct 19, 2016 at 01:23:02AM +0300, Laurent Pinchart wrote:
> > The system uses one address cell and one size cell, not two. Fix the DU
> > DT node.
> 
> Do you want to handle this as a fix for v4.9? If so shall we add the
> following?
> 
> Fixes: 1f08bbe8ac73 ("ARM: shmobile: r8a7779: Add DU node to device tree")
> 
> Else I'll just queue it up for v4.10.

v4.10 is fine, 1f08bbe8ac73 was merged in v3.19, so there's no urgency :-)

It looks like nobody has tried to get display working on Marzen for a very 
long time.

> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> >  arch/arm/boot/dts/r8a7779.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/boot/dts/r8a7779.dtsi
> > b/arch/arm/boot/dts/r8a7779.dtsi index b9bbcce69dfb..9d5b8fa3da8b 100644
> > --- a/arch/arm/boot/dts/r8a7779.dtsi
> > +++ b/arch/arm/boot/dts/r8a7779.dtsi
> > @@ -420,7 +420,7 @@
> > 
> >  	du: display@fff80000 {
> >  		compatible = "renesas,du-r8a7779";
> > -		reg = <0 0xfff80000 0 0x40000>;
> > +		reg = <0xfff80000 0x40000>;
> >  		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> >  		clocks = <&mstp1_clks R8A7779_CLK_DU>;
> >  		power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;

-- 
Regards,

Laurent Pinchart
