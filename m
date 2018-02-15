Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:54944 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755267AbeBOKTq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 05:19:46 -0500
Date: Thu, 15 Feb 2018 11:19:44 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH V2] ARM: shmobile: stout: enable R-Car Gen2 regulator
 quirk
Message-ID: <20180215101944.qtiquqqhgmg3gbrt@katana>
References: <20180215100208.24646-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdVO7sxRjj7h=ar+bA8B3Art=Yyyr66cRqC30pw3Zz+Vag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="okvon2ifontjmuij"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVO7sxRjj7h=ar+bA8B3Art=Yyyr66cRqC30pw3Zz+Vag@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--okvon2ifontjmuij
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> As the code now always sends 3 i2c msgs to all 3 possible regulators, we
> may accidentally talk to another device at 0x70 on other boards than Stout.

It sends per device, so unless there is a device named "da9210" at
addr 0x70, nothing will happen? Am I missing something?


--okvon2ifontjmuij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlqFXsAACgkQFA3kzBSg
Kba6vhAAhwOgqPhIItoD96rFZr9dkVgkd5hRL6aT17GW/Mn0O4SAynAOVygZeTJm
Kix4//If9mS9KeYcdMJaeYPmmAlg11oQGZR8JDxjAJ75J5zUcshdiTUgbAvnj+js
vS0naDKUJvETRDJJwhhYpPGvGXQPdZ9ZeeG0wuogZ62wjALYEf05hIgAv4b2hubJ
+SBYb7dmyod9nSHvaxlBFRLLzaVd2b9nS+65bwFDX+2dNmY4Qb0nlcaSGMpEvwlx
j/KXAtoobaijWKMpMqT+oJRxKY2B3uWmwy5O+EvZGed9P3vFcMEGvlgXpnnqrP6h
n5M1W6n7r0YF0K0BLe4sZWThmhz3iUojKaUPfex0FcBGhI+Ep/b3rdbHRvkpDEgB
GagAOKqhogNfkArh4eAXCPT5UP8nsAi14Xmm/utGex45r/JbwPJ+Tg+Kj8h1ADk5
TBczKL0DwhaGyTnF/ngNN8RBpXFFOpI3ifAzo1AwXxRRUDbMUDdtXyZqBAu6hI6Q
5UHD4mEn+s879YFaTCiz7L8i4eYr3RHq0rN/eh3IwTUbOFobF6VnaQmmbRxP8ar+
i7+qfxbHg8pho1cQ/KY9zEd33jIuKVESL/oOYGO4kngvS+1MZ+YQHvlGPuY780JK
GGShb7xDNPbQ7JOO8nFTPQ94uJb0rd/d3UgQaaz7tT0fXkuiL3Y=
=rPgk
-----END PGP SIGNATURE-----

--okvon2ifontjmuij--
