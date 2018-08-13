Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:14946 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728352AbeHMMTv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Aug 2018 08:19:51 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
CC: Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: Initial r8a774a1 SoC device tree
Date: Mon, 13 Aug 2018 09:38:16 +0000
Message-ID: <TY1PR01MB1770D16DDB50BF579ADF8335C0390@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1534146093-1651-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1534146093-1651-1-git-send-email-biju.das@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Biju,

Thank you for your patch.

> -----Original Message-----
> From: Biju Das <biju.das@bp.renesas.com>
> Sent: 13 August 2018 08:42
> To: Rob Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>=
; Catalin Marinas <catalin.marinas@arm.com>; Will
> Deacon <will.deacon@arm.com>
> Cc: Biju Das <biju.das@bp.renesas.com>; Simon Horman <horms@verge.net.au>=
; Magnus Damm <magnus.damm@gmail.com>;
> linux-renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-=
kernel@lists.infradead.org; Geert Uytterhoeven
> <geert+renesas@glider.be>; Chris Paterson <Chris.Paterson2@renesas.com>; =
Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Subject: [PATCH] arm64: dts: renesas: Initial r8a774a1 SoC device tree
>
> Basic support for the RZ/G2M SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 192 ++++++++++++++++++++++++=
++++++
>  1 file changed, 192 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1.dtsi
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/=
dts/renesas/r8a774a1.dtsi
> new file mode 100644
> index 0000000..f3641c0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> @@ -0,0 +1,192 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the r8a774a1 SoC
> + *
> + * Copyright (C) 2018 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +#define CPG_AUDIO_CLK_I10

I believe there is no use case for this macro, therefore I think this devic=
e tree can live without it.
With that fixed:

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks,
Fab

