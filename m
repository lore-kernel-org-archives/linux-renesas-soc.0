Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:59796 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728845AbeGTXCX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 19:02:23 -0400
Date: Sat, 21 Jul 2018 00:12:08 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: Re: [PATCH v2] i2c: recovery: make pin init look like STOP
Message-ID: <20180720221208.zz6obk3rbqmwyezu@ninjato>
References: <20180717090005.14997-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="l52oazuf7lrudrut"
Content-Disposition: inline
In-Reply-To: <20180717090005.14997-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--l52oazuf7lrudrut
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 17, 2018 at 11:00:05AM +0200, Wolfram Sang wrote:
> When we we initialize the pins, make sure it looks like STOP by dividing
> the delay into halves. It shouldn't matter because SDA is expected to be
> held low by a device, but for super-safety, let's do it.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Reviewed-by: Peter Rosin <peda@axentia.se>
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

Fixed the typo found by Sergei (thanks!) and applied to for-next.


--l52oazuf7lrudrut
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltSXjgACgkQFA3kzBSg
KbZemQ//YVM/8OpTb9/sHwQkmsMEnYXuiJoWw2kd6i+bJtegN7fkpmfi0ibL3OhF
GFD4XlZVR8zh0eEMLaVDYPB6+GzkzSWJhrPe9CEjXuIQcpT44/AcupnBXKlB++a2
DkoXKiXQP4sw/QTe81A1I4bsqIlja9ZZnk4UIeRDKQUCNIqVhJkLzwXjWh/Pugeg
D+hvaPDNMaS/hzwCr9nwRqxVbbJEjuiuS0kOpYm8/+yHsEE3QtM0LxJtSXb8DzuL
Hp1rhaYAyU6aSNnNNriiW9wnzhlY/KLUogzrb60xygODHwy81dXcNftiSz8EHI3h
hF26XEFAlNt4/fUVL1ErQT/WPEVYY+x1z7b8zk5rseWjsoGY+irOuU7mhs/EpNtd
Le4mNEBufSOHOwib++V0F4e43scrpB3zRYgPirteDLJ+9asXlxSr113JxX5H0SqZ
3WW4fB3vTUMXpw9wFaAX1eAA3nGkpI8Tm2upxrB1tFQsxjFnKHpz9V2yIUNay6Ql
SHApcKcJ0KxrlSozouv7ObzZcHkGpRxAy49eOaRNACcKEUCUiH8s2oGhlfml4PLd
E6IJwUvVPQKQBdunE4lTZV7DSEvei1l9fU24xLG97fLodkR2VINJTJ5p9Z0q3pwo
TORjP9V8VrsfBui2krTDPGlt03Guc4w+sgW73exojIgcSzNapd0=
=qR3f
-----END PGP SIGNATURE-----

--l52oazuf7lrudrut--
