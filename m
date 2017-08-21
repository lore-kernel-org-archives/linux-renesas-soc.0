Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:52008 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753433AbdHUNrZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2017 09:47:25 -0400
Date: Mon, 21 Aug 2017 15:47:23 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: Status of r8a7795 SDHI support?
Message-ID: <20170821134722.GA5226@katana>
References: <513dd4ea-7309-d2a3-7940-b14bc1836c31@de.bosch.com>
 <20170817072921.GB1423@katana>
 <fd4fb97d-9284-f2fa-5719-e28e6cc2fe20@de.bosch.com>
 <20170818090042.z3jx6rufxuc56m2t@ninjato>
 <32eb505f-b622-2562-e6d0-818c6bbab32a@de.bosch.com>
 <20170821081808.7teztwh4hbz25zjq@ninjato>
 <977e03d5-f59d-b41e-9135-fc6dfc19482d@de.bosch.com>
 <06bc290a-8173-3d41-ff1e-8c26b4d4c093@de.bosch.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline
In-Reply-To: <06bc290a-8173-3d41-ff1e-8c26b4d4c093@de.bosch.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> It works, now :)

Great!

> tmio_mmc_init_ocr()
>=20
> fails (silently!). And with this the whole RCar3 SDHI, without any error
> message.

I'll check next week about an error message there.

> Many thanks for your help!

You're welcome. If you want, you can even test SDR104 by applying this
patch:

[RFT] arm64: dts: renesas: salvator-common: enable SDR104 for SD cards

It works fine here for SD cards. My SDIO card makes problems, but that
might be the line length is just too long. We are currently evaluating
that. So, testing SDR104 on various boards would be very helpful!

> P.S.: Will try to send the pin mux patch tomorrow.

Thanks, I'll have a look at it next week then, too.


--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlma5GYACgkQFA3kzBSg
KbarfQ/+LARbR7hhb3oy1ugF17xrIhIHKkqi6YEt4ARRmry2BQeVAK9E2aCC4BiX
ckCk53KK7QObSIBwljJSIKzM+/aKcIvtvlox6NLAZ7m5s5OSKoccRKZ3TSlJ+RTV
Io8pRdRRqXQ4Cy2NbQhNEi1kXBo+lAybxis6ILwIFsxHlT6C4/1iJd7Sbph5rRTI
dtRPacmXsWV5+dY4w6URA1CDsChjWu2NF9DXZCEJv+QOcQeJ0QdeXh8z9oDo2mRk
Tq3kjOPN5cdMxqh0Cz3adyx61HWrHtHF10+dR5uglW6qtGGKY3I1TuZ8rMX/LZyk
82w48jXlRnL6TGknTAWm70IwaGLdUgI9BOQgpVk+Az6PUFTdf2UGl6RCIM9h9in0
MWQQ0a7lnglKOe7ck7NSqnvYXc3/xJxXASV4OhGEYPaH+J53TukpjYWrK9ddjwl4
vI7Sgc0STh9p7mbnkvKpTb4si2SRENklpFyYqCfoY1jom06chWvcLF08Zx012lus
QcCq7TuV63VHK9qUra0tmvejNMI7i/r8PdGIIJBlLxRsYhKjO3Dg3WCsmGBEHp44
VnbmfWZDBvZhoYwnxVgeL+nsxw3802kgNnG1QSpzlQ8XAsstjXRwdUprZBLdF1av
uonBS9Rsjkx3rLMuSjkkQu1BBBogQ4STaTn/qerMIGlcBt1rFjk=
=rgdz
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
