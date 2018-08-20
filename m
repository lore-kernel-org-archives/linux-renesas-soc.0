Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:59086 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726250AbeHTQGW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 12:06:22 -0400
Date: Mon, 20 Aug 2018 14:50:49 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 1/2] i2c: rcar: refactor private flags
Message-ID: <20180820125049.67lsqpacv5mscyq5@ninjato>
References: <20180808075928.31107-1-wsa+renesas@sang-engineering.com>
 <20180808075928.31107-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nxmdhbahryplqa2o"
Content-Disposition: inline
In-Reply-To: <20180808075928.31107-2-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--nxmdhbahryplqa2o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 08, 2018 at 09:59:27AM +0200, Wolfram Sang wrote:
> Use BIT macro to avoid shift-31-problem, indent a little more and use
> GENMASK to make it easier to add new flags.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--nxmdhbahryplqa2o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlt6uSUACgkQFA3kzBSg
Kbb8dg//Urp5s59PfYDLiwhp8MCMqN1n5xC1/d9gyvE51UDSYXFQGhdemEjaUVRJ
4zDO4zTmDkfHfN3aS9zKwMEp7GEFSnWB2zm6wcAl2oojCQfKAmp07+N/ar1ssamj
HXYvlTBRpUdf1jqvuIyCHkUhcw1j06ggZIpStvvd8kQ3+e1P534R65ca+VjScMuP
ziFbUbeQJEljlfz+HRbKwKEi4vEM/D8SJ5l1+Z50usZ/z07OVELenQ5yHBkvu+AS
gGk0LkOF1E1G+tv6LrFqv0vm31ud7sMzEpdOw9RibhLrNePsHaKYQzTryJVtQQUQ
Y/2o8ECUAfjn5++DuIggoig1eMs39CcUa8bBM3ILp6vrkvmX4FWXaDm39kCp6M0E
r1j20V2bPKwmzSRTUvZdbfsLDUzClKRcmhd11jfy1p+Ztx9ywx3csObzGvfeXCwQ
2tzbdEAlrZLBKHSQ1TZZmg1e9Sdh6YotJVUVAFJlDB0/7sJVuqFl34T/7Dopv5s9
1AeH/KQM6QS9I0DRLXXKsUE9OJsgGtOl54LBnbj95f2NIQDxRscJKY5wv0IhkNAX
XwCBT54XM8o9pBKhGXMeyZNbiWb8Kcva/qEO1j+Xv2C5a8zd0l/9M6VoLfHBpET8
yybKDLBPWitDEKLAqYTSF9wGg68eKvw+5w97YiNmnZleJtG7C1s=
=x37C
-----END PGP SIGNATURE-----

--nxmdhbahryplqa2o--
