Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:42572 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726633AbeGRNzj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jul 2018 09:55:39 -0400
Date: Wed, 18 Jul 2018 15:17:44 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v2 3/4] mmc: renesas_sdhi: Fix sampling clock position
 selecting
Message-ID: <20180718131744.zfv43wt6knnpaf3r@ninjato>
References: <20180705141841.11121-1-niklas.soderlund+renesas@ragnatech.se>
 <20180705141841.11121-4-niklas.soderlund+renesas@ragnatech.se>
 <20180715184506.ldmrtu3evm6io4af@tetsubishi>
 <20180717144954.GL10087@bigcity.dyn.berto.se>
 <20180718094412.az5qgm7wyj2hknl4@ninjato>
 <20180718121833.GQ10087@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cnqgaxgcmrumddqz"
Content-Disposition: inline
In-Reply-To: <20180718121833.GQ10087@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--cnqgaxgcmrumddqz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I'm sure one could dereference the host->taps variable and do the bit=20
> operations but that feels like a bad idea. The other option is to use=20
> bitmap_{from,to}_arr32() to access the bitmap as 32 bit integers but=20
> that too feels odd and more complex then using the bitmap helper=20
> functions.

I see. I think we need to refactor the tap related code anyhow when we
support the 8 tap SoCs. Because then all the 'tap * 2' is wrong. Then we
can also see if we really want a bitmap or just use a ulong? So, your
solution will do for now.

> I will await your feedback before on this before I post the next version=
=20
> of this series.

One minor idea I had, but this may be bike-shedding:

	int offset =3D (i + host->num_taps) % (2 * host->num_taps)?

Dunno, your call.


--cnqgaxgcmrumddqz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltPPfQACgkQFA3kzBSg
KbYaGA/+KXtgTJeTpQPjVHLjE9yCzdcoa1uegFQ0FJHfmWMqG6iecnfgdEzdutVb
dXwajXER+t3s6Uqb5e3AbLDB3Dx9q+B8sLusRveZH/GPJEW9nYbltB8AQuxQQODC
1ufALOVZySVYaERGl4QMif10/Y0lHA8ATVGk56+PDSy1Yr/e/FFbDDIqcTAQXIC6
K4BOgcItILsP3votu6R9jEqkGrNcUcYfz6yNCQuPqmFOeVkt/35u6ab/O2v3/WNu
ubwgnBH16xuGt0ONqANDBYgrDjwhz6pugHv5dk/wK0Ym7rYJMTIG0Ev8DHbljxFX
puc/H+gjc30c3PmQiYuauIajm9MahPurium33MBe8ri4Q6oAFH6CNgV51nWYlERr
scH62VmtECIF01cY1a0r3CSeB4CHHlZTgaKw+PHiQt/uf0QCTtVZjGlyJXAIjj8l
PpzWEJfwbkhhnK4vNwXh4bLSXsjeLyCCaY424s6Vp+Ur9NoJaW+06emRQA479pjH
AttZ6mYSnTB/5rGxGLs4ttCUiCHyc3hCz5IDZ0OZRm+Y+josCidclimbPEsKHk8x
HGT0tXwjMWjSYjSq0rcYyypBjgZqE3Y8bT6Dv55G+e6+rRszFT6kdR4s1SEJwxYX
vgV1mfpKu1o3mi4wkVEkdXdpa3+ZAYGaFhueY2L/mUj2kwCV/uY=
=Yw6b
-----END PGP SIGNATURE-----

--cnqgaxgcmrumddqz--
