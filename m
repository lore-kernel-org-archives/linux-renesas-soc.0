Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:60938 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726089AbeHTUlS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 16:41:18 -0400
Date: Mon, 20 Aug 2018 19:24:46 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: add R8A77970 to
 whitelist
Message-ID: <20180820172446.i5i6xxhgdm5hqwwp@ninjato>
References: <fd225e1d-5215-df96-055a-07c9a14f41e7@cogentembedded.com>
 <20180820164236.26nocbvtr5scp62v@ninjato>
 <6968b8d4-edb1-c8ac-239a-26278bc7470b@cogentembedded.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kjda3o5h7iaieuru"
Content-Disposition: inline
In-Reply-To: <6968b8d4-edb1-c8ac-239a-26278bc7470b@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--kjda3o5h7iaieuru
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Nit: some strange double spaces and '...' in the commit message:
>=20
>    Why are you so hostile to ...? :-)

To me, it has a meaning: either something is to be continued or the
sentence is intentionaly left open end, so the reader needs to complete
it. I see neither fit here and I don't see any extra value over '.'

Congrats, you got me bike-shedding.

>    I ndon';t have the datasheet handy but I don't think it matters -- the=
 board
> only supplies 3.3V on both chip's voltage inputs...

Okay. Pity, would have liked another test report for HS400.


--kjda3o5h7iaieuru
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlt6+VoACgkQFA3kzBSg
KbZTqg//dI7JWGxkGA2C4SEO4wxlVcvqKE3ALNKIq1y2WpjxP0hLFHcfhQrhq6so
idExyLBtsmzEdkcR7IDQ8EVNiSc2rgMLuIChhADr22lnfyvITvOVx5kwjTC6tBkD
aMnGM3o8JFxa5gvaV2D2G6owZbGdi/zhB6BwV/ScL5qE4DT2VyLTsmlpQlhMP1OF
0Vr6TKCN9Ts9lFNXO4n0uepBW7Nwm6ymT+NK8csEXgmGrGBPHrvIn+gGXnw+ZLoj
AKWhg1wtOd6vn+LOGWFfLqofBpbonaHLPSqr5ak3crB+gTHvsfoCpjFspuFVAYnM
aL5pYL456l1tcG3mV5BL3cJbh+LytC29leC/WlvEgIhCO5qzvk0cRQQ1z8mgHvoN
dMu6kmAkiPzc2BE9eYF62BBFKTytf899QFl6JE1RU/QM0KcriFB4mZjvePsdZT2O
ejs+KtflmysiNRztzFVYHRkj/aJTLcLaZTKrQ8L1DKmPqsgUuliBVyOE7mnZ75Zs
boXpSF421hBbhITH9afNPN9aSk98zGm5EQDD31PH/ei4CmHAsSbt/CY3XfgmvEKY
bnOpvGPL5vwyWk/J+b2d5CZvO7qf4ZfRKFjIXbZy29Gwnia8k/TQM51vaSM32dFS
hrkGa63BgBuEBVMxMwlPpp0mM2MK0B38E9Hy4ybwKCtBMk2ej4k=
=eJZo
-----END PGP SIGNATURE-----

--kjda3o5h7iaieuru--
