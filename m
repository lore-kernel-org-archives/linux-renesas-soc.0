Return-Path: <linux-i2c-owner@vger.kernel.org>
Date: Tue, 17 Jul 2018 10:48:10 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 2/2] i2c: rcar: use the new get_bus_free callback
Message-ID: <20180717084809.qshhxb4xed242tog@ninjato>
References: <20180710222423.7792-1-wsa+renesas@sang-engineering.com>
 <20180710222423.7792-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5qp3iu4wvbwyhiok"
Content-Disposition: inline
In-Reply-To: <20180710222423.7792-3-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--5qp3iu4wvbwyhiok
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 11, 2018 at 12:24:23AM +0200, Wolfram Sang wrote:
> To break out of recovery as early as possible, feed back the bus_free
> logic state.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--5qp3iu4wvbwyhiok
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltNrUkACgkQFA3kzBSg
KbYmxQ/+NV6DRE1C/0W/emnwgyt+WKYziG4zifw5xybB0vFFQZ2gpuKF66tupP6H
lvIcrpd5O/9RYvTD7fUvxr32/JwWULEhUSWOvNpmld9E9ncHyMOzeWsZn1Hpcag+
DZuER6BT2q92nMp5ejbwvEIiOuGoqlV/kI0G0tzeGhjerNOgL42WWsElLTH/+tR5
UeOzJki47sQz4yaPS3lKkWpkKOoLELUoaGynoA1P1Mym3IBVrvsPqwlgfhXffutU
Lt3zU/eT9zmbM5O8xXjZ7EMv/uJua8vqEROdl2DCO9IqiOlYpBoy8OWIvzDYuqAh
Od7KhZ2wbuy+ecqUxcaY+5L+ERD8Xz+Iy24Hm5aCaIsuQv7c0A8KtQNN5WP7T6Sy
6qL5c1nxCEm06J1bbNzdCQIWY5c+KF15YMDNuxJjPiTN1EqWwGPWW5JM1oAXnd9J
OiWnmwnsxdhOGbJH9e0a8QNbbksHQYtWVkVNcSDLEzYmDiw0yDTsQyr0Yv/bSR7J
YUwuvX3h9MBDg60at/IJ7bPghaanhWYSMrVBvhKaIsDtjATc/yhpsZw+lwQsqpa7
D3VYzrEFDnELqakU6LDKD+8xqfwtNJrhh4lTBkGjZP3YPN3/O17bWGFHro/3HwtC
+EH3ZUKAPVwIlYx+Os7JsFvYKhm5/z276x3iaX7NHeYEu+afDu0=
=ZJQI
-----END PGP SIGNATURE-----

--5qp3iu4wvbwyhiok--
