Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38422 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725722AbeKBEEw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 00:04:52 -0400
Date: Thu, 1 Nov 2018 20:00:35 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] mmc: tmio: delete wait in tuning process
Message-ID: <20181101190035.GC2433@kunai>
References: <20181031230043.1302-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="t0UkRYy7tHLRMCai"
Content-Disposition: inline
In-Reply-To: <20181031230043.1302-1-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--t0UkRYy7tHLRMCai
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 01, 2018 at 12:00:43AM +0100, Niklas S=C3=B6derlund wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
>=20
> The manual does not contain information that a wait is needed in the
> tuning process, this might be a leftover from early development.
> Removing the wait don't have any effect on operation so delete the wait
> to shorten the initialization time.
>=20
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> [Niklas: fixup commit message]
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--t0UkRYy7tHLRMCai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvbTVMACgkQFA3kzBSg
KbYScA//XDFOUiq1tV50/t250ycHo4A2U1aiVVZBLj0qZxE7h9ejkXakspqIWbhw
89mpRFO+L5EBbhEa0hxNV5UyL0+2Y3KDtJlMz7dY0KLfDxVctyAOKgEA2Zs4zphm
W5+a4uaqiVwNP5oLbUoTDUEnoxp3TDopApl0g12czK/mtxAJGqtQG90tZDmftih4
lJ2jG4kCjdbjjCz9sRSZqLKMpHi4TUnejKGdPM9VCHx8DX1bbWbscm4g/OkHAZ3/
1dKtHhcaPnm6cYZ+wsnXjr1UZRjBA6knmO8OPKdIYCffsD0Ucp9ZeP6pU40IYbqT
P01ieYMvDIMz8LnP2uVeCOvf6/WhmN8flTqUj4NmCo/9j5b+NY1mzRG5xlt2rSSg
WmJFYTSqfE7Nqh9chIsOqxatmn3L2WgTATW4a0Po3PGwKLy7Rr0uQmkeZK0owUI4
8fGckadLOTXXoJgfQt9IQKjdUCH3rjqcJJpPot5HYqT0s9iUTXvlKN7RSmYfvhJG
3BiuSsgfuQPLNitxlO2IHYE9AeemxYx526WWRshTfjkalTyyLtoftfnD9zgnFUZl
TDLxDAgFN2VLadAkc46DMoiOMm3v7vbvq4n1Vmj8S9QQHkLc7QwWU3lAwHoX0idN
vGWtm0dZ/NAzH+jPFuq4Y8ZZeqVPfK/zz7WRdxXYkSFc96+ElZ8=
=fnW9
-----END PGP SIGNATURE-----

--t0UkRYy7tHLRMCai--
