Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:60020 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753325AbeFGIud (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jun 2018 04:50:33 -0400
Date: Thu, 7 Jun 2018 10:50:29 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH 2/4] mmc: tmio: Fix SCC error detection
Message-ID: <20180607085028.d5fe7wq2ctldt74b@ninjato>
References: <20180606204724.26055-1-niklas.soderlund+renesas@ragnatech.se>
 <20180606204724.26055-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ioxeqmz6oav4k4jk"
Content-Disposition: inline
In-Reply-To: <20180606204724.26055-3-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ioxeqmz6oav4k4jk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 06, 2018 at 10:47:22PM +0200, Niklas S=C3=B6derlund wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
>=20
> SDR104 and HS200 need to check for SCC error. If SCC error is detected,
> retuning is necessary.
>=20
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> [Niklas: update commit message]
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

It makes sense to me. We don't have a testcase to test this against,
however :(

How do other people test stuff like this? Rare error paths?


--ioxeqmz6oav4k4jk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsY8dQACgkQFA3kzBSg
Kbb4zw/+PynuaAQ9czx1st47AAJxx4nKw4VpZIIzw3oFNQ4iVJ/cklBq/fXetDxp
64oTiPfd0B+rGkvpIMxluHX6sLvY/Bej+hql5BumDSo6CG6WqY+Rj3j6cT+upZGv
Neym/wK6Kb1CkYJoopXn3zyWB0UcYalqR0jsdo8ez8pEvqYbiaKMfIa74DPC9hjO
tkWWv3cBPUYLapr8fYmX1jHlVS/37A0CoI3Uz6QMgca9yCzlkZhmOUm/7HC511p7
qL+FT3mGSci+EklboWjAtxY4Zb6h1958P9sWuAj3/RWGgccwrlYIlYeOtZz6j/jk
BYaRkmU3nuTGkSPtIoWOhequ9pefPxf01kgSwPg/iHtFV8pxPJTzPkKVyA9Ftd2f
F8NLPyRgAvjGmwrBkgvqg+lEqJf4WR2RMyh9Y31oEXBH5+fzf2jxKaRRG39SIhPh
bQG37j0lgKUPn3nvjAVUhxgIlyvF6EZQsPbt2CktWXb74u3zQSqaNGf263npxFav
d01ZuUhvxkU/Mpvv7SaPEqZTYFzzg11Lh25q0lIUHWfrcDP5NZGFXul59or4XiBC
KgnLicX4oRmU9ceLKf5jHIDrZt5aMR8dg5Ne3yBKxw6c1N8NaGdW3snFxCRz2uDN
RBIFnUK9jHc0dQQ5q1vuNdY3LGyAl4Vl6261C2X+ApFnRzNHsCI=
=hdZt
-----END PGP SIGNATURE-----

--ioxeqmz6oav4k4jk--
