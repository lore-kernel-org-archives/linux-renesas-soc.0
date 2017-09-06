Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45878 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932562AbdIFOwk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Sep 2017 10:52:40 -0400
Date: Wed, 6 Sep 2017 16:52:37 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: alt: use correct logic for SD WP pins
Message-ID: <20170906145236.3ezypiuteml5kb7q@ninjato>
References: <20170905172631.31083-1-wsa+renesas@sang-engineering.com>
 <20170906082639.GC10048@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vlxzsgxe7f46mtlk"
Content-Disposition: inline
In-Reply-To: <20170906082639.GC10048@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--vlxzsgxe7f46mtlk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > The WP pins are ACTIVE_HIGH, fix it in the DTS.
> >=20
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Thanks, I applied this for v4.15 with:
>=20
> Fixes: 2b41091b896b ("ARM: dts: alt: add SDHI0 and 1 support")
>=20
> Let me know if you'd prefer it to be handled as a fix for v4.14.

I'd think 4.14 is more appropriate since it is a bugfix. But then again,
nobody noticed so far, so I don't really mind.


--vlxzsgxe7f46mtlk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlmwC7AACgkQFA3kzBSg
KbZEjxAAk/Dr2nmpyvv1aDv274fE0B+0Kx8HHl/cmf3llaUrSw6YmIuF5V5HVtIs
8cPTuk9nN/3o0OfR1Ea2N3DpWZH29DaRpk0gpTvZJdxe7X1k7d9zj/HENpVgQFgf
crwfauaV7isO+NY4wR45bel+p0FccDeA/r18DX90GRehJlc4kg4yJy0XGxYtLN78
j9ZJiyWbs6lgXkPMH8PKKxpoOfv+Lkq2kosN6OOhV4QeDPq1j2yaTHBd+9w3M5b4
RwOcLgBBx9hJU2dvD1N5fAWaahiQ9LdPYpVY5fqzaASys2oeU+QFx35kI9xhx+7K
g/bkOS6xDRrIMhCnE8p3QiAwWRgqnLG9fDMfFO4LLyuUWC6fJr5zN4F/K0m4CL51
SH7HjmBTTxMb9H8hZVF6hYpOkbXTKzlV6rE6LRH/1ZAkcQUFusuM2AJ9nOIvRTBv
f4FzAdYksul7H3EuLpTyKqUQex2FklwFeDWVhzd4rdpNLUjpDPt4Qt3u+bsUKAw5
mJc9ftiVCov2UVr0EMMocQAm9ZG6oBthfbaDcQpdPmg7WpZrAa8jBi3vQMSzP9nA
2mdT9HckuMldkFXerTXPPs5O9xVe573/8Ga6E9AG3DEcKnQ9jCri6fHouLQGXpqu
XwIGwfqyludzjZMzJOj18/puy0GVWSqREC/rjsx+ElDeZH2abw8=
=N4WN
-----END PGP SIGNATURE-----

--vlxzsgxe7f46mtlk--
