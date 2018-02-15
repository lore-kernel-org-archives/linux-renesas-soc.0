Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:57448 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755501AbeBOTdG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 14:33:06 -0500
Date: Thu, 15 Feb 2018 20:33:02 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH V3] ARM: dts: stout: Initial r8a7790 Stout board support
Message-ID: <20180215193302.dhpvyvyr6ez37dm3@katana>
References: <20180215184919.31617-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gcqhbqhzfnp4mh6q"
Content-Disposition: inline
In-Reply-To: <20180215184919.31617-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--gcqhbqhzfnp4mh6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2018 at 07:49:19PM +0100, Marek Vasut wrote:
> Stout base board support making use of 1 GiB of memory,
> the Renesas H2 r8a7790 SoC with the SCIFA0 serial port
> and CA15 with ARM architected timer.
>=20
> Furthermore, this device tree contains entries for:
>   - 4x LEDs
>   - SDHI SD/MMC controller
>   - Display unit with HDMI output
>   - SH fast ethernet controller
>   - QSPI controller with S25FL512S attached to it
>   - I2C controller with DA9210 and DA 9063 PMICs
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Looks good, at least for the things I know best of all those:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--gcqhbqhzfnp4mh6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlqF4GoACgkQFA3kzBSg
KbbpZRAAkTjOznUiq1RHChi5cBWCncIQI4ih8sV2y4/w2iFxw2J9G5TYEafm5+fj
sz1bzRT2B1ULYCkSfvWiYzO4Dl7T1oVvU8YcnnA8+Ezf3bT0UJRAit9t5FNZJx4u
Qi85DAV6GDQnHCHTW7MQT3Utn9IYbciPrPQns2790tz+N4BZ5vLrAHzyPkS02t0R
kGojQKiTkwo7UxmnJm+GHWH9VD+JdaxshFHdz0HCoHr1bqLhB0mSLkXZOLsVP48N
HsdUWOy22rHkCHJO55fiJiX7Z7/07GGxI0y7ErRerortafu+ohF3WXClti2b6obH
xPWWkBrhpVCObKEE7Kpmi7Bl1boCZP1GvW1sqPnNO1qGk5Molr4ZaBCsOOYEdLVy
+ufYSUuRGFpqWrseiWAOraksc6TBqv/2pXrs1pEIt3G0sX5YEX7jdf4yBfLAT+pl
J3FlKcXJZY5sLiLUHbuha54N4UcTYJGYxybBg2rzqHtw8ew/I+76BziKEauoKQrO
Ch8Mlx/9iCUnBcbpOG0Kx59uGmrRCHy3q3YkL4K41bXiNvndJYkLzDYn45Esh+5E
J7oRuGlSDvUeXK1HKuadjqDl3LBE9+psTwDdS+bFGh6SsJAI0nN7esgTFrajLrWn
Ux/xjaO3ZNrWLD6BOYWB4OOwGABYHSq3i/m6kUUXRvKneDxAVP8=
=mRxi
-----END PGP SIGNATURE-----

--gcqhbqhzfnp4mh6q--
