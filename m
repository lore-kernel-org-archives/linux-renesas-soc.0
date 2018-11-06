Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-os2jpn01on0104.outbound.protection.outlook.com ([104.47.92.104]:33485
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726863AbeKFOqH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 09:46:07 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Marek Vasut <marek.vasut@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC: TAKESHI KIHARA <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] arm64: dts: r8a77990: ebisu: Add serial console pins
Date: Tue, 6 Nov 2018 05:22:35 +0000
Message-ID: <OSBPR01MB2293633CF9C7102B8251D261D8CB0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20181105213859.11408-1-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181105213859.11408-1-marek.vasut+renesas@gmail.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Marek-san,

> From: Marek Vasut, Sent: Tuesday, November 6, 2018 6:39 AM
>=20
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>=20
> This patch adds pin control for SCIF2 on R8A77990 E3 Ebisu.
>=20
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda


>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/=
boot/dts/renesas/r8a77990-ebisu.dts
> index f342dd85b152..611f0265fcc5 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -321,6 +321,11 @@
>  		function =3D "pwm5";
>  	};
>=20
> +	scif2_pins: scif2 {
> +		groups =3D "scif2_data_a";
> +		function =3D "scif2";
> +	};
> +
>  	usb0_pins: usb {
>  		groups =3D "usb0_b";
>  		function =3D "usb0";
> @@ -352,6 +357,9 @@
>  };
>=20
>  &scif2 {
> +	pinctrl-0 =3D <&scif2_pins>;
> +	pinctrl-names =3D "default";
> +
>  	status =3D "okay";
>  };
>=20
> --
> 2.18.0
