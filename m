Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:34878 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728540AbeHMO0c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Aug 2018 10:26:32 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
CC: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: Initial r8a774a1 SoC device tree
Date: Mon, 13 Aug 2018 11:44:30 +0000
Message-ID: <TY1PR01MB1770F5E92353FD04FC49102AC0390@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1534146093-1651-1-git-send-email-biju.das@bp.renesas.com>
 <TY1PR01MB1770D16DDB50BF579ADF8335C0390@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <OSBPR01MB2103F339F8BB36042C8AD0E1B8390@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <TY1PR01MB1770CD5C853AA5E765961B11C0390@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <OSBPR01MB2103F387973ECD078290E060B8390@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2103F387973ECD078290E060B8390@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Biju,

> Subject: RE: [PATCH] arm64: dts: renesas: Initial r8a774a1 SoC device tre=
e
>
>
> Hello Fab,
>
> > > Subject: RE: [PATCH] arm64: dts: renesas: Initial r8a774a1 SoC device
> > > tree
> > >
> > > Hello Fabrizio,
> > >
> > > > Hello Biju,
> > > >
> > > > Thank you for your patch.
> > > >
> > > > > -----Original Message-----
> > > > > From: Biju Das <biju.das@bp.renesas.com>
> > > > > Sent: 13 August 2018 08:42
> > > > > To: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> > > > > <mark.rutland@arm.com>; Catalin Marinas
> > <catalin.marinas@arm.com>;
> > > > > Will Deacon <will.deacon@arm.com>
> > > > > Cc: Biju Das <biju.das@bp.renesas.com>; Simon Horman
> > > > > <horms@verge.net.au>; Magnus Damm <magnus.damm@gmail.com>;
> > > > > linux-renesas-soc@vger.kernel.org; devicetree@vger.kernel.org;
> > > > > linux-arm-kernel@lists.infradead.org; Geert Uytterhoeven
> > > > > <geert+renesas@glider.be>; Chris Paterson
> > > > > <Chris.Paterson2@renesas.com>; Fabrizio Castro
> > > > > <fabrizio.castro@bp.renesas.com>
> > > > > Subject: [PATCH] arm64: dts: renesas: Initial r8a774a1 SoC device
> > > > > tree
> > > > >
> > > > > Basic support for the RZ/G2M SoC.
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 192
> > > > > ++++++++++++++++++++++++++++++
> > > > >  1 file changed, 192 insertions(+)  create mode 100644
> > > > > arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > > > > b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > > > > new file mode 100644
> > > > > index 0000000..f3641c0
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > > > > @@ -0,0 +1,192 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > +/*
> > > > > + * Device Tree Source for the r8a774a1 SoC
> > > > > + *
> > > > > + * Copyright (C) 2018 Renesas Electronics Corp.
> > > > > + */
> > > > > +
> > > > > +#include <dt-bindings/interrupt-controller/irq.h>
> > > > > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > > +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> > > > > +
> > > > > +#define CPG_AUDIO_CLK_I10
> > > >
> > > > I believe there is no use case for this macro, therefore I think
> > > > this device tree can live without it.
> > > > With that fixed:
> > >
> > > This clock is SoC specific clock similar to R-Car Gen-3 H3/M3/M3N.
> > > Also the same clock is mentioned in Table  8.2b List of clocks of RZ/=
G2M
> > hardware manual. So I think it is ok.
> > >
> > >  If you think defining SoC specific clock is wrong in this file , we =
need to fix
> > other boards as well.
> >
> > I believe that macro is used on other platforms to provide a little bit=
 of
> > abstraction when defin ing the clocks of rcar_sound, therefore it's ok =
for the
> > other boards.
>
> May be I am missing something here. Can you please clarify the use case o=
f
> Other boards?

For example:
* r8a7796-salvator-xs.dts includes r8a7796.dtsi and salvator-xs.dtsi which =
in
   turn includes salvator-common.dtsi. CPG_AUDIO_CLK_I is defined in r8a779=
6.dtsi
   (with value R8A7796_CLK_S0D4, which translates to 11) and used in salvat=
or-common.dtsi
* r8a77965-salvator-xs.dts includes r8a77965.dtsi and salvator-xs.dtsi whic=
h in
   turn includes salvator-common.dtsi. CPG_AUDIO_CLK_I is defined in r8a779=
65.dtsi
   (with value 10) and used in salvator-common.dtsi

That is just an example, salvator-common.dtsi is included from salvator-x.d=
tsi as well,
and both salvator-xs.dtsi and salvator-x.dtsi are included by several board=
 specific
device trees.

