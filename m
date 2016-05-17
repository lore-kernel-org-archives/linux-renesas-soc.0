Return-Path: <devicetree-owner@vger.kernel.org>
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Tue, 17 May 2016 12:13:06 +0200
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] arm64: dts: r8a7795: enable DMA for I2C
Message-ID: <20160517101306.GH29375@bigcity.dyn.berto.se>
References: <1462365303-1664-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUqkodEsmOwzwv_PNVgqxkxG3bmjGTDYY5pC7g6tLciFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUqkodEsmOwzwv_PNVgqxkxG3bmjGTDYY5pC7g6tLciFg@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2016-05-17 10:52:08 +0200, Geert Uytterhoeven wrote:
> On Wed, May 4, 2016 at 2:35 PM, Niklas S�derlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Add DMA properties to the I2C nodes.
> >
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > index a7315eb..49896e4 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > @@ -693,6 +693,8 @@
> >                         interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
> >                         clocks = <&cpg CPG_MOD 931>;
> >                         power-domains = <&cpg>;
> > +                       dmas = <&dmac1 0x91>, <&dmac1 0x90>;
> > +                       dma-names = "tx", "rx";
> >                         i2c-scl-internal-delay-ns = <110>;
> >                         status = "disabled";
> >                 };
> > @@ -705,6 +707,8 @@
> >                         interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
> >                         clocks = <&cpg CPG_MOD 930>;
> >                         power-domains = <&cpg>;
> > +                       dmas = <&dmac1 0x93>, <&dmac1 0x92>;
> > +                       dma-names = "tx", "rx";
> >                         i2c-scl-internal-delay-ns = <6>;
> >                         status = "disabled";
> >                 };
> > @@ -717,6 +721,8 @@
> >                         interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
> >                         clocks = <&cpg CPG_MOD 929>;
> >                         power-domains = <&cpg>;
> > +                       dmas = <&dmac1 0x95>, <&dmac1 0x94>;
> > +                       dma-names = "tx", "rx";
> >                         i2c-scl-internal-delay-ns = <6>;
> >                         status = "disabled";
> >                 };
> 
> The three above can be used with SYS-DMAC1 (channels 16-31) or with SYS-DMAC2
> (channels 32-47).
> It should be tested with the latter before adding the corresponding dmas, as
> we had issue with SYS-DMAC2 before (they may have been fixed in firmware in the
> mean time).

I tested with firmware v270-4core and you are correct, looks like dmac2 
is not working for i2c.

> 
> > @@ -729,6 +735,8 @@
> >                         interrupts = <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
> >                         clocks = <&cpg CPG_MOD 928>;
> >                         power-domains = <&cpg>;
> > +                       dmas = <&dmac1 0x97>, <&dmac1 0x96>;
> 
> The two phandles above should reference "dmac0", as this i2c module can only be
> used with SYS-DMAC0 (channels 0-15), according to the datasheet.

Thanks for pointing this out! I will fix it.

> 
> > +                       dma-names = "tx", "rx";
> >                         i2c-scl-internal-delay-ns = <110>;
> >                         status = "disabled";
> >                 };
> > @@ -741,6 +749,8 @@
> >                         interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> >                         clocks = <&cpg CPG_MOD 927>;
> >                         power-domains = <&cpg>;
> > +                       dmas = <&dmac1 0x99>, <&dmac1 0x98>;
> 
> dmac0
> 
> > +                       dma-names = "tx", "rx";
> >                         i2c-scl-internal-delay-ns = <110>;
> >                         status = "disabled";
> >                 };
> > @@ -753,6 +763,8 @@
> >                         interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> >                         clocks = <&cpg CPG_MOD 919>;
> >                         power-domains = <&cpg>;
> > +                       dmas = <&dmac1 0x9b>, <&dmac1 0x9a>;
> 
> dmac0
> 
> > +                       dma-names = "tx", "rx";
> >                         i2c-scl-internal-delay-ns = <110>;
> >                         status = "disabled";
> >                 };
> > @@ -765,6 +777,8 @@
> >                         interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> >                         clocks = <&cpg CPG_MOD 918>;
> >                         power-domains = <&cpg>;
> > +                       dmas = <&dmac1 0x9d>, <&dmac1 0x9c>;
> 
> dmac0
> 
> > +                       dma-names = "tx", "rx";
> >                         i2c-scl-internal-delay-ns = <6>;
> >                         status = "disabled";
> >                 };
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Regards,
Niklas S�derlund
