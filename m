Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56664 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754496AbeEWIlE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 May 2018 04:41:04 -0400
Date: Wed, 23 May 2018 10:41:00 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77980: add GEther support
Message-ID: <20180523084100.ynv3zoqrikcxem5f@verge.net.au>
References: <a4230699-e46f-0782-e3b1-22d58b9033c8@cogentembedded.com>
 <8910c197-cf1b-9ee9-9ddb-5d2f705a4b26@cogentembedded.com>
 <CAMuHMdW9UzOGV_zh3NxugYrj0j0qszX+NFoZtFvZRD9CNMHt+w@mail.gmail.com>
 <bdbfd13e-cf0c-e19a-b76f-5e8e024dca26@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdbfd13e-cf0c-e19a-b76f-5e8e024dca26@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 22, 2018 at 06:44:59PM +0300, Sergei Shtylyov wrote:
> On 05/22/2018 02:48 PM, Geert Uytterhoeven wrote:
> 
> >> Define the generic R8A77980 part of the GEther device node.
> >>
> >> Based on the original (and large) patch by Vladimir Barinov.
> >>
> >> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> >> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > 
> > Thanks for your patch!
> > 
> > With the below addressed:
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
>    Thanks!
> 
> >> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> >> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> >> @@ -417,6 +417,17 @@
> >>                         dma-channels = <16>;
> >>                 };
> >>
> >> +               gether: ethernet@e7400000 {
> >> +                       compatible = "renesas,gether-r8a77980";
> >> +                       reg = <0 0xe7400000 0 0x1000>;
> >> +                       interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> >> +                       clocks = <&cpg CPG_MOD 813>;
> >> +                       power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
> > 
> > resets = <&cpg 813>;
> 
>    As usual...
> 
> > 
> >> +                       #address-cells = <1>;
> >> +                       #size-cells = <0>;
> >> +                       status = "disabled";
> > 
> > Any default phy-mode needed?
> 
>    A default "phy-mode" IMO make sense when the MAC supports a single 
> PHY interface mode. In this case, both RMII and RGMII are supported, so
> I coulsn't choose a default...

I would think making an arbitrary choice is better than no choice.
How does the driver behave in the absence of a default?

> 
> >> +               };
> >> +
> >>                 mmc0: mmc@ee140000 {
> >>                         compatible = "renesas,sdhi-r8a77980",
> >>                                      "renesas,rcar-gen3-sdhi";
> > 
> > 
> > Gr{oetje,eeting}s,
> > 
> >                         Geert
> > 
> 