> +
> +/ {
> +compatible =3D "renesas,r8a774a1";
> +#address-cells =3D <2>;
> +#size-cells =3D <2>;
> +
> +/*
> + * The external audio clocks are configured as 0 Hz fixed frequency
> + * clocks by default.
> + * Boards that provide audio clocks should override them.
> + */
> +audio_clk_a: audio_clk_a {
> +compatible =3D "fixed-clock";
> +#clock-cells =3D <0>;
> +clock-frequency =3D <0>;
> +};
> +
> +audio_clk_b: audio_clk_b {
> +compatible =3D "fixed-clock";
> +#clock-cells =3D <0>;
> +clock-frequency =3D <0>;
> +};
> +
> +audio_clk_c: audio_clk_c {
> +compatible =3D "fixed-clock";
> +#clock-cells =3D <0>;
> +clock-frequency =3D <0>;
> +};
> +
> +/* External CAN clock - to be overridden by boards that provide it */
> +can_clk: can {
> +compatible =3D "fixed-clock";
> +#clock-cells =3D <0>;
> +clock-frequency =3D <0>;
> +};
> +
> +cpus {
> +#address-cells =3D <1>;
> +#size-cells =3D <0>;
> +
> +a57_0: cpu@0 {
> +compatible =3D "arm,cortex-a57", "arm,armv8";
> +reg =3D <0x0>;
> +device_type =3D "cpu";
> +power-domains =3D <&sysc 0>;
> +next-level-cache =3D <&L2_CA57>;
> +enable-method =3D "psci";
> +clocks =3D<&cpg CPG_CORE 0>;
> +};
> +
> +a57_1: cpu@1 {
> +compatible =3D "arm,cortex-a57", "arm,armv8";
> +reg =3D <0x1>;
> +device_type =3D "cpu";
> +power-domains =3D <&sysc 1>;
> +next-level-cache =3D <&L2_CA57>;
> +enable-method =3D "psci";
> +clocks =3D<&cpg CPG_CORE 0>;
> +};
> +
> +L2_CA57: cache-controller-0 {
> +compatible =3D "cache";
> +power-domains =3D <&sysc 12>;
> +cache-unified;
> +cache-level =3D <2>;
> +};
> +};
> +
> +extal_clk: extal {
> +compatible =3D "fixed-clock";
> +#clock-cells =3D <0>;
> +/* This value must be overridden by the board */
> +clock-frequency =3D <0>;
> +};
> +
> +extalr_clk: extalr {
> +compatible =3D "fixed-clock";
> +#clock-cells =3D <0>;
> +/* This value must be overridden by the board */
> +clock-frequency =3D <0>;
> +};
> +
> +/* External PCIe clock - can be overridden by the board */
> +pcie_bus_clk: pcie_bus {
> +compatible =3D "fixed-clock";
> +#clock-cells =3D <0>;
> +clock-frequency =3D <0>;
> +};
> +
> +pmu_a57 {
> +compatible =3D "arm,cortex-a57-pmu";
> +interrupts-extended =3D <&gic GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
> +      <&gic GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +interrupt-affinity =3D <&a57_0>, <&a57_1>;
> +};
> +
> +psci {
> +compatible =3D "arm,psci-1.0", "arm,psci-0.2";
> +method =3D "smc";
> +};
> +
> +/* External SCIF clock - to be overridden by boards that provide it */
> +scif_clk: scif {
> +compatible =3D "fixed-clock";
> +#clock-cells =3D <0>;
> +clock-frequency =3D <0>;
> +};
> +
> +soc {
> +compatible =3D "simple-bus";
> +interrupt-parent =3D <&gic>;
> +#address-cells =3D <2>;
> +#size-cells =3D <2>;
> +ranges;
> +
> +cpg: clock-controller@e6150000 {
> +compatible =3D "renesas,r8a774a1-cpg-mssr";
> +reg =3D <0 0xe6150000 0 0x0bb0>;
> +clocks =3D <&extal_clk>, <&extalr_clk>;
> +clock-names =3D "extal", "extalr";
> +#clock-cells =3D <2>;
> +#power-domain-cells =3D <0>;
> +#reset-cells =3D <1>;
> +};
> +
> +rst: reset-controller@e6160000 {
> +compatible =3D "renesas,r8a774a1-rst";
> +reg =3D <0 0xe6160000 0 0x018c>;
> +};
> +
> +sysc: system-controller@e6180000 {
> +compatible =3D "renesas,r8a774a1-sysc";
> +reg =3D <0 0xe6180000 0 0x0400>;
> +#power-domain-cells =3D <1>;
> +};
> +
> +gic: interrupt-controller@f1010000 {
> +compatible =3D "arm,gic-400";
> +#interrupt-cells =3D <3>;
> +#address-cells =3D <0>;
> +interrupt-controller;
> +reg =3D <0x0 0xf1010000 0 0x1000>,
> +      <0x0 0xf1020000 0 0x20000>,
> +      <0x0 0xf1040000 0 0x20000>,
> +      <0x0 0xf1060000 0 0x20000>;
> +interrupts =3D <GIC_PPI 9
> +(GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
> +clocks =3D <&cpg CPG_MOD 408>;
> +clock-names =3D "clk";
> +power-domains =3D <&sysc 32>;
> +resets =3D <&cpg 408>;
> +};
> +
> +prr: chipid@fff00044 {
> +compatible =3D "renesas,prr";
> +reg =3D <0 0xfff00044 0 4>;
> +};
> +};
> +
> +timer {
> +compatible =3D "arm,armv8-timer";
> +interrupts-extended =3D <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_T=
YPE_LEVEL_LOW)>,
> +      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
> +};
> +
> +/* External USB clocks - can be overridden by the board */
> +usb3s0_clk: usb3s0 {
> +compatible =3D "fixed-clock";
> +#clock-cells =3D <0>;
> +clock-frequency =3D <0>;
> +};
> +
> +usb_extal_clk: usb_extal {
> +compatible =3D "fixed-clock";
> +#clock-cells =3D <0>;
> +clock-frequency =3D <0>;
> +};
> +};
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
