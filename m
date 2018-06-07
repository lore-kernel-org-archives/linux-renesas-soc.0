Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:60066 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753085AbeFGI6J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jun 2018 04:58:09 -0400
Date: Thu, 7 Jun 2018 10:58:05 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH 3/4] mmc: renesas_sdhi: Fix sampling clock position
 selecting
Message-ID: <20180607085804.llnrbjiq557oprqf@ninjato>
References: <20180606204724.26055-1-niklas.soderlund+renesas@ragnatech.se>
 <20180606204724.26055-4-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eamohwvozjdodpkl"
Content-Disposition: inline
In-Reply-To: <20180606204724.26055-4-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--eamohwvozjdodpkl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 06, 2018 at 10:47:23PM +0200, Niklas S=C3=B6derlund wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
>=20
> When the result of tuning was different between the first set and the
> second set, there was a case where the wrong sampling clock position was
> selected. As a countermeasure, make the two results the same.
>=20
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> [Niklas: update commit message]
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

As mentioned on IRC, I think this needs an updated patch description
IMHO.


--eamohwvozjdodpkl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsY85wACgkQFA3kzBSg
KbaFGQ/6AjZFgEMa29j8b7Rj9EE6L2Dd4sXuDumLVmb2svZCb0Ru9+HQFYVRiFC4
N8uOT6LvmcVexRbJqeU6GbXskrrK1GCGtghSV/mwVnuvLDU/a9LJdyqJ3t9wZJa4
OIgPUef8MYAgVX4/s7FJMzFM5ORMdBtgycuLUpJPs7oPtA1bMinvEwc63B6dTilJ
OkjZVRCxu1Z8eNFgE6tPQMJ3QeXw2O6DBRVypisFod0D6k8YW7q1/ck86o+GSW4g
BAmTETHLYyXWBV8U9eFpGvHDzHtqM9MoPLIkcI6n7a4hojqOgy/Anw8QcbqeCrAp
RlsTmlE0KxMZBMb9PRFCUJXKIlY23/q6olGrstZs4fRtYBb4EcPXZpYLwMpkI26M
1GBlenUYE6YMhqrq9yCoPexBPZI+KCREd3vxHkFO0F45iMo2FSg1IxXDvMl7kMbm
sFEH4LvDFlab+wxilpaqK2J4MbnRTGPfOfirX+Ef3C6AJYNGy03SKxcNJmAq7a2H
EDkodGLqdpfl4ooYNtHCDCrpz7WU+MF+QnaOEZaY/gmYFMvD7b/z/IWnvaBd8c2g
gf003iw2WqKEz72iLgDqs5/YNORcWVQemyaJgJO80L/ymika748cawYTgmOcbbWo
D2wGBMYFiFfNwenmL/OsKxHs0XDt+K4iXfuV/rzjIjq0wXMLoOk=
=Pywa
-----END PGP SIGNATURE-----

--eamohwvozjdodpkl--
