Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:50288 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750801AbeCFIx0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Mar 2018 03:53:26 -0500
Date: Tue, 6 Mar 2018 09:53:24 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH] mmc: renesas_sdhi: fix WP detection
Message-ID: <20180306085324.5ytcycgerd4ol4o6@katana>
References: <20180305204842.25391-1-wsa+renesas@sang-engineering.com>
 <CAK7LNATZ8vnKUeCW1aN5yGMLu0kGXwv3tYmxeGFTiYR9YSqU6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7grjjjsij2dvqxju"
Content-Disposition: inline
In-Reply-To: <CAK7LNATZ8vnKUeCW1aN5yGMLu0kGXwv3tYmxeGFTiYR9YSqU6A@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--7grjjjsij2dvqxju
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 06, 2018 at 12:48:19PM +0900, Masahiro Yamada wrote:
> 2018-03-06 5:48 GMT+09:00 Wolfram Sang <wsa+renesas@sang-engineering.com>:
> > Commit "mmc: renesas_sdhi: use MMC_CAP2_NO_WRITE_PROTECT instead of
> > TMIO own flag" activated MMC_CAP2_NO_WRITE_PROTECT for Renesas SDHI
> > which incorrectly disabled WP altogether instead of only disabling the
> > internal mechanism.
>=20
>=20
> I am not opposed to this patch,
> but I have a question.
>=20
> Is this is a real problem in the upstream kernel?

Not upstream, but mmc/next. The patch I mentioned in the above commit
message is in mmc/next only. Yes, it is a real problem. As I said below,
"more testing revealed this" on Gen3, at least.

> (If so, how do renesas boards set-up WP GPIOs?)

Quite the standard way, I'd think:

$ grep 'wp-gpios' arch/arm64/boot/dts/renesas/*
arch/arm64/boot/dts/renesas/salvator-common.dtsi:	wp-gpios =3D <&gpio3 13 G=
PIO_ACTIVE_HIGH>;
arch/arm64/boot/dts/renesas/salvator-common.dtsi:	wp-gpios =3D <&gpio4 16 G=
PIO_ACTIVE_HIGH>;

$ grep 'wp-gpios' arch/arm/boot/dts/r8a*
arch/arm/boot/dts/r8a7778-bockw.dts:	wp-gpios =3D <&gpio3 18 GPIO_ACTIVE_HI=
GH>;
arch/arm/boot/dts/r8a7791-koelsch.dts:	wp-gpios =3D <&gpio6 7 GPIO_ACTIVE_H=
IGH>;
arch/arm/boot/dts/r8a7791-koelsch.dts:	wp-gpios =3D <&gpio6 15 GPIO_ACTIVE_=
HIGH>;
arch/arm/boot/dts/r8a7791-porter.dts:	wp-gpios =3D <&gpio6 7 GPIO_ACTIVE_HI=
GH>;
arch/arm/boot/dts/r8a7793-gose.dts:	wp-gpios =3D <&gpio6 7 GPIO_ACTIVE_HIGH=
>;
arch/arm/boot/dts/r8a7793-gose.dts:	wp-gpios =3D <&gpio6 15 GPIO_ACTIVE_HIG=
H>;
arch/arm/boot/dts/r8a7794-alt.dts:	wp-gpios =3D <&gpio6 7 GPIO_ACTIVE_HIGH>;
arch/arm/boot/dts/r8a7794-alt.dts:	wp-gpios =3D <&gpio6 15 GPIO_ACTIVE_HIGH=
>;

> When I wrote the addressed patch,
> I checked all renesas drivers and device trees,
> and confirmed no one set WP-GPIOs.

Yes, I saw this in the commit message and was confused, too. I seem to also
have overlooked it in my review. I can't really tell what changed or otherw=
ise
went wrong, but fact is that Gen3 can't check RO currently im mmc/next and
after my patch it can. Well, this is why we do apply through testing, I
guess...


--7grjjjsij2dvqxju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlqeVv8ACgkQFA3kzBSg
Kbb0PA//TrGMEwFqiRK4wOkwxP7KX0TE2PYwpAwHRNjGq6LAcmAp1aybqdHaBysx
xRu6to0LpuncNN/GMXE9SIjDkVxtmPDj+CMbhsXiHKLzjy3a6iHJkOPas6kUV5PY
pOirwNZoVnCIXBA+Z0tf2HxCsyyL5hirbighbr8WaGr5YDzuP3ZEokg2PR+mbHoB
jdeEVEhvua5ZMG7mgn3hP+gyngpvN3coio9MlB7xn5yzEw6l8WGJuzAE6E0M5vR2
3fv9IYQVKduSA/GBxNb9yxoVNRDsjFcwtRPhpMfKhuDCNkXvxb8JmPgRHBxIZ91b
/ZRLPAgr0q0SjSmkItzIlW4h8OawFnEJ8prUzaUtUawZL/1mxCKYv2Opa6dbq2fo
dxNpr+htnCf+qjoAlO/lo1xASEUtOvuMBNb8ZlvLr7/XVZ0omJeiZZpd8QphX8B2
/lAvWt/F1o0ByvuUv0Pa/kUpL7vSf8jH3aMxAPBz9u7hbVpwzqQXm2GE4JayMOEz
AShn91XM+UUDka7/7zLgXrZJ+me3gccEQhxjE3FkEbbqLDhbW/cwwksWN4DRaKcH
QgNQoCgjIn7IieihixyQzYk+0cdXwgOtsI0fn+Aqzr6+qXRm1y8mGSi3BNkSk7jX
IF9wc+pFr9zyF4CestAW63ogYYUmRANjySoBKpHz8EjgZRFBlng=
=fL9c
-----END PGP SIGNATURE-----

--7grjjjsij2dvqxju--
