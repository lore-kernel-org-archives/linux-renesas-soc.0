Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:44880 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728676AbeKSWhm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 17:37:42 -0500
Date: Mon, 19 Nov 2018 13:14:11 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v3 0/3] mmc: tmio: fix reset operation
Message-ID: <20181119121411.dqoxwuweqhhjpaqj@ninjato>
References: <20181031230554.1660-1-niklas.soderlund@ragnatech.se>
 <CAPDyKFoRDvGht0GB-QJHcOAQzU8rZ0G-af+OeyuSyP+GufsQMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tnztuy76t7jxswc7"
Content-Disposition: inline
In-Reply-To: <CAPDyKFoRDvGht0GB-QJHcOAQzU8rZ0G-af+OeyuSyP+GufsQMA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--tnztuy76t7jxswc7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I noticed there were a minor comment from Yamada-san, however I
> decided to pick this as is and leave further improvements to be made
> on top.

Can I vote for waiting until Niklas comes back from Plumbers and have a
proper V2 applied instead? Makes backporting easier.


--tnztuy76t7jxswc7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvyqQ8ACgkQFA3kzBSg
Kbaj9A//Z+BWPdS7GgmTRuPemRPoQr0UHXilOEm427DjtebHX+dPf19ZMACxpa+X
P4LLuKjSbHGWLyWNrVYk5C3uJ8Jfs/YwyNayNKd0RLNO505rd7en1cBSnUbE6DJK
xcjI2qHZLnbySYm/CZrDfwB1tYCJdSYzwUh+4yDvJvEksV1qzjcyw/iIAgYCxmQ3
y8LExafQ20kLyySf50Vui8iDRi38cffZ62iI6yjevArkmpLZFkWAJoeuqRF+uon2
5gqbpRpp+lSg6Ibr9N3dU4TVroXhhEHmyNrGYuVTDxi/3ju0eZoVVSB1AvnKglrK
rnkrT2hBFLygusIdAWNb9fieNBreEmahjKEnbNjJ84P8+3sMPLAUldZl+iOqQCdd
WS7elXkAENGtxxJ/dO4N+RObqSWUXjV57pqmBaAYJAsw71eb8ZxXR7mTXGn+oSJa
0yToFwTxAa2rHmOWNCeLq7Ul6LF/ZmiI2lyPy/xyiAB4g2DwUNwRwJmxUjogkfos
XjF5ICHPe2BWe86Q0pEHN+YQXz3RFvsoODAqoC2HXfJKoeFpnpmTHyKdicCizRIU
TP9U+xSgqjqWO2mCNsRYeYqMOugB5+E5RX8AipEf7/CTwM1IsAxD04YL1WlJRxky
ImcNXT8Iq9++OWS2DDWvGTFz/A04kHHwWAEqMUuSAkEDICl10Rc=
=BWfE
-----END PGP SIGNATURE-----

--tnztuy76t7jxswc7--
