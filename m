Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41665 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751691AbeD3HHv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Apr 2018 03:07:51 -0400
Date: Mon, 30 Apr 2018 09:07:48 +0200
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 07/10] ARM: dts: kzm9d: Drop unnecessary address
 properties from gpio_keys node
Message-ID: <20180430070747.tyc2p5xhzvv3ja6o@verge.net.au>
References: <20180426102951.8683-1-horms+renesas@verge.net.au>
 <20180426102951.8683-8-horms+renesas@verge.net.au>
 <20180426145213.GD3315@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180426145213.GD3315@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 26, 2018 at 04:52:13PM +0200, Niklas Söderlund wrote:
> Hi Simon,
> 
> Thanks for your work.
> 
> On 2018-04-26 12:29:48 +0200, Simon Horman wrote:
> > The gpio_keys node does not have an address and thus does not need
> > address-cells or address size-properties.
> > 
> > This is flagged by dtc as follows:
> >  # make dtbs W=1
> >  arch/arm/boot/dts/r8a7794-silk.dtb: Warning (avoid_unnecessary_addr_size): /soc/video@e6ef0000/port: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
> 
> This warning don't seem to match with the change nor the rest of the 
> commit message :-)
> 
> With that addressed and for the whole series:
> 
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks!

The fix is:

arch/arm/boot/dts/emev2-kzm9d.dtb: Warning (avoid_unnecessary_addr_size): /gpio_keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> >  arch/arm/boot/dts/emev2-kzm9d.dts | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/emev2-kzm9d.dts b/arch/arm/boot/dts/emev2-kzm9d.dts
> > index c238407133bf..0af44b7eadb9 100644
> > --- a/arch/arm/boot/dts/emev2-kzm9d.dts
> > +++ b/arch/arm/boot/dts/emev2-kzm9d.dts
> > @@ -34,9 +34,6 @@
> >  
> >  	gpio_keys {
> >  		compatible = "gpio-keys";
> > -		#address-cells = <1>;
> > -		#size-cells = <0>;
> > -
> >  		one {
> >  			debounce-interval = <50>;
> >  			wakeup-source;
> > -- 
> > 2.11.0
> > 
> 
> -- 
> Regards,
> Niklas Söderlund
> 
