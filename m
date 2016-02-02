Return-Path: <devicetree-owner@vger.kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Simon Horman <horms@verge.net.au>,
	Geert Uytterhoeven <geert@linux-m68k.org>
CC: Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Ian Campbell" <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: r8a7795: Add USB-DMAC device nodes
Date: Tue, 2 Feb 2016 10:39:31 +0000
Message-ID: <TY1PR06MB0928C88377A9640546246763D8DF0@TY1PR06MB0928.apcprd06.prod.outlook.com>
References: <1454322540-5608-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdUEUDkB3=jHAwXDozpdgFCimGS=LXsrxSVWac5xW2bg+A@mail.gmail.com>
 <20160202102959.GG15554@verge.net.au>
In-Reply-To: <20160202102959.GG15554@verge.net.au>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon-san,

> From: Simon Horman [mailto:horms@verge.net.au]
> Sent: Tuesday, February 02, 2016 7:30 PM
> 
> On Tue, Feb 02, 2016 at 11:10:00AM +0100, Geert Uytterhoeven wrote:
> > On Mon, Feb 1, 2016 at 11:29 AM, Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > > @@ -880,5 +880,31 @@
> > >                         power-domains = <&cpg>;
> > >                         status = "disabled";
> > >                 };
> > > +
> > > +               usb_dmac0: dma-controller@e65a0000 {
> > > +                       compatible = "renesas,r8a7795-usb-dmac",
> > > +                                    "renesas,usb-dmac";
> > > +                       reg = <0 0xe65a0000 0 0x100>;
> > > +                       interrupts = <0 109 IRQ_TYPE_LEVEL_HIGH
> > > +                                     0 109 IRQ_TYPE_LEVEL_HIGH>;
> >
> > Sorry, I missed you're not using the GIC_SPI defines.
> 
> Thanks, I fixed that and queued up the following

Thank you very much for the fix!

Best regards,
Yoshihiro Shimoda

> From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Date: Mon, 1 Feb 2016 19:29:00 +0900
> Subject: [PATCH] arm64: dts: r8a7795: Add USB-DMAC device nodes
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> index 119549e6502d..95967b72db35 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -880,5 +880,31 @@
>  			power-domains = <&cpg>;
>  			status = "disabled";
>  		};
> +
> +		usb_dmac0: dma-controller@e65a0000 {
> +			compatible = "renesas,r8a7795-usb-dmac",
> +				     "renesas,usb-dmac";
> +			reg = <0 0xe65a0000 0 0x100>;
> +			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "ch0", "ch1";
> +			clocks = <&cpg CPG_MOD 330>;
> +			power-domains = <&cpg>;
> +			#dma-cells = <1>;
> +			dma-channels = <2>;
> +		};
> +
> +		usb_dmac1: dma-controller@e65b0000 {
> +			compatible = "renesas,r8a7795-usb-dmac",
> +				     "renesas,usb-dmac";
> +			reg = <0 0xe65b0000 0 0x100>;
> +			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
> +				      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "ch0", "ch1";
> +			clocks = <&cpg CPG_MOD 331>;
> +			power-domains = <&cpg>;
> +			#dma-cells = <1>;
> +			dma-channels = <2>;
> +		};
>  	};
>  };
> --
> 2.7.0.rc3.207.g0ac5344

