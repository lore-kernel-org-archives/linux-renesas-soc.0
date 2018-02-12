Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:65416 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752564AbeBLRxR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Feb 2018 12:53:17 -0500
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
Subject: RE: [PATCH/RFC 06/11] ARM: dts: porter: Enable watchdog support
Date: Mon, 12 Feb 2018 17:53:14 +0000
Message-ID: <TY1PR06MB0895CCCD24E15BDFCFA4821FC0F70@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1518086057-19448-1-git-send-email-geert+renesas@glider.be>
 <1518086057-19448-7-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1518086057-19448-7-git-send-email-geert+renesas@glider.be>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> Subject: [PATCH/RFC 06/11] ARM: dts: porter: Enable watchdog support
>
> Enable the watchdog, so the board can be restarted by a watchdog
> timeout.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
>  arch/arm/boot/dts/r8a7791-porter.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a7791-porter.dts b/arch/arm/boot/dts/r8a=
7791-porter.dts
> index 9a02d03b23c2b7e9..7d06fb24bcdf2fee 100644
> --- a/arch/arm/boot/dts/r8a7791-porter.dts
> +++ b/arch/arm/boot/dts/r8a7791-porter.dts
> @@ -449,6 +449,11 @@
>  };
>  };
>
> +&rwdt {
> +timeout-sec =3D <60>;
> +status =3D "okay";
> +};
> +
>  &ssi1 {
>  shared-pin;
>  };
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
