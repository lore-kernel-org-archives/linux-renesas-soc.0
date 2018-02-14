Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:37298 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752252AbeBNF6D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 00:58:03 -0500
Date: Wed, 14 Feb 2018 06:58:00 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] ARM: shmobile: stout: enable R-Car Gen2 regulator quirk
Message-ID: <20180214055800.od5yhgo753522yah@katana>
References: <20180213232812.31408-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="owor4iu7dwhtabmf"
Content-Disposition: inline
In-Reply-To: <20180213232812.31408-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--owor4iu7dwhtabmf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> - * The r8a7790/lager and r8a7791/koelsch development boards have da9063 =
and
> - * da9210 regulators.  Both regulators have their interrupt request line=
s tied
> - * to the same interrupt pin (IRQ2) on the SoC.
> + * The r8a7790/lager,stout and r8a7791/koelsch development boards have d=
a9063
> + * and da9210 regulators.  Both regulators have their interrupt request =
lines
> + * tied to the same interrupt pin (IRQ2) on the SoC.

I think listing the boards here doesn't scale well. Gose is already
missing. How about rephrasing the paragraph to something like "Some Gen2
development boards have..."?

>   *
>   * After cold boot or da9063-induced restart, both the da9063 and da9210=
 seem
>   * to assert their interrupt request lines.  Hence as soon as one driver
> @@ -118,6 +118,7 @@ static int __init rcar_gen2_regulator_quirk(void)
> =20
>  	if (!of_machine_is_compatible("renesas,koelsch") &&
>  	    !of_machine_is_compatible("renesas,lager") &&
> +	    !of_machine_is_compatible("renesas,stout") &&
>  	    !of_machine_is_compatible("renesas,gose"))
>  		return -ENODEV;
> =20
> --=20
> 2.15.1
>=20

--owor4iu7dwhtabmf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlqDz+QACgkQFA3kzBSg
KbZwgg//S3mw65YHwhz3JL+kTJkNsizbtkSUz3n9aWv2oi5C5TZTrI9MjFtPXvp1
7ImVwWAAmJurS1ps6z9Zk0y6l3QAVSFlGGHwa0yMvBwkGxDhr76E2V+rBYuxZL9w
yq/WENtnckRGw1SPIQuVkDrVm8VxHUYAmit7I6O8zfvtu3wlavHez7sTbLYeiS/u
ANSK/ds5OCJiBO/23ngDd2aPvyCMqfMvhxX2Ofjh0ecExGevPCiM4o0/fZSYD1N/
Hmoz8cF5SbXVIUjFiG/0p6gnPVZD+Slc+rXGcqnui73PD1YOurrteL4wvbg2OQrw
RviX3ggcOz+j/3uEK2Y1XdQuMFQuapKKjNojj55BmRxykMN/a4qRPSgKxLbyGt9l
4E8UrMtci2hIjMf0ABJUPI8nBivMHd26CTmvDSF9biqPZMyEYWRlIidTyPr9jJoP
SvHvUn9sDX7dnNk2TYHcWsHibtUPi/JVlffq3vvef39/aWPhHaet8FIN9uBHqWQ4
NGbUB69tSWqzxPRpByvf/86JO3SAJsBk98IF/WppkMCUi4yY5pj21wk6bn82R98n
9pXPlt/jKtMMO/G3T+ew8xHoFSxOySCWtKKOD9rayTFsWVHAq3qFMd+OorZBI13j
aQFszuzkKKQ60ZnP7Xdk9YWVSRmw+S8fFm2e1/4etHvvWrLKiV0=
=Q6wg
-----END PGP SIGNATURE-----

--owor4iu7dwhtabmf--
