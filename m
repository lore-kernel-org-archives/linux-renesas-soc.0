Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:46088 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728671AbeHFWUs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 18:20:48 -0400
Date: Mon, 6 Aug 2018 22:09:59 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v2 1/2] mmc: renesas_sdhi: skip SCC error check when
 retuning
Message-ID: <20180806200959.eugdzk632o2xp6zm@ninjato>
References: <20180806142847.25971-1-niklas.soderlund+renesas@ragnatech.se>
 <20180806142847.25971-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="z3r5kqiynyyk5p5y"
Content-Disposition: inline
In-Reply-To: <20180806142847.25971-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--z3r5kqiynyyk5p5y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	    !(host->mmc->ios.timing == MMC_TIMING_MMC_HS400 && !use_4tap))

I know this comes from the BSP but I cannot find any documentation why
ignoring SCC errors is different depending on using 4/8 taps.

I'll try to get more internal information...


--z3r5kqiynyyk5p5y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltoqxMACgkQFA3kzBSg
KbYq3Q/+MzE4EF1KMxCeJ2Ew00Q54k6RzSFnK7a/1bY8vPMPk00TFxjnYlmG0FkJ
JeADeWUpH1nOpcG6RykQjSLpe/NI4jySFZXzLWGxWhVvY3BK8kPezvyr7oaGDfli
3LmMYTCl5y1PO1zinKzObutRYX99eMXUfaTy6IF+l62btfEGDJbthwE7Z2CFl8bY
xAsMKsj36EwXfzrscf6mj+HPlcYbcAlecPPX2XQsJD8LYUmCRtWy+FSTNQPfZaXu
u9a1n73Fgbw/L9JVVtxvDacipIiGJElS8yGEra3uz1sY07QE5afWcg/ZOlOJHFGg
onPSm1G4Fb4rW3LZovqNpEQsHzWpj5UbMPBUF5CzmUlhXnsCjU63en4UVqdKYQ++
BlTmGnnyftzxtY4apZ4DDINXExLrc3teOhWp0yTPW47vX1ldOKsMIPeD3TQN51Ih
y6QHJbDq6NRxTGlVs1cjkiQm29Hf+gdZz64+smo3zZn9W1UCBPcHpKptJkER1vem
hzSFXwou0YJC2ZHVQVgZ3ctAvNJBPmUKbVapabSoLJK5ZWTfE1WvL/jlYaIXZN3L
Px5Ffan16dmP5iXK06bRE5yhFsZ6bwVd5YVacGaY3l0WVlOv9QbYGSlFU/2L5cyX
gbkLqLoYcS8o0LmX7IShSeGGO8QJQA8McuKJFK/tl5An7K5hCXE=
=LYvF
-----END PGP SIGNATURE-----

--z3r5kqiynyyk5p5y--
