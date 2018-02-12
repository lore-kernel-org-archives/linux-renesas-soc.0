Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:36697 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753728AbeBLRyS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Feb 2018 12:54:18 -0500
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
Subject: RE: [PATCH/RFC 08/11] ARM: dts: wheat: Enable watchdog support
Date: Mon, 12 Feb 2018 17:54:15 +0000
Message-ID: <TY1PR06MB0895BE5BAC30FEB82BCE386BC0F70@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1518086057-19448-1-git-send-email-geert+renesas@glider.be>
 <1518086057-19448-9-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1518086057-19448-9-git-send-email-geert+renesas@glider.be>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> Subject: [PATCH/RFC 08/11] ARM: dts: wheat: Enable watchdog support
>
> Enable the watchdog, so the board can be restarted by a watchdog
> timeout.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
>  arch/arm/boot/dts/r8a7792-wheat.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a7792-wheat.dts b/arch/arm/boot/dts/r8a7=
792-wheat.dts
> index b9471b67b72829de..293b9e3b3e70d7b8 100644
> --- a/arch/arm/boot/dts/r8a7792-wheat.dts
> +++ b/arch/arm/boot/dts/r8a7792-wheat.dts
> @@ -168,6 +168,11 @@
>  };
>  };
>
> +&rwdt {
> +timeout-sec =3D <60>;
> +status =3D "okay";
> +};
> +
>  &scif0 {
>  pinctrl-0 =3D <&scif0_pins>;
>  pinctrl-names =3D "default";
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
