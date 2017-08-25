Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:35039 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754948AbdHYI0n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Aug 2017 04:26:43 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>
CC: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH resend] ARM: dts: r8a7745: Add Ethernet AVB support
Date: Fri, 25 Aug 2017 08:26:38 +0000
Message-ID: <KL1PR06MB1702901A223C3FE2030DA79BB89B0@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1503388405-48325-1-git-send-email-biju.das@bp.renesas.com>
 <1503582359-43820-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1503582359-43820-1-git-send-email-biju.das@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi all,

> -----Original Message-----
> From: Biju Das [mailto:biju.das@bp.renesas.com]
> Sent: 24 August 2017 14:46
> To: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>
> Cc: Simon Horman <horms@verge.net.au>; Magnus Damm
> <magnus.damm@gmail.com>; Russell King <linux@armlinux.org.uk>; Chris
> Paterson <Chris.Paterson2@renesas.com>; devicetree@vger.kernel.org; linux=
-
> renesas-soc@vger.kernel.org; linux-arm-kernel@lists.infradead.org; Biju D=
as
> <biju.das@bp.renesas.com>
> Subject: [PATCH resend] ARM: dts: r8a7745: Add Ethernet AVB support
>
> Add Ethernet AVB support for r8a7745 SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> It is applying cleanly on renesas-devel branch tag renesas-devel-20170824=
-
> v4.13-rc6.
>
> It is tested against renesas-devel branch tag renesas-devel-20170824-v4.1=
3-rc6.
>
>  arch/arm/boot/dts/r8a7745.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.d=
tsi
> index 7fd2967..c34f88e 100644
> --- a/arch/arm/boot/dts/r8a7745.dtsi
> +++ b/arch/arm/boot/dts/r8a7745.dtsi
> @@ -707,6 +707,19 @@
>  status =3D "disabled";
>  };
>
> +avb: ethernet@e6800000 {
> +compatible =3D "renesas,etheravb-r8a7745",
> +     "renesas,etheravb-rcar-gen2";
> +reg =3D <0 0xe6800000 0 0x800>, <0 0xee0e8000 0
> 0x4000>;
> +interrupts =3D <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
> +clocks =3D <&cpg CPG_MOD 812>;
> +power-domains =3D <&sysc R8A7745_PD_ALWAYS_ON>;
> +resets =3D <&cpg 812>;
> +#address-cells =3D <1>;
> +#size-cells =3D <0>;
> +status =3D "disabled";
> +};
> +

Hmmm. Just observed that positioning of avb node is not correct compared to=
 the similar r8a7794 SoC(R-Car E2).
I will send a new patch for correcting this.

>  mmcif0: mmc@ee200000 {
>  compatible =3D "renesas,mmcif-r8a7745",
>       "renesas,sh-mmcif";
> --
> 1.9.1




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
