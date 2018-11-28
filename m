MIME-Version: 1.0
Date: Wed, 28 Nov 2018 10:41:24 +0100
References: <152923212426.18394.1638836062311758848.sendpatchset@little-apple>
	<20180620091416.s4vdg5tgkl3mnoxd@verge.net.au>
	<20180716074939.76mes7rt5ddqnyy6@verge.net.au>
In-Reply-To: <20180716074939.76mes7rt5ddqnyy6@verge.net.au>
Message-ID: <CAMuHMdVPvmNXmwjbNXsQWxfsjKUa6E+caSf-mHhXarnVo0FTyA@mail.gmail.com>
Subject: Re: [PATCH v2 00/03] arm64: dts: renesas: Add IPMMU device nodes V2
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 16, 2018 at 9:50 AM Simon Horman <horms@verge.net.au> wrote:
> On Wed, Jun 20, 2018 at 11:14:17AM +0200, Simon Horman wrote:
> > On Sun, Jun 17, 2018 at 07:42:04PM +0900, Magnus Damm wrote:
> > > arm64: dts: renesas: Add IPMMU device nodes V2
> > >
> > > [PATCH v2 01/03] arm64: dts: renesas: r8a77965: Add IPMMU devices nodes
> > > [PATCH v2 02/03] arm64: dts: renesas: r8a77980: Add IPMMU devices nodes
> > > [PATCH v2 03/03] arm64: dts: renesas: r8a77990: Add IPMMU devices nodes
> > >
> > > This series is the second attempt to add IPMMU device nodes to R-Car M3-N,
> > > R-Car V3H and R-Car E3 SoCs.
> > >
> > > The IPMMU DT binding changes are not yet merged upstream however they
> > > have been documented by the following patches:
> > >
> > > [PATCH] iommu/ipmmu-vmsa: Document R-Car M3-N IPMMU DT bindings
> > > [PATCH] iommu/ipmmu-vmsa: Document R-Car V3H and E3 IPMMU DT bindings
> > >
> > > Please see each individual patch for list of changes.
> >
> > Hi Magnus,
> >
> > as per my comment on v1, did you consider merging these patches into one
> > patch. Olof has asked that we consider such consolidation.
>
> The above dependencies now appear have been accepted for v4.19.
>
> I have now applied this series. I took the liberty of squashing all three
> patches into one. The result is as follows.
>
>
> From: Magnus Damm <damm+renesas@opensource.se>
> Date: Sun, 17 Jun 2018 19:42:13 +0900
> Subject: [PATCH] arm64: dts: renesas: r8a779{65,80,90}: Add IPMMU devices
>  nodes
>
> Add IPMMU device nodes for the R-Car M3-N (r8a77965),
> V3H (r8a77980) and E3 (r8a77990) SoCs.
>
> * The r8a77965 IPMMU is quite similar to r8a7796 however VP0
>   has been added and PV1 has been removed. Also the IMSSTR
>   bit assignment has been reworked.

> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi

> +               ipmmu_ir: mmu@ff8b0000 {
> +                       compatible = "renesas,ipmmu-r8a77965";
> +                       reg = <0 0xff8b0000 0 0x1000>;
> +                       renesas,ipmmu-main = <&ipmmu_mm 3>;
> +                       power-domains = <&sysc R8A77965_PD_A3IR>;
> +                       #iommu-cells = <1>;
> +               };

Please note that R-Car Gen3 HardWare Manual Errata for Rev. 1.00 (Aug 24,
2018) removed the IPMMU-IR IOMMU instance on R-Car M3-N, as this SoC
does not have an Image Processing Unit (IMP-X5) nor the A3IR power domain.

I've sent a patch to fix that.

> * The r8a77980 IPMMU is quite similar to r8a77970 however VC0
>   has been added. The IMSSTR bit assignment has also been
>   reworked. Power domains are also quite different however the
>   the documentation is rather unclear about this topic.
>
>   Until we know better VC0 gets assigned to R8A77980_PD_ALWAYS_ON.

JFTR, this matches the R-Car Gen3 HardWare Manual Errata for Rev. 1.00
(Jul 20, 2018).

> * The r8a77990 IPMMU is similar to r8a77995. Power domains are
>   however different and the public documentation is still unclear.
>
>   Based on preliminary information from the hardware team the R-Car E3
>   SoC comes with an IPMMU-VP0 device in an Always-on power domain and
>   the IPMMU-VC0 is placed as expected in the A3VC power domain.

JFTR, this matches the R-Car Gen3 HardWare Manual Errata for Rev. 1.00
(Jul 20, 2018).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
