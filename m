Return-Path: <devicetree-owner@vger.kernel.org>
Date: Thu, 1 Mar 2018 10:54:13 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r8a77970: add I2C support
Message-ID: <20180301095412.obgrryduesbjinbv@verge.net.au>
References: <3aaa4464-fc85-3fb4-2026-5d9df357bdff@cogentembedded.com>
 <e309d9cd-69c6-7db2-96a4-73bc788b7cfc@cogentembedded.com>
 <CAMuHMdWcwx8=KKf0RajtSXnJY9duaupFmUUKEka=uAmJjTdvoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWcwx8=KKf0RajtSXnJY9duaupFmUUKEka=uAmJjTdvoQ@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Feb 28, 2018 at 11:56:27AM +0100, Geert Uytterhoeven wrote:
> On Mon, Feb 26, 2018 at 9:54 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > Define the generic R8A77970 parts of the I2C[0-4] device node.
> >
> > Based on the original (and large) patch by Daisuke Matsushita
> > <daisuke.matsushita.ns@hitachi.com>.
> >
> > Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >
> > ---
> > Changes in version 2:
> > - made  use of  the SYSC power domain #define's;
> > - moved the I2C nodes before HSCIF nodes.
> 
> auto-repeat below...
> 
> >  arch/arm64/boot/dts/renesas/r8a77970.dtsi |   88 ++++++++++++++++++++++++++++++
> >  1 file changed, 88 insertions(+)
> >
> > Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > ===================================================================
> > --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > +++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > @@ -19,6 +19,14 @@
> >         #address-cells = <2>;
> >         #size-cells = <2>;
> >
> > +       aliases {
> > +               i2c0 = &i2c0;
> > +               i2c1 = &i2c1;
> > +               i2c2 = &i2c2;
> > +               i2c3 = &i2c3;
> > +               i2c4 = &i2c4;
> > +       };
> > +
> >         psci {
> >                 compatible = "arm,psci-1.0", "arm,psci-0.2";
> >                 method = "smc";
> > @@ -338,6 +346,86 @@
> >                                <&ipmmu_ds1 22>, <&ipmmu_ds1 23>;
> >                 };
> >
> > +               i2c0: i2c@e6500000 {
> > +                       compatible = "renesas,i2c-r8a77970",
> > +                                    "renesas,rcar-gen3-i2c";
> > +                       reg = <0 0xe6500000 0 0x40>;
> > +                       interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 931>;
> > +                       power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> > +                       resets = <&cpg 931>;
> > +                       dmas = <&dmac1 0x91>, <&dmac1 0x90>;
> 
> Can't all five i2c interfaces be used with both dmac1 and dmac2?
> 
> With that fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Sergei, please address this review and repost as appropriate.
