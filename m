Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:47938 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727204AbeH2Vdq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Aug 2018 17:33:46 -0400
Date: Wed, 29 Aug 2018 19:35:42 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v3 1/2] mmc: renesas_sdhi: skip SCC error check when
 retuning
Message-ID: <20180829173542.cunvctla37ujufta@ninjato>
References: <20180827151321.18015-1-niklas.soderlund+renesas@ragnatech.se>
 <20180827151321.18015-2-niklas.soderlund+renesas@ragnatech.se>
 <20180829071604.ougz57qvpliwodep@ninjato>
 <20180829152541.GI15572@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kdxxijalhsz4iyoq"
Content-Disposition: inline
In-Reply-To: <20180829152541.GI15572@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--kdxxijalhsz4iyoq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

> I tested it on M3-W ES1.0 and it H3 ES2.0 and it works as I expect it to=
=20
> do, but forcing a retune due to SCC error is beyond my skill-set. I=20
> checked the documentation and can't find anything contradicting=20
> Shimoda-sans information from the HW team. So to the best of my=20
> knowledge this is correct. On the other hand I can't find anything in=20
> the documentation which supports the claim from the HW team.

Sorry for not being precise. With "verifying" I didn't mean at runtime,
but checking if documentation supports this information from the HW
team.

> If you have any tips on how to better test this I'm more then happy to=20
> do the work. Also would you like me to post a v4 addressing Ulf's=20
> comment or wait until we are convinced this is the right path forward?

As you say it is in accordance with the docs, please send v4 with Ulf's
comments addressed.

Thanks,

   Wolfram


--kdxxijalhsz4iyoq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAluG2WoACgkQFA3kzBSg
KbZKPw/8DCXjSt4To0xshUuw408Vx8WQzJ9btMFemuNP1UA8LiaufkPp0EyLjh4E
69LGaZFW/rX+NWQCWAT3mrb1JJ2fsHjzR5N7v7bcpa4K1igdUaDM6drp6ZrTAXe2
D0z9qX9EWuQnXDVIKrs7sNiL1jyn8naCHZN7Ty2j1XNoIf4EkUIQI+VMH7CUGBPW
nnFwm6TtObBAEPBDupoL1WvFK6yZQLEyoS1cb+It2D5XeIZ1FkXx8bmHE13jPq+f
DQBW7uW7Nx7LAkpGH6IVuicgqh74ysxyr+ISGPm8yjHMdd5hT1ASuApqavmmK7DF
9+kAzqblB2nRGDbY2xncxOTR603DslbKFte3fSOzWSXNxKqE/o+cWEBDi6n/onHT
K3nPxwjIweycRHv2mGxVC/ukEOuQNh5g9jEJe4LxILXTfZTMqf9GKHKo21mA4H2A
pwdT3eHYXDbM+XD4MvQCwvc/VgIp0uwxy1rZOiLF8RA4JL1V8ZIhXc30n04K/sgu
20kOh2A782+T/00Tpj54IZNfZnjGV8znmENV4paaFX4+djWnK1EaUC7hxIdFC8f2
fXr0wJn1M48HVkx3fkDYMA1HjZJ3Hr9chNUQKt08bT6gB6zgbAakzMs2J4PQEqeW
wwTGENx6AeoAr+Gliw0cv8n4M1hb5KWsJjYKIew8QGATgi0JBlU=
=fwNw
-----END PGP SIGNATURE-----

--kdxxijalhsz4iyoq--
