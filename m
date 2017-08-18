Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:35049 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750969AbdHRJW5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2017 05:22:57 -0400
Date: Fri, 18 Aug 2017 11:22:56 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: Status of r8a7795 SDHI support?
Message-ID: <20170818092255.g2egextkbq4a7tok@ninjato>
References: <513dd4ea-7309-d2a3-7940-b14bc1836c31@de.bosch.com>
 <20170817072921.GB1423@katana>
 <fd4fb97d-9284-f2fa-5719-e28e6cc2fe20@de.bosch.com>
 <20170818090042.z3jx6rufxuc56m2t@ninjato>
 <32eb505f-b622-2562-e6d0-818c6bbab32a@de.bosch.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hmigvgg4ebuxarfx"
Content-Disposition: inline
In-Reply-To: <32eb505f-b622-2562-e6d0-818c6bbab32a@de.bosch.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--hmigvgg4ebuxarfx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > 	mmc-hs400-1_8v;
> >=20
> > We only have HS200 support upstream. Other than that, I don't see any
> > problems in the DTS snipplet.
>=20
> But even if this is wrong, at least some error messages should be given, =
no?

Yes, this was additional information. It is not the cause for your
problem.

> As mentioned, there was nothing. So I'd assume a more basic issue, like
> missing clock or compatible or similar.

Yes, something like that. Although, SDHI print prints out on some errors
like missing clocks (or success) during probe. Can you try disabling
CONFIG_MMC_SDHI_SYS_DMAC=3Dy? It shouldn't matter, but maybe it does.

Thanks,

   Wolfram


--hmigvgg4ebuxarfx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlmWse8ACgkQFA3kzBSg
KbbL5g//YNdknvKyFcjqHHiddk/Ue8i2b+6SWHsMEMrzqEMaubdWCF35FMYxdoOz
NGF6LGdIx/BsKcW3eU/mCeuIIXRpi39tugx+tcKhdl9PzI466EW2Dn4Tt9ue9YYq
6hLxO85CKrzete+wyOPbVCROdV/+xayjPVm7HZ096MCL/oYe3Syq7qcHXvHXiMRA
zvVrtn5vrHFWgRzK72CnaBpjhAB9f8w2Q2ulermaStIuKtMkLu9qA1M/Ket1P1fX
TsgkOsR3qQN08z35yse9uPCuXwAXN0URu3d4vHpav3b/POoTpAa7GzubQ3KHOaTC
DXFG7VvUadTd2gETplYTBV+T1pPVZfCkSvMpcJPasw3+6jLprxt0NkjpRzJIxnUH
Ky0i6c//dglvtQAJZFukbKbqIrFQxtUwE2b9zPvzYVYyU1Vx1djlHRa1zy/I72Vk
xBcT3MlH221AW48h/YtRkRwxAhWn8yEDzzFOatCRU7nBzuCS2NGdbxSAauF4ttaS
kI9dzYDZnR8xseOy0N3UuImVirBL+qy3RWjWS8yVPoK8UQxViHYMf2Dr0s0eOIdZ
8I/v5+UlvFozNyh1mDXzTuMlG9bjRIsCmGvHkkioMcmx6+qziUmT35W2o2Cj41ce
KE8ZLD/7tWmAedBb3mNLKv2PiNZ1i/0O73GH34Y+V5JbgCfxuuI=
=kQE9
-----END PGP SIGNATURE-----

--hmigvgg4ebuxarfx--
