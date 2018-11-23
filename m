Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50168 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409797AbeKWXR4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 18:17:56 -0500
Date: Fri, 23 Nov 2018 13:33:51 +0100
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7796: add SSIU support for sound
Message-ID: <20181123123350.b7x4rfbtpxt4ncxa@verge.net.au>
References: <87y39n1c2y.wl-kuninori.morimoto.gx@renesas.com>
 <20181121095154.3e4e3l2wjaugjyuq@verge.net.au>
 <875zwqng8c.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875zwqng8c.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 21, 2018 at 11:58:59PM +0000, Kuninori Morimoto wrote:
> 
> Hi Simon
> 
> > > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > 
> > > rsnd driver supports SSIU now, let's use it.
> > > Then, BUSIF DMA settings on rcar_sound,ssi (= rxu, txu) are
> > > no longer needed.
> > > To avoid git merge timing issue / git bisect issue,
> > > this patch doesn't remove it so far, but will be removed in
> > > the future.
> > > 
> > > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > ---
> > >  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 211 +++++++++++++++++++++++++++++++
> > >  1 file changed, 211 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > > index 449eb33..5cc9b8b 100644
> > > --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > > @@ -1826,6 +1826,217 @@
> > >  				};
> > >  			};
> > >  
> > > +			rcar_sound,ssiu {
> > > +				ssiu00: ssiu-0 {
> > > +					dmas = <&audma0 0x15>, <&audma1 0x16>;
> > > +					dma-names = "rx", "tx";
> > > +				};
> > 
> > Hi Morimoto-san,
> > 
> > I am having a little trouble finding documentation of the audma port
> > numbers used in this patch.
> 
> ?? Sorry what do you mean ?
> You can find it on
> 
> 	Table 48.5 Selecting On-Chip Peripheral Module Request Modes

Thanks, that is the information that I was looking fore.

I have gone ahead and applied this patch for v4.21.