My understanding is that the DT architecture for the Salvator family of boa=
rds
allows for maximum reuse of dtsi, macro CPG_AUDIO_CLK_I allows for SoC
specific definitions while having only one common version of salvator-commo=
n.dtsi
using the value.

So, with the Salvator family of boards they had the need for this, I am not=
 too
sure we are going to need the same thing here. For the time being we have n=
o use
case for it (as we are going to upstream the DT for only one board once we =
know more
about the HW design), that's why I think we shouldn't put this in. And mayb=
e add it
later on if the need arises. But as I said, it's just a macro and it's not =
going to hurt
anybody...

Cheers,
Fab

>
> > We could provide the same thing here, it's not going to hurt anybody, b=
ut at
> > the moment there is no reference design for this new SoC therefore ther=
e is
> > no use case for this, so maybe we could wait until we have a use case f=
or
> > this?
>
> > >
> > >
> > > > > +
> > > > > +/ {
> > > > > +compatible =3D "renesas,r8a774a1";
> > > > > +#address-cells =3D <2>;
> > > > > +#size-cells =3D <2>;
> > > > > +
> > > > > +/*
> > > > > + * The external audio clocks are configured as 0 Hz fixed freque=
ncy
> > > > > + * clocks by default.
> > > > > + * Boards that provide audio clocks should override them.
> > > > > + */
> > > > > +audio_clk_a: audio_clk_a {
> > > > > +compatible =3D "fixed-clock";
> > > > > +#clock-cells =3D <0>;
> > > > > +clock-frequency =3D <0>;
> > > > > +};
> > > > > +
> > > > > +audio_clk_b: audio_clk_b {
> > > > > +compatible =3D "fixed-clock";
> > > > > +#clock-cells =3D <0>;
> > > > > +clock-frequency =3D <0>;
> > > > > +};
> > > > > +
> > > > > +audio_clk_c: audio_clk_c {
> > > > > +compatible =3D "fixed-clock";
> > > > > +#clock-cells =3D <0>;
> > > > > +clock-frequency =3D <0>;
> > > > > +};
> > > > > +
> > > > > +/* External CAN clock - to be overridden by boards that provide =
it */
> > > > > +can_clk: can {
> > > > > +compatible =3D "fixed-clock";
> > > > > +#clock-cells =3D <0>;
> > > > > +clock-frequency =3D <0>;
> > > > > +};
> > > > > +
> > > > > +cpus {
> > > > > +#address-cells =3D <1>;
> > > > > +#size-cells =3D <0>;
> > > > > +
> > > > > +a57_0: cpu@0 {
> > > > > +compatible =3D "arm,cortex-a57", "arm,armv8";
> > > > > +reg =3D <0x0>;
> > > > > +device_type =3D "cpu";
> > > > > +power-domains =3D <&sysc 0>;
> > > > > +next-level-cache =3D <&L2_CA57>;
> > > > > +enable-method =3D "psci";
> > > > > +clocks =3D<&cpg CPG_CORE 0>;
> > > > > +};
> > > > > +
> > > > > +a57_1: cpu@1 {
> > > > > +compatible =3D "arm,cortex-a57", "arm,armv8";
> > > > > +reg =3D <0x1>;
> > > > > +device_type =3D "cpu";
> > > > > +power-domains =3D <&sysc 1>;
> > > > > +next-level-cache =3D <&L2_CA57>;
> > > > > +enable-method =3D "psci";
> > > > > +clocks =3D<&cpg CPG_CORE 0>;
> > > > > +};
> > > > > +
> > > > > +L2_CA57: cache-controller-0 {
> > > > > +compatible =3D "cache";
> > > > > +power-domains =3D <&sysc 12>;
> > > > > +cache-unified;
> > > > > +cache-level =3D <2>;
> > > > > +};
> > > > > +};
> > > > > +
> > > > > +extal_clk: extal {
> > > > > +compatible =3D "fixed-clock";
> > > > > +#clock-cells =3D <0>;
> > > > > +/* This value must be overridden by the board */
> > > > > +clock-frequency =3D <0>;
> > > > > +};
> > > > > +
> > > > > +extalr_clk: extalr {
> > > > > +compatible =3D "fixed-clock";
> > > > > +#clock-cells =3D <0>;
> > > > > +/* This value must be overridden by the board */
> > > > > +clock-frequency =3D <0>;
> > > > > +};
> > > > > +
> > > > > +/* External PCIe clock - can be overridden by the board */
> > > > > +pcie_bus_clk: pcie_bus {
> > > > > +compatible =3D "fixed-clock";
> > > > > +#clock-cells =3D <0>;
> > > > > +clock-frequency =3D <0>;
> > > > > +};
> > > > > +
> > > > > +pmu_a57 {
> > > > > +compatible =3D "arm,cortex-a57-pmu";
> > > > > +interrupts-extended =3D <&gic GIC_SPI 72
> > > > IRQ_TYPE_LEVEL_HIGH>,
> > > > > +      <&gic GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > > > > +interrupt-affinity =3D <&a57_0>, <&a57_1>;
> > > > > +};
> > > > > +
> > > > > +psci {
> > > > > +compatible =3D "arm,psci-1.0", "arm,psci-0.2";
> > > > > +method =3D "smc";
> > > > > +};
> > > > > +
> > > > > +/* External SCIF clock - to be overridden by boards that provide=
 it */
> > > > > +scif_clk: scif {
> > > > > +compatible =3D "fixed-clock";
> > > > > +#clock-cells =3D <0>;
> > > > > +clock-frequency =3D <0>;
> > > > > +};
> > > > > +
> > > > > +soc {
> > > > > +compatible =3D "simple-bus";
> > > > > +interrupt-parent =3D <&gic>;
> > > > > +#address-cells =3D <2>;
> > > > > +#size-cells =3D <2>;
> > > > > +ranges;
> > > > > +
> > > > > +cpg: clock-controller@e6150000 {
> > > > > +compatible =3D "renesas,r8a774a1-cpg-mssr";
> > > > > +reg =3D <0 0xe6150000 0 0x0bb0>;
> > > > > +clocks =3D <&extal_clk>, <&extalr_clk>;
> > > > > +clock-names =3D "extal", "extalr";
> > > > > +#clock-cells =3D <2>;
> > > > > +#power-domain-cells =3D <0>;
> > > > > +#reset-cells =3D <1>;
> > > > > +};
> > > > > +
> > > > > +rst: reset-controller@e6160000 {
> > > > > +compatible =3D "renesas,r8a774a1-rst";
> > > > > +reg =3D <0 0xe6160000 0 0x018c>;
> > > > > +};
> > > > > +
> > > > > +sysc: system-controller@e6180000 {
> > > > > +compatible =3D "renesas,r8a774a1-sysc";
> > > > > +reg =3D <0 0xe6180000 0 0x0400>;
> > > > > +#power-domain-cells =3D <1>;
> > > > > +};
> > > > > +
> > > > > +gic: interrupt-controller@f1010000 {
> > > > > +compatible =3D "arm,gic-400";
> > > > > +#interrupt-cells =3D <3>;
> > > > > +#address-cells =3D <0>;
> > > > > +interrupt-controller;
> > > > > +reg =3D <0x0 0xf1010000 0 0x1000>,
> > > > > +      <0x0 0xf1020000 0 0x20000>,
> > > > > +      <0x0 0xf1040000 0 0x20000>,
> > > > > +      <0x0 0xf1060000 0 0x20000>;
> > > > > +interrupts =3D <GIC_PPI 9
> > > > > +(GIC_CPU_MASK_SIMPLE(2) |
> > > > IRQ_TYPE_LEVEL_HIGH)>;
> > > > > +clocks =3D <&cpg CPG_MOD 408>;
> > > > > +clock-names =3D "clk";
> > > > > +power-domains =3D <&sysc 32>;
> > > > > +resets =3D <&cpg 408>;
> > > > > +};
> > > > > +
> > > > > +prr: chipid@fff00044 {
> > > > > +compatible =3D "renesas,prr";
> > > > > +reg =3D <0 0xfff00044 0 4>;
> > > > > +};
> > > > > +};
> > > > > +
> > > > > +timer {
> > > > > +compatible =3D "arm,armv8-timer";
> > > > > +interrupts-extended =3D <&gic GIC_PPI 13
> > > > (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> > > > > +      <&gic GIC_PPI 14
> > > > (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> > > > > +      <&gic GIC_PPI 11
> > > > (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> > > > > +      <&gic GIC_PPI 10
> > > > (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
> > > > > +};
> > > > > +
> > > > > +/* External USB clocks - can be overridden by the board */
> > > > > +usb3s0_clk: usb3s0 {
> > > > > +compatible =3D "fixed-clock";
> > > > > +#clock-cells =3D <0>;
> > > > > +clock-frequency =3D <0>;
> > > > > +};
> > > > > +
> > > > > +usb_extal_clk: usb_extal {
> > > > > +compatible =3D "fixed-clock";
> > > > > +#clock-cells =3D <0>;
> > > > > +clock-frequency =3D <0>;
> > > > > +};
> > > > > +};
> > > > > --
> > > > > 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
