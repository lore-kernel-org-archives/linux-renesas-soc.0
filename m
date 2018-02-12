Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:37089 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751109AbeBLRzO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Feb 2018 12:55:14 -0500
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
Subject: RE: [PATCH/RFC 10/11] ARM: dts: alt: Enable watchdog support
Date: Mon, 12 Feb 2018 17:55:11 +0000
Message-ID: <TY1PR06MB0895B21EAD78244F4F1C0DCDC0F70@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1518086057-19448-1-git-send-email-geert+renesas@glider.be>
 <1518086057-19448-11-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1518086057-19448-11-git-send-email-geert+renesas@glider.be>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> Subject: [PATCH/RFC 10/11] ARM: dts: alt: Enable watchdog support
>
> Enable the watchdog, so the board can be restarted by a watchdog
> timeout.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
>  arch/arm/boot/dts/r8a7794-alt.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a7794-alt.dts b/arch/arm/boot/dts/r8a779=
4-alt.dts
> index 60c6515c499660eb..fdc4a311648dc30d 100644
> --- a/arch/arm/boot/dts/r8a7794-alt.dts
> +++ b/arch/arm/boot/dts/r8a7794-alt.dts
> @@ -295,6 +295,11 @@
>  status =3D "okay";
>  };
>
> +&rwdt {
> +timeout-sec =3D <60>;
> +status =3D "okay";
> +};
> +
>  &sdhi0 {
>  pinctrl-0 =3D <&sdhi0_pins>;
>  pinctrl-1 =3D <&sdhi0_pins_uhs>;
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
