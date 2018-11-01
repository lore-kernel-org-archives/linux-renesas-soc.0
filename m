Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38388 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725722AbeKBEES (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 00:04:18 -0400
Date: Thu, 1 Nov 2018 20:00:00 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] mmc: renesas_sdhi: remove workaround for HS400 clock
Message-ID: <20181101190000.GB2433@kunai>
References: <20181031225944.1226-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Content-Disposition: inline
In-Reply-To: <20181031225944.1226-1-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 31, 2018 at 11:59:44PM +0100, Niklas S=C3=B6derlund wrote:
> From: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>=20
> The driver sets an incorrect clock and depends on the clock driver
> knowledge of this incorrect setting to still set a 200Mhz SDn clock.
> Instead of spreading the workaround between the two drivers the clock
> driver should be made aware of the ES versions where the special clock
> handling is needed no need to keep this workaround in the SDHI driver.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvbTTAACgkQFA3kzBSg
KbZRHQ//UnxDbOU/v7QSWQ4PKfy1r/QnEDb5D50/4DabKW0PhCbi1jaqahXraY7Y
c3I0V8r4DiYl9dW2uG3ARqunXRX/ZHW3lhEZc84M4XdOtHyrAjnZcpiGFAuFljjQ
ldl7JjGsHE4iDNNsJV77oOglWwCzS6p4U2PGNY7Gb8Yhy341qn5hWiG5f7W/Wfba
+DUMEo/oBezCqnHV0NV3kTjjn3FxW0kSZKJDr29D65ZFUftdACOmEIjnOkaZBR39
buvksmRfQhCYxnjbIUDMTzMzJWA7H7GiD+te3CkeLeyvREZaWtllhSYets7cFxBi
f9lqNm9/AuMvh6OKA+tkLroL2Zh0cvBd9H4JnxiwGjrLrsdhwd9xHSkC/6IcvLga
+GbZxbeXoEQOtFwtXq48TT+8jn72v2ou8/6s1+VrpPC9rnPeGvmHdI4C0GyDM/xC
lTR+d1OekoR3A35ZrC8AGILsskIylfXPrQ7uBqGhwYm9MmF6EEMy+rt8xMrdzbwR
Nc/T5DY9ojVOL27T+UO9K3EwBq2LT/kgpUln1n8yvrkfqgcA5iZvl3R0DY3YJf8H
Dz0IJeTG4HWTe0HSjuLXDDkcCA12ZR754yCjoQsXRfU8h267IjiUFyMWqkx+YYjm
rh53WB4TNCVu5pabeTmu/3tu4bvNxdawdvdBUeuwfzwncjr1Pk4=
=5jvA
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--
