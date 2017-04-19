Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:41802 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1760355AbdDSH1L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Apr 2017 03:27:11 -0400
Date: Wed, 19 Apr 2017 09:27:09 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH/RFT v2] ARM: dts: silk: Enable UHS-I SDR-50
Message-ID: <20170419072709.5kerc7y4437to2d3@ninjato>
References: <1492500887-20084-1-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="t6i3sla5a6zp6b2a"
Content-Disposition: inline
In-Reply-To: <1492500887-20084-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--t6i3sla5a6zp6b2a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2017 at 04:34:47PM +0900, Simon Horman wrote:
> Add the "1v8" pinctrl state and sd-uhs-sdr50 property to SDHI1.
>=20
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> * Compile tested only; no access to silk board
> ---
>  arch/arm/boot/dts/r8a7794-silk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/r8a7794-silk.dts b/arch/arm/boot/dts/r8a77=
94-silk.dts
> index 4cb5278d104d..bb0c41c2f3ac 100644
> --- a/arch/arm/boot/dts/r8a7794-silk.dts
> +++ b/arch/arm/boot/dts/r8a7794-silk.dts
> @@ -196,6 +196,13 @@
>  	sdhi1_pins: sd1 {
>  		groups =3D "sdhi1_data4", "sdhi1_ctrl";
>  		function =3D "sdhi1";
> +		power-source =3D <3300>;
> +	};
> +
> +	sdhi1_pins_uhs: sd1_uhs {
> +		groups =3D "sdhi1_data4", "sdhi1_ctrl";
> +		function =3D "sdhi1";
> +		power-source =3D <1800>;
>  	};
> =20
>  	qspi_pins: qspi {
> @@ -343,6 +350,7 @@

No "pinctrl-1" for the uhs state?

>  	vmmc-supply =3D <&vcc_sdhi1>;
>  	vqmmc-supply =3D <&vccq_sdhi1>;
>  	cd-gpios =3D <&gpio6 14 GPIO_ACTIVE_LOW>;
> +	sd-uhs-sdr50;
>  	status =3D "okay";
>  };
> =20
> --=20
> 2.7.0.rc3.207.g0ac5344

--t6i3sla5a6zp6b2a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlj3EU0ACgkQFA3kzBSg
KbYRZg//YUHmumsK/xL03KOZuKvU46AVGfFimA/ZTOuWjkNvHPUjZFtzd4CKcSag
tvJT3u5GZ53FfXi2SLiwuQooHgs/AhfgahpedFGrwTqbSIwAiQ2+ljedIKW12ImW
49OoEABZUIxYdGcuzBnwSE6IlIYIc5gNGXcG7J9mY4ggv4eXtm+LBDF89iD3RvYW
KDB91YxW5mmXASxxuirnC6U96rVFMnUTAUZwBwyEo0Oj1uBGnSWwKirIfPojH8O3
r6hjnLRAUgOhzUyhKgCnAmI51uJriYRwy8cU9rjSDf2J8T9w9EZuHjKL75AqpbYc
kUKvfs5WHBxIlle9q5ZLcVc3xYSRWKGAdzV4mlyXAQOLqQxZcldVHyIMW2ywi6Ll
AMkYovE4Uawsl+mTYrvynN35Jy2NqOIdZi9sV3ORX+V2YLynYHNEtfO2gdhBMCEG
zXqP6TJDdbkT4Z4HJUuGPjub04/hGaWQUtYbqxb3L3kSNd1aNhQIg7Bh4WpyQnua
nbzHs3tyQEjtUVednzLnVZUI1fSZBw3rS48LrK/KcIBWh9sgKm/TNunHd5fZaSfO
aRycDgMsQwu+g9FI77ylQJ+wutR+YEVRBEpctzGYqCfiUGjEk1oU/vZaebt4lin2
7edh9O7/J34tr7dCsxWREZmtMByhtbJkK5FbknoAoDzVw0uS4fA=
=7+Av
-----END PGP SIGNATURE-----

--t6i3sla5a6zp6b2a--
