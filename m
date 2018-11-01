Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38710 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725792AbeKBEiz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 00:38:55 -0400
Date: Thu, 1 Nov 2018 20:34:33 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] mmc: renesas_sdhi: remove workaround for HS400 clock
Message-ID: <20181101193432.GL2433@kunai>
References: <20181031225944.1226-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iK/wEI4vkfDmI6Zw"
Content-Disposition: inline
In-Reply-To: <20181031225944.1226-1-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--iK/wEI4vkfDmI6Zw
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

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--iK/wEI4vkfDmI6Zw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvbVUgACgkQFA3kzBSg
Kba1ng//QWRehHuNK5Tc+/lUNw9w/1Ayk8lRKWHawe4rfB5L/y+WA5kJZ1BujTQd
Qjq3Pg623c63+jFV0edePfdokH6LQBZvRQwqefTKeFMBvGh0QaSkhQCW5JB7MdNw
DEjYtFSpokreHcQQVIg2ymzONp7nTUkpVRGxhOMoGLv7MXJK8fd2qt/RTc5RyxMS
e8UkHq0uTkmZCUbWyhKhsT9ouU36w2/4eUJY3Zr26K6nnUSgQ0hzPhtEja9CXJYv
5fKv7zzCrlx91jGd17+gxHhtZehprJ60Jo7Bjvk5xvWufyYiuYuVKxoyfQd123P1
cUzViUmGfkrKBmN9FIVOqx5W9Nn/ND5+C8SfQ3xi7xAuik2oc7wDptvZHeyUAPx1
9wq/BVOPlctzpe7K7hWVo3/jVzrhwnx19euhFNr4RquMxkRdkcLhLSzNmJiW6qle
CuBgCfCg+LEnsbSgRfhsPr7Ug3gMHgJToGRWUYSnh3a7KusTRqLQ/PXrerzaE/TT
RfJXmis9RZMOIxUULFCcZuQbiqC33/mJoMcaY4prikerno78ZP0YdEpm5AZ5L1We
i3+wkVF7X38Iyoayy0KKx1Q6Z5Bs5hfPAxQl4Njp7eorMjcwkZl230j/D3vIvKcy
10Bqe3KMWYSe+x+eLzTLvkK4oeD7ljHYXgGxhRHi8OZ4PR2tFRM=
=HyKN
-----END PGP SIGNATURE-----

--iK/wEI4vkfDmI6Zw--
