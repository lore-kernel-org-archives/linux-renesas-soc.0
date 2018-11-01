Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38724 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725792AbeKBEjK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 00:39:10 -0400
Date: Thu, 1 Nov 2018 20:34:47 +0100
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
Message-ID: <20181101193445.GM2433@kunai>
References: <20181031230043.1302-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RXc6EO4W1yUvSQ0X"
Content-Disposition: inline
In-Reply-To: <20181031230043.1302-1-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--RXc6EO4W1yUvSQ0X
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

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--RXc6EO4W1yUvSQ0X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvbVVUACgkQFA3kzBSg
KbZXqQ//exJUwSv1mMIjDA+DP+UU0T8UCu/H0T466/F3qo+MwG8ifNJ4UY7SjsPU
LyzoZgB61uEtWjvYMPhsiXrgEdsbf+QyYbSLZ8EUH0DCiL+pungDaanNSWIEt98H
RueJNQ/D6MDGic8d6dHkiRuUmbUox6eQsy2CIYK8lT1+Tsu31JioNtLEXxS5fgf4
lgWfeSGhOtf/slvXoSXsYYg1kLhMs3prPfN7014ofEXlHasr16XwrmZ1UIGOqO7/
hm0WKQZAmL9Me37hiA2SBzcFjzALZA4L3IiwIk06sv0nv81e08mm7IxN2f3VEsTR
9S8iNwUlz7cSzq/nWL9kw7EWCniMu6JswrmrR5yFyokbDHOPQIpHadu0UWjAZD+R
B5SvKNM399V9GAckXcRKwzLv+gpZLf5E/f7uy3AWPGkVg0BgSCw7DT8ob+eDhl9s
eYGJCRoTSJPg7bzjUgD1ECF3bWMDHJIZSVRnZVP+NfFT7PW+NzYv8dJa7lfGYdyN
8cyOmqKGfsR4zRNWYPjZKVEsOPBK8jImz14iXXk1yUvwCYs5f1Ipa31ufhFyrgP3
V+pxqgBx70egh05fDvlJfzKGPa9PkelHpq04kV6XLebsq0Nywa/rWNjD+tHEN4v0
6WlBzX6sO3w/8SvHSAwjl+bliauCy7ifO+rS4xB00h9/xFB8Fw8=
=H8Mx
-----END PGP SIGNATURE-----

--RXc6EO4W1yUvSQ0X--
