Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38658 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725792AbeKBEg0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 00:36:26 -0400
Date: Thu, 1 Nov 2018 20:32:03 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2 2/3] mmc: renesas_sdhi: align compatibility properties
 for H3 and M3-W
Message-ID: <20181101193200.GI2433@kunai>
References: <20181031231340.1958-1-niklas.soderlund@ragnatech.se>
 <20181031231340.1958-3-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="r4QXMf6/kyF/FvJJ"
Content-Disposition: inline
In-Reply-To: <20181031231340.1958-3-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--r4QXMf6/kyF/FvJJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 01, 2018 at 12:13:39AM +0100, Niklas S=C3=B6derlund wrote:
> From: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>=20
> It was though all ES revisions of H3 and M3-W SoCs required the
> TMIO_MMC_HAVE_4TAP_HS400 flag. Recent datasheet updates tells us this is
> not true, only early ES revisions of the SoC do.
>=20
> Since quirk matching based on ES revisions is now used to handle the
> flag it's possible to align all Gen3 compatibility properties. This will
> allow later ES revisions of H3 and M3-W to use the correct 8-tap HS400
> mode.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--r4QXMf6/kyF/FvJJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvbVLAACgkQFA3kzBSg
Kbbc6A/7BkfSwwt4Pb8Iwb+3fqGs65ao4+qUhy+cTKZFbm54Nz3nIUrWVFdQKW6S
OVGi50HwH5BnKom/dUMAFwxk6izxSeH60d7waGtkgF5YRai53YeTt9Iu55lI5Lnd
7WiCRzNrIh4LrWb9vhLjUw7J6HR57Obn2vRjxRA9AQo3/sKwMLcP06xHIIMVAPWa
Gv06wVnhoWcyYQm64kc8t4odgoeukL/sfo8av718yyTzyc/yUokAT9J3HdhQD34s
RiQLGCLuzi2edlzcFDIAA676DUWL/3GRKPoPXnfKuevYLQJCzMHZXsgJpGNJP96t
MbViA0vlIXiiSPZhk6hYHk/4B8Wo4Z1gSxdShBaCnZO4HVf/yY79odMTaeVU40lP
wB9Mmele2zfpA7fjC1EyPzFUNjUckXbWttsDPbtP18TtC0EhfMIRRvUmB+EfSiEk
B0f74Kyp0sw5J3DyHUJ5NUIzfIm4gL2IO0m1gmDudWxFLhr0oSo4BIOfi9eId5kZ
aCQwEofY7MHpKqOUhcF1dSayhBX0Z/SEKBGUOJ7548wbTXax4kThgLsHNTtSj00J
vCl0PGrwGcpARIiqOHVC72YezVW0m1gqhnGABoVLt8dD08G7YxVuwY0P+HDQ4udC
i8WjGa3N4ctqO/dHLBbubrw2Jv/UPsl0R/9B4As8N+mEYvbxRsI=
=bJFw
-----END PGP SIGNATURE-----

--r4QXMf6/kyF/FvJJ--
