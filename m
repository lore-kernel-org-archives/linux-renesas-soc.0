Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:37978 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729202AbeGYUXr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jul 2018 16:23:47 -0400
Date: Wed, 25 Jul 2018 21:10:45 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Tejun Heo <tj@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] ata: sata_rcar: Provide a short-hand for &pdev->dev
Message-ID: <20180725191045.nq3y7rqmcfi6nx7m@ninjato>
References: <20180720122739.30056-1-geert+renesas@glider.be>
 <20180720122739.30056-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3w5rvqtddcm7g6rh"
Content-Disposition: inline
In-Reply-To: <20180720122739.30056-2-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--3w5rvqtddcm7g6rh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 20, 2018 at 02:27:38PM +0200, Geert Uytterhoeven wrote:
> No functional changes.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

For the record, works fine with the newly added SATA support for M3-N:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--3w5rvqtddcm7g6rh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltYyzAACgkQFA3kzBSg
KbY84g//X8UNijQxiw1t/0VfLl/hbUaaaS0sPaHTOYzDN1tBpxr66CgwOGMnjpZe
ITXG3d0X9NNdLVrEXGTMOLqayvjk1dAV6TlZn7iE8/3gt/m5FjP9V1BWzF6gclCY
dTm/Re1aXRLycyGQ3caYdA1yblSJlLipyByh/cW/ZvU5Tu1Ou0yhnjbQDDnA1xsh
gF7mP5tRz956dA4P5G8vAgqihcea8ABEy4OI3VA+bwfRLCZB/BSsLjN4N68sOZbS
scmWM5m5shAm0pKDfOy2KjFgeoHh+4SLOZxIRkue6mEG736YSycsHbkX6alyM6BB
+MFkKr9dThi0QwNcgDI2zvhzHeDGGT8hZLZtAZFos46GC/6i4nWaLTuyHlIXPf5N
5juS13aC1FhEWqCIMv/kuFDjPb0j5AQCMzWBCgETIrDrchetdqk3u0uafwU6dlOr
KbbOPyWf+dP66OCaGmCFO3fHt5ZiJ4bH7yyaa1gKQ8Bxu6L2gmLvGU2wlkDyc/Iw
sMOn4+KtGO6UWlxcknhWl89dz5yDc+5r+KvV6wzH0UVrpJGF8AL+uw48/Za7RpqD
SaBl7WHpk4SZ/8hmm9BYkot3/uUTplohiH4+1mD2Fa0cKEYbgnyXsSiyzxPeXas2
UwRM5DdnS9WfzYjggWQr0QEriZ+sEXFWh1v/GX4r6u+nQb712uI=
=egZh
-----END PGP SIGNATURE-----

--3w5rvqtddcm7g6rh--
