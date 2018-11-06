Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-os2jpn01on0120.outbound.protection.outlook.com ([104.47.92.120]:6368
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726263AbeKFOwt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 09:52:49 -0500
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
Subject: RE: [PATCH 2/2] arm64: dts: r8a77990: ebisu: Enable SDHI interfaces
Date: Tue, 6 Nov 2018 05:29:15 +0000
Message-ID: <OSBPR01MB2293D944698EE5776B23B00DD8CB0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20181105214117.11734-1-marek.vasut+renesas@gmail.com>
 <20181105214117.11734-2-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181105214117.11734-2-marek.vasut+renesas@gmail.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Marek-san,

> From: Marek Vasut, Sent: Tuesday, November 6, 2018 6:41 AM
>=20
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>=20
> This patch enables SD card slot connected to SDHI0, micro SD card slot
> connected to SDHI1 and eMMC connected to SDHI3 on the Ebisu board using
> the R8A77990 SoC.
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

I have a few nit comments below.

>  .../arm64/boot/dts/renesas/r8a77990-ebisu.dts | 136 ++++++++++++++++++
>  1 file changed, 136 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/=
boot/dts/renesas/r8a77990-ebisu.dts
> index 611f0265fcc5..bda1765dcdbd 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
<snip>
> +	sdhi3_pins: sd3 {
> +		groups =3D "sdhi3_data8", "sdhi3_ctrl";
> +		function =3D "sdhi3";
> +		power-source =3D <1800>;
> +	};
> +
> +	sdhi3_pins_uhs: sd3_uhs {
> +		groups =3D "sdhi3_data8", "sdhi3_ctrl";
> +		function =3D "sdhi3";
> +		power-source =3D <1800>;
> +	};

I assumed that we will add "sdhi3_ds" into these groups when we add support=
 for HS400 mode.

Best regards,
Yoshihiro Shimoda
