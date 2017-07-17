Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:59036 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751332AbdGQMot (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2017 08:44:49 -0400
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] ARM: dts: iwg20m: Correct indentation of mmcif0
 properties
Date: Mon, 17 Jul 2017 12:44:45 +0000
Message-ID: <TY1PR06MB0702A521EE7AA82295A9799DB7A00@TY1PR06MB0702.apcprd06.prod.outlook.com>
References: <1500293197-14785-1-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1500293197-14785-1-git-send-email-geert+renesas@glider.be>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Geert,

> From: Geert Uytterhoeven [mailto:geert+renesas@glider.be]
> Sent: 17 July 2017 13:07
>=20
> Fixes: 4658c4b789d8e2ae ("ARM: dts: iwg20m: Add MMCIF0 support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for this, I'm not sure how we all missed it before!

Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

Kind regards, Chris

> ---
>  arch/arm/boot/dts/r8a7743-iwg20m.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
> b/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
> index f78dbc542a824f40..ff799381863763de 100644
> --- a/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
> +++ b/arch/arm/boot/dts/r8a7743-iwg20m.dtsi
> @@ -45,11 +45,11 @@
>  };
>=20
>  &mmcif0 {
> -		pinctrl-0 =3D <&mmcif0_pins>;
> -		pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmcif0_pins>;
> +	pinctrl-names =3D "default";
>=20
> -		vmmc-supply =3D <&reg_3p3v>;
> -		bus-width =3D <8>;
> -		non-removable;
> -		status =3D "okay";
> +	vmmc-supply =3D <&reg_3p3v>;
> +	bus-width =3D <8>;
> +	non-removable;
> +	status =3D "okay";
>  };
> --
> 2.7.4
