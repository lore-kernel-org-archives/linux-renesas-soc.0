Return-Path: <devicetree-owner@vger.kernel.org>
Date: Wed, 29 Nov 2017 10:38:22 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77970: add I2C support
Message-ID: <20171129093817.bbcdlggh7i2vuril@verge.net.au>
References: <20171116210757.729290426@cogentembedded.com>
 <CAMuHMdV1RFyvPSZjEiJvdnu6QfHC9s-oUubvph0atGqx27MjnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV1RFyvPSZjEiJvdnu6QfHC9s-oUubvph0atGqx27MjnA@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 22, 2017 at 02:06:59PM +0100, Geert Uytterhoeven wrote:
> Hi Sergei,
> 
> On Thu, Nov 16, 2017 at 10:06 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > Define the generic R8A77970 parts of the I2C[0-4] device node.
> >
> > Based on the original (and large) patch by Daisuke Matsushita
> > <daisuke.matsushita.ns@hitachi.com>.
> >
> > Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Thanks for your patch!
> 
> > --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > +++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> 
> > @@ -483,5 +491,85 @@
> >                         #address-cells = <1>;
> >                         #size-cells = <0>;
> >                 };
> > +
> > +               i2c0: i2c@e6500000 {
> > +                       compatible = "renesas,i2c-r8a77970",
> > +                                    "renesas,rcar-gen3-i2c";
> > +                       reg = <0 0xe6500000 0 0x40>;
> > +                       interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 931>;
> > +                       power-domains = <&sysc 32>;
> > +                       resets = <&cpg 931>;
> > +                       dmas = <&dmac1 0x91>, <&dmac1 0x90>;
> 
> Can't all five i2c interfaces be used with both dmac1 and dmac2?
> 
> With that fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Hi Sergei,

I have marked this series as "Changes Requested" in light of Geert's review
above. 
