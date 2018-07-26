Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:42330 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728957AbeGZIue (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jul 2018 04:50:34 -0400
Date: Thu, 26 Jul 2018 09:34:59 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH 1/2] mmc: renesas_sdhi: skip SCC error check when retuning
Message-ID: <20180726073459.xuxld3fn5g56pvjc@tetsubishi>
References: <20180725121031.24277-1-niklas.soderlund+renesas@ragnatech.se>
 <20180725121031.24277-2-niklas.soderlund+renesas@ragnatech.se>
 <20180725122106.jzv6v3j2wrtqrt6t@ninjato>
 <20180725133643.GE14991@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jxxoresxgwsbm3f5"
Content-Disposition: inline
In-Reply-To: <20180725133643.GE14991@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--jxxoresxgwsbm3f5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I agree but I could not find a neat way of doing it. How about?
>=20
>     bool use_4tap =3D host->pdata->flags & TMIO_MMC_HAVE_4TAP_HS400;
>=20
>     if (!(host->mmc->ios.timing =3D=3D MMC_TIMING_UHS_SDR104) &&
> 	!(host->mmc->ios.timing =3D=3D MMC_TIMING_MMC_HS200) &&
> 	!(host->mmc->ios.timing =3D=3D MMC_TIMING_MMC_HS400 && !use_4tap))
> 	   return false;

Yeah, it's not much but the best I could think of right now, too. But it
definately is better.


--jxxoresxgwsbm3f5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltZeZwACgkQFA3kzBSg
KbYQ+Q//Zy4gwt9mtpqIMykYhYGKKE08Mi+FCBMxitM7eyVp3mfjNZR87NH9Y1gg
+IdSeI7RU5rx0Vwq3G4qus78xSWEEsahuF6jQzFNZVZ2jsWI72L6/e3FYS0UqnPy
WMQMNceXneVijUkeIeDaN3a0dDQ1Vdh+d5daRcxJwr1wK3d/dh/1ReHSGjZny702
sWbqkrKFMUwYABeSTTXkz6M1yhZ/1RyQYv+MctVaamcPlspN5FD01nA5PCAsE7KN
UdJqZ+er0p0trkV7ezwEbKacUpozIKhGe5pTWFR30B10OREV33BqLMjRFPbgV7BL
ni8RruHRs8Bv+49+j2QW8XZIpEMhAs5lpQECWM/P37TVAIAmcpxxLPkq0u6QJdEz
haE1CKAVRDv56FqrgugjIKjuPwuwOHD65ra4s3ZCENIj3VUceCVDHjdJ7wIPavo5
MCzqH8qOpyKo2rzeR5jciVF3miubQbLDwKlgEPT28uCWq8eIq6fEoywY4v2sY14f
bsKvhqiheVe1Y4yevCeT6SKo9keSw4IYt2n22vGxM/Zxj0AQRpCoqB9OY4QGReZ/
gloe4OVGweIE0zLQ85SK9Q/FfBOKHY498G2SDAVb6n1BoWBFCsOoo1SoMfATOtk0
RrzRv+htH+8t28Czo9TtM3NdOl+g4HujD/gpWVwYRavzxTH5MKY=
=f+FH
-----END PGP SIGNATURE-----

--jxxoresxgwsbm3f5--
