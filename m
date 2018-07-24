Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:56124 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388298AbeGXMXK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 08:23:10 -0400
Date: Tue, 24 Jul 2018 13:17:10 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v3 2/4] mmc: tmio: Fix SCC error detection
Message-ID: <20180724111710.tioelozl6vq5ya4t@ninjato>
References: <20180717145216.16840-1-niklas.soderlund+renesas@ragnatech.se>
 <20180717145216.16840-3-niklas.soderlund+renesas@ragnatech.se>
 <20180724104459.pfggnsz5xlxq6peh@ninjato>
 <20180724110331.usvbfd7vvs5xxd7l@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2jm2vlxha2fgjvrq"
Content-Disposition: inline
In-Reply-To: <20180724110331.usvbfd7vvs5xxd7l@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--2jm2vlxha2fgjvrq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > This patch breaks HS400 on my M3-N again :(
> >=20
>=20
> I think that may be because renesas_sdhi_check_scc_error needs
> to be taught about 8-tap HS400.

Right, so patch 2 kind of depends on patch 4?

Niklas, how is your status on reworking patch 4?


--2jm2vlxha2fgjvrq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltXCrIACgkQFA3kzBSg
KbZRsw/9Gu6G5R42gjZUOCua+BuQXC5Mnr/hYMCLfR5FZ1Jw0lH/Sq3dSgZgOyqH
ZZUWPzy93b9XQ9Pot2rbw/VVgCW9SZ0emULgeUxXsX10h9Zw/FSHZFSI5mWqEmz1
Xdtad8F1p5AJ2l5iZVUeFDrpDKCDMS/6tlMNzAJScSd3qZYUMmloXQIdNq/QFsm2
zvS+DXn+7qQNqPFbCecK7MrJ/++3wKqYrPypkBmwxg9NSLGy8ntYW2EvapTPxeLY
pBcuc/ZVneA+u2uG5OPiauuSZao9p/DkU0W8Z1Kt8mV8i51n1pONaav6+AGgT9q4
sBUh0F78bthTVi8mtIv2zk0bOy/YCrVP4DC5KBbnez7by52z1vX2e9KAvP42w7dx
AUQgDoH0yLa6reC899IV4jBFftXG2JLBITc8uR+A784e4Vcf4FlJxza7FPeW5NON
lWNpO0cUoyjzg3z6uPfKmPGH9If2AcTKn7q880OpPFS48j3DOB9ThbjK0/PlU0ml
HfLndh1VYgO1I2l1daKm4c6D8fnIyaUFGxqPKqmaTejuSomuiL8qOHnIYN+kCmv6
i+BlNqy0BDk4ZStRgBdaxlwtid5NQ5QQZVA8yWNWjeygfiOJlF8R5ol3cxjxAPZ5
HaOHDMyUokm7xzg+ranep63iEUmb9VwLej8NbOTsBj2VbSiA7SA=
=AdSe
-----END PGP SIGNATURE-----

--2jm2vlxha2fgjvrq--
