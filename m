Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:64440 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751109AbeBLRwG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Feb 2018 12:52:06 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "Ramesh Shanmugasundaram" <ramesh.shanmugasundaram@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFC 03/11] ARM: dts: r8a7793: Add RWDT node
Date: Mon, 12 Feb 2018 17:52:02 +0000
Message-ID: <TY1PR06MB0895CD1D7318602AC9F9F04BC0F70@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1518086057-19448-1-git-send-email-geert+renesas@glider.be>
 <1518086057-19448-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1518086057-19448-4-git-send-email-geert+renesas@glider.be>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> Subject: [PATCH/RFC 03/11] ARM: dts: r8a7793: Add RWDT node
>
> Add a device node for the Watchdog Timer (WDT) controller on the Renesas
> R-Car M2-N (r8a7793) SoC.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
>  arch/arm/boot/dts/r8a7793.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.d=
tsi
> index f0e0415682f89440..5a06ad1788b27ff1 100644
> --- a/arch/arm/boot/dts/r8a7793.dtsi
> +++ b/arch/arm/boot/dts/r8a7793.dtsi
> @@ -126,6 +126,16 @@
>  #size-cells =3D <2>;
>  ranges;
>
> +rwdt: watchdog@e6020000 {
> +compatible =3D "renesas,r8a7793-wdt",
> +     "renesas,rcar-gen2-wdt";
> +reg =3D <0 0xe6020000 0 0x0c>;
> +clocks =3D <&cpg CPG_MOD 402>;
> +power-domains =3D <&sysc R8A7793_PD_ALWAYS_ON>;
> +resets =3D <&cpg 402>;
> +status =3D "disabled";
> +};
> +
>  gpio0: gpio@e6050000 {
>  compatible =3D "renesas,gpio-r8a7793",
>       "renesas,rcar-gen2-gpio";
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
