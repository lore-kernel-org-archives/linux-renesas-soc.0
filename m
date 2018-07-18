Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:41504 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731059AbeGRKVS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jul 2018 06:21:18 -0400
Date: Wed, 18 Jul 2018 11:44:13 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v2 3/4] mmc: renesas_sdhi: Fix sampling clock position
 selecting
Message-ID: <20180718094412.az5qgm7wyj2hknl4@ninjato>
References: <20180705141841.11121-1-niklas.soderlund+renesas@ragnatech.se>
 <20180705141841.11121-4-niklas.soderlund+renesas@ragnatech.se>
 <20180715184506.ldmrtu3evm6io4af@tetsubishi>
 <20180717144954.GL10087@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nr5oo2qblwslnpng"
Content-Disposition: inline
In-Reply-To: <20180717144954.GL10087@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--nr5oo2qblwslnpng
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > One idea I have is to let the loop iterate only over tap_num and then
> > use a mask 'BIT(i) | BIT(i+tap_num)' and work with binary operators
> > then. But maybe there are also macros to test and clear bit patterns?
>=20
> I agree that the loop is clumsy. Unfortunately I can't find any bitmap=20
> operations that work with bit patterns. If this where just integers the=
=20
> following would have been a better solution:
>=20
>     mask =3D (1 << host->tap_num) - 1;
>     taps =3D (host->taps & (host->taps >> host->tap_num)) & mask;
>     host->taps =3D (taps << host->tap_num) | taps;

My above sketch doesn't work?

	for (i =3D 0; i < host->tap_num; i++) {
		mask =3D BIT(i) | BIT(i + host->tap_num);
		if (host->taps & mask !=3D mask)
			host->taps &=3D ~mask;
	}

Written from top of my head, maybe I overlooked something.


--nr5oo2qblwslnpng
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltPC+kACgkQFA3kzBSg
Kbb3JQ//WdQf29mgln16uSjHGFU0ER5jAimdSH6q81DY0r4zg74s63I+yC8wr1Jv
bfd+gHISGS/rAXoJMOeoknHyOwNWkwwznBQXfawaQ4pdV83nDxhNqWarfrP4jjN/
tTxHn78/GGhy/uTZtYLBrnzyGl+fn/fPPK5RZcqaAOptzp17oeHCS89CRGsTPkXA
TFZD9RXYHU34EV7kifKfsPFejtE51m1OIZCYSjMbFDRriE6+B6xVKlpRU3VYdPdM
SYAaHRqBAcr5ASXQxPT/j9cFyDpWpIvenQ3F9RJDKgt6auOskD3dndcDLU2S16k+
49wRgc957kljzfGNXOlBTRtEjEinXUFdsEU9cWJEBx3RYMmP1ToH3jfPtDS3iXKM
8HBwWs6UxQN6tyCEKXp7aY384DdySuxuqMxN/PlTYAz5HRHIRtgKCDHWW1CK74wI
LQKwwuxWr49NDV3hbUkNEOOTgW+3X/zjp94v+SencyHfqiyGhFty5Z9p/PA6I41K
hagdhEPrxUWXDZ91085LK9gQt6WCGroCKV40tIBtt+mu2EEguw3ANdGX7+7AKkZj
Tu+zf3isB1FOZ2tNNp2/YmyunFZmhsmDCEpL6iVnT4PvcByXKVf/UeDfvshalqgE
g9dQxdMs53DYIeDhmJ7idaSObG9taGwX8v/p5CWJcTYcavJvTrQ=
=6KtH
-----END PGP SIGNATURE-----

--nr5oo2qblwslnpng--
