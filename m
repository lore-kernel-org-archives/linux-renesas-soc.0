Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:44434 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752529AbdHIJXL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Aug 2017 05:23:11 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>
CC: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH  2/2] ARM: dts: r8a7743: Add I2C DT support
Date: Wed, 9 Aug 2017 09:23:05 +0000
Message-ID: <KL1PR06MB17020664F5636F87F9F97597B88B0@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1502191449-16118-1-git-send-email-biju.das@bp.renesas.com>
 <20170809085238.GJ2705@verge.net.au>
In-Reply-To: <20170809085238.GJ2705@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



> -----Original Message-----
> From: Simon Horman [mailto:horms@verge.net.au]
> Sent: 09 August 2017 09:53
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>; Wolfram Sang <wsa@the-dreams.de>; Magnus
> Damm <magnus.damm@gmail.com>; Russell King <linux@armlinux.org.uk>;
> Chris Paterson <Chris.Paterson2@renesas.com>; devicetree@vger.kernel.org;
> linux-renesas-soc@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH 2/2] ARM: dts: r8a7743: Add I2C DT support
>
> On Tue, Aug 08, 2017 at 12:24:09PM +0100, Biju Das wrote:
> > Add the I2C[0-5] devices to the r8a7743 device tree.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> > This patch has been tested against Linux-next tag 20170727 and renesas-=
dev
> branch.
> > This patch depends on
> > https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg1700
> > 8.html
>
> As per the patch at the link above it seems that these patches are target=
ed at
> the renesas tree.  The best practice in that case is to base patches on t=
he latest
> devel branch. Please consider doing so in future.
>
> I would also slightly prefer if dependencies were referenced by name, in =
this
> case:
>
> *  [PATCH 2/3] ARM: dts: r8a7743: Add APMU node and second CPU core
>
> or
>
> * [PATCH  0/3] Add SMP support
>
> Also including a link is fine by me.
>
>
> It would also be useful if you described the dependency as a conflict (me=
rge-
> time), compile-time or run-time.


Thanks Simon. I will take care this next time.

> As for the patch itself, it looks good to me.
>
> >  arch/arm/boot/dts/r8a7743.dtsi | 97
> > ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 97 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/r8a7743.dtsi
> > b/arch/arm/boot/dts/r8a7743.dtsi index 8c46f62..14222c72 100644
> > --- a/arch/arm/boot/dts/r8a7743.dtsi
> > +++ b/arch/arm/boot/dts/r8a7743.dtsi
> > @@ -18,6 +18,15 @@
> >  #address-cells =3D <2>;
> >  #size-cells =3D <2>;
> >
> > +aliases {
> > +i2c0 =3D &i2c0;
> > +i2c1 =3D &i2c1;
> > +i2c2 =3D &i2c2;
> > +i2c3 =3D &i2c3;
> > +i2c4 =3D &i2c4;
> > +i2c5 =3D &i2c5;
> > +};
> > +
> >  cpus {
> >  #address-cells =3D <1>;
> >  #size-cells =3D <0>;
> > @@ -339,6 +348,94 @@
> >  dma-channels =3D <15>;
> >  };
> >
> > +/* The memory map in the User's Manual maps the cores to
> bus
> > + *  numbers
> > + */
> > +i2c0: i2c@e6508000 {
> > +#address-cells =3D <1>;
> > +#size-cells =3D <0>;
> > +compatible =3D "renesas,i2c-r8a7743",
> > +     "renesas,rcar-gen2-i2c";
> > +reg =3D <0 0xe6508000 0 0x40>;
> > +interrupts =3D <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
> > +clocks =3D <&cpg CPG_MOD 931>;
> > +power-domains =3D <&sysc R8A7743_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 931>;
> > +i2c-scl-internal-delay-ns =3D <6>;
> > +status =3D "disabled";
> > +};
> > +
> > +i2c1: i2c@e6518000 {
> > +#address-cells =3D <1>;
> > +#size-cells =3D <0>;
> > +compatible =3D "renesas,i2c-r8a7743",
> > +     "renesas,rcar-gen2-i2c";
> > +reg =3D <0 0xe6518000 0 0x40>;
> > +interrupts =3D <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
> > +clocks =3D <&cpg CPG_MOD 930>;
> > +power-domains =3D <&sysc R8A7743_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 930>;
> > +i2c-scl-internal-delay-ns =3D <6>;
> > +status =3D "disabled";
> > +};
> > +
> > +i2c2: i2c@e6530000 {
> > +#address-cells =3D <1>;
> > +#size-cells =3D <0>;
> > +compatible =3D "renesas,i2c-r8a7743",
> > +     "renesas,rcar-gen2-i2c";
> > +reg =3D <0 0xe6530000 0 0x40>;
> > +interrupts =3D <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
> > +clocks =3D <&cpg CPG_MOD 929>;
> > +power-domains =3D <&sysc R8A7743_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 929>;
> > +i2c-scl-internal-delay-ns =3D <6>;
> > +status =3D "disabled";
> > +};
> > +
> > +i2c3: i2c@e6540000 {
> > +#address-cells =3D <1>;
> > +#size-cells =3D <0>;
> > +compatible =3D "renesas,i2c-r8a7743",
> > +     "renesas,rcar-gen2-i2c";
> > +reg =3D <0 0xe6540000 0 0x40>;
> > +interrupts =3D <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
> > +clocks =3D <&cpg CPG_MOD 928>;
> > +power-domains =3D <&sysc R8A7743_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 928>;
> > +i2c-scl-internal-delay-ns =3D <6>;
> > +status =3D "disabled";
> > +};
> > +
> > +i2c4: i2c@e6520000 {
> > +#address-cells =3D <1>;
> > +#size-cells =3D <0>;
> > +compatible =3D "renesas,i2c-r8a7743",
> > +     "renesas,rcar-gen2-i2c";
> > +reg =3D <0 0xe6520000 0 0x40>;
> > +interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> > +clocks =3D <&cpg CPG_MOD 927>;
> > +power-domains =3D <&sysc R8A7743_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 927>;
> > +i2c-scl-internal-delay-ns =3D <6>;
> > +status =3D "disabled";
> > +};
> > +
> > +i2c5: i2c@e6528000 {
> > +/* doesn't need pinmux */
> > +#address-cells =3D <1>;
> > +#size-cells =3D <0>;
> > +compatible =3D "renesas,i2c-r8a7743",
> > +     "renesas,rcar-gen2-i2c";
> > +reg =3D <0 0xe6528000 0 0x40>;
> > +interrupts =3D <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> > +clocks =3D <&cpg CPG_MOD 925>;
> > +power-domains =3D <&sysc R8A7743_PD_ALWAYS_ON>;
> > +resets =3D <&cpg 925>;
> > +i2c-scl-internal-delay-ns =3D <110>;
> > +status =3D "disabled";
> > +};
> > +
> >  scifa0: serial@e6c40000 {
> >  compatible =3D "renesas,scifa-r8a7743",
> >       "renesas,rcar-gen2-scifa", "renesas,scifa";
> > --
> > 1.9.1
> >



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
