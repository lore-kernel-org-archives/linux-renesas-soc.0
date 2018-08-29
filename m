Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:44620 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727156AbeH2LHh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Aug 2018 07:07:37 -0400
Date: Wed, 29 Aug 2018 09:12:04 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] mmc: renesas_sdhi: handle 4tap hs400 mode quirk
 based on SoC revision
Message-ID: <20180829071204.sjxbmwmsivwiitwb@ninjato>
References: <20180806191227.28401-1-niklas.soderlund+renesas@ragnatech.se>
 <20180806191227.28401-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdXstt90ZEOv5nxgDd5jV_Ux98tsYoVr_U=hSZrHYb=dfQ@mail.gmail.com>
 <20180827152911.GE15572@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="u6pc5iygb3i5zpjc"
Content-Disposition: inline
In-Reply-To: <20180827152911.GE15572@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--u6pc5iygb3i5zpjc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I think this design is less messy as the quirks gets added in=20
> renesas_sdhi_core.c instead of needing to keep=20
> renesas_sdhi_internal_dmac.c and renesas_sdhi_sys_dmac.c in sync with=20
> the quirks.
>=20
> Wolfram what do you think about this design?

I wonder if we can improve it if we base it on top of Yamada-san's
latest patch series? For example, I never liked TMIO_MMC_HAVE_4TAP_HS400
which is totally Renesas SDHI specific to be in the TMIO_* namespace.
Given Yamada-san's refactoring, that code went from the generic TMIO
code to Renesas specific code.

I am sure we can remove TMIO_MMC_HAVE_4TAP_HS400 then, and wonder if we
can't add a simpler quirk handling on top of it. The latter is a gut
feeling, I haven't researched it.

Niklas, can you have a look?

[1] "[PATCH v3 0/6] mmc: tmio: refactor TMIO core a bit and add UniPhier
SD/eMMC controller support"


--u6pc5iygb3i5zpjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAluGRzgACgkQFA3kzBSg
KbZ7tQ/+P/97fXTi/1rVGxEaKjCKSPFeiopqvdCyM3hmlQldWj1YahzIcrcYF6aL
sy7eR1O/9eFFEC4RY79ESgwL+zKFsdxbomxDR/jpuxOH3CWu8zGzxAqRosJcPDgS
JuAgq+56xBNQACeb7UJFB8iLzOZwYGkyw/l7uDIYHwD9Lov2o0HXBAqsmC6Fvr0V
h5oOniHAzaKBINerorR7ZXNOJc3fN4s4zKm0GRDa0H+DhfAAb/SuCiF23k3KkUSQ
1soc5dCV6kvUIIa2vKo7Vp5lqyJPh9h4qxfwBxDb7u6eFX6311CAj585ecHCBKdS
s/3CEpIxBzHY/Y7+6SlOPK3FTN+NLw/K10fLWilG6kbTM4va7WHE9N51jcta6HVw
UcZ7nP2bFY88mm/1/4geCxD8PUauJRGTNwAzMGrlk52KknEchxzWsOHl7wf6m46L
+OOnkzY61ZBIWRHN9AqOEuB36mKmuihwb1mpRrqiO7XeMuEPeYSnNOjr+BfeNmJE
fDip5GISIFMQM3oCyA3lPq64IdVTSr+CNcNd0RKjV4PUI4RNBVyF6CB/25JK4NHJ
0CeEuY2nkSK6ls97Js7Ur75wWGJ8EMrf98CEiPnWnw6xwlXgyBVwR7Etkh5uX3Bb
5+QJqFdxfUBzS4rzk0+iwSWyuji60+fQ96h38rgrWDkueD/uDyY=
=Ehs4
-----END PGP SIGNATURE-----

--u6pc5iygb3i5zpjc--
