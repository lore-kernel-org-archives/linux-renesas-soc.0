Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:25161 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932710AbcKHMRH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Nov 2016 07:17:07 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
CC: Shinobu Uehara <shinobu.uehara.xc@renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] ARM: dts: r8a7794: Correct hsusb parent clock
Date: Tue, 8 Nov 2016 12:16:17 +0000
Message-ID: <HK2PR06MB0548F5A24A6C6BBB7BB4C024D8A60@HK2PR06MB0548.apcprd06.prod.outlook.com>
References: <1478545627-32280-1-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1478545627-32280-1-git-send-email-geert+renesas@glider.be>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert-san,

> -----Original Message-----
> From: Geert Uytterhoeven
> Sent: Tuesday, November 08, 2016 4:07 AM
>=20
> The parent clock of the HSUSB clock is the HP clock, not the MP clock.
>=20
> Fixes: c7bab9f929e51761 ("ARM: shmobile: r8a7794: Add USB clocks to devic=
e tree")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch.

Acked-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> ---
>  arch/arm/boot/dts/r8a7794.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.d=
tsi
> index 01816ac775a8d177..7d9f0601d3ca8def 100644
> --- a/arch/arm/boot/dts/r8a7794.dtsi
> +++ b/arch/arm/boot/dts/r8a7794.dtsi
> @@ -1262,7 +1262,7 @@
>  		mstp7_clks: mstp7_clks@e615014c {
>  			compatible =3D "renesas,r8a7794-mstp-clocks", "renesas,cpg-mstp-clock=
s";
>  			reg =3D <0 0xe615014c 0 4>, <0 0xe61501c4 0 4>;
> -			clocks =3D <&mp_clk>, <&mp_clk>,
> +			clocks =3D <&mp_clk>, <&hp_clk>,
>  				 <&zs_clk>, <&p_clk>, <&p_clk>, <&zs_clk>,
>  				 <&zs_clk>, <&p_clk>, <&p_clk>, <&p_clk>, <&p_clk>,
>  				 <&zx_clk>;
> --
> 1.9.1
