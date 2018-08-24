Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:1311 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726686AbeHXMkj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 08:40:39 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>,
        Biju Das <biju.das@bp.renesas.com>
CC: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH 4/5] arm64: dts: renesas: r8a774a1: Add Ethernet AVB node
Date: Fri, 24 Aug 2018 09:06:49 +0000
Message-ID: <TY1PR01MB17707A80E98DE4602177C8EBC0360@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1535014731-64472-1-git-send-email-biju.das@bp.renesas.com>
 <1535014731-64472-5-git-send-email-biju.das@bp.renesas.com>
 <20180824090320.ib7zt4ae6kacjzlu@verge.net.au>
In-Reply-To: <20180824090320.ib7zt4ae6kacjzlu@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Simon,

Thank you for your feedback!

> Subject: Re: [PATCH 4/5] arm64: dts: renesas: r8a774a1: Add Ethernet AVB =
node
>
> On Thu, Aug 23, 2018 at 09:58:50AM +0100, Biju Das wrote:
> > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > This patch adds the SoC specific part of the Ethernet AVB
> > device tree node.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 45 +++++++++++++++++++++++=
++++++++
> >  1 file changed, 45 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boo=
t/dts/renesas/r8a774a1.dtsi
> > index 15d7785..b771211 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > @@ -350,6 +350,51 @@
> >  dma-channels =3D <16>;
> >  };
> >
> > +avb: ethernet@e6800000 {
> > +compatible =3D "renesas,etheravb-r8a774a1",
> > +     "renesas,etheravb-rcar-gen3";
> > +reg =3D <0 0xe6800000 0 0x800>;
>
> Should a region, <0 0xe6a00000 0 0x10000>, also be added
> here to describe the suggested space for descriptors?

There is no STBE (Stream Buffer for EthernetAVB-IF) on the r8a774a1, and th=
at's why this node doesn't come with such a region.

Thanks,
Fab

>
> Otherwise the patch looks good to me.
>
> > +interrupts =3D <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
> > +interrupt-names =3D "ch0", "ch1", "ch2", "ch3",
> > +  "ch4", "ch5", "ch6", "ch7",
> > +  "ch8", "ch9", "ch10", "ch11",
> > +  "ch12", "ch13", "ch14", "ch15",
> > +  "ch16", "ch17", "ch18", "ch19",
> > +  "ch20", "ch21", "ch22", "ch23",
> > +  "ch24";
> > +clocks =3D <&cpg CPG_MOD 812>;
> > +power-domains =3D <&sysc 32>;
> > +resets =3D <&cpg 812>;
> > +phy-mode =3D "rgmii";
> > +#address-cells =3D <1>;
> > +#size-cells =3D <0>;
> > +status =3D "disabled";
> > +};
> > +
> >  scif0: serial@e6e60000 {
> >  compatible =3D "renesas,scif-r8a774a1",
> >       "renesas,rcar-gen3-scif", "renesas,scif";
> > --
> > 2.7.4
> >



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
