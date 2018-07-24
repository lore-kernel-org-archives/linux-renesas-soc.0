Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:55894 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388348AbeGXLuv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 07:50:51 -0400
Date: Tue, 24 Jul 2018 12:44:59 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v3 2/4] mmc: tmio: Fix SCC error detection
Message-ID: <20180724104459.pfggnsz5xlxq6peh@ninjato>
References: <20180717145216.16840-1-niklas.soderlund+renesas@ragnatech.se>
 <20180717145216.16840-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fyzhjm7tycwsylaq"
Content-Disposition: inline
In-Reply-To: <20180717145216.16840-3-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--fyzhjm7tycwsylaq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 17, 2018 at 04:52:14PM +0200, Niklas S=C3=B6derlund wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
>=20
> SDR104 and HS200 need to check for SCC error. If SCC error is detected,
> retuning is necessary.
>=20
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> [Niklas: update commit message]
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

This patch breaks HS400 on my M3-N again :(


--fyzhjm7tycwsylaq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltXAyoACgkQFA3kzBSg
KbbI6g/8DU4Gjnia9uSvndlQm9GEc9sI0lRX1VDvW+dYbd4adUAwBj6hqvEKlLJc
TlcmredFtipuMJGynmNfTNAmyqlsDHR7an+hEd9mb4s4JfeIM4s+HKy97DfQiQq3
lNrceVWQ/3tkOTlIhwIZWex7yM/d8w4v2MNJjKfcmm79k5+UNVImk84MTq5r/g2K
ooj+6kL7lloSDUav3+UwY1IbnvTo8hIOYGeqtRvBU0chSTP47Pas3Zjuowz9DVnk
T0qRMqxwKy4e3ZEZAOOI+k3exHXuKVWnC3fLxZ/Swwyz0vO2VMLMkStR1u0t4l8r
Ga97Y7S2hCYPHLkO5FjmRYoMUoqN8dKoy/7+MBToutezcOiua/E45fHENaK42Zop
aEdSJfSZ1igy6Y3ktZwI4E2AIcn+6A6DXP19y32NbGDrPZ7UXD6GD3dYj1Tavt8G
ZLR8ocM/OiD92iefWLVv3ZXjeL+enlEofOiud2jZN/7RNpt7DQ4C8QQdSO6cHMM0
+PgAFSqNLFtM3qpe7+9F4lXRJa62ajWH5uYpbml+bLV7fsi/3yyx2x+6/6/1hFle
hdfSTQ/bH3pUQ2TI8yDfUcKSFqL9KL383csoxiIPeiRCv+6IpJ3e+JsF49p8rLZ9
5oNwfOW5JWEGvN/jFrvl81r05mZ1bUVrAdX0X5s6xzm88lspKx4=
=T0p9
-----END PGP SIGNATURE-----

--fyzhjm7tycwsylaq--
