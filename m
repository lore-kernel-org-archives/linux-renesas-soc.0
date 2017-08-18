Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:34975 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750729AbdHRJAp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2017 05:00:45 -0400
Date: Fri, 18 Aug 2017 11:00:42 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: Status of r8a7795 SDHI support?
Message-ID: <20170818090042.z3jx6rufxuc56m2t@ninjato>
References: <513dd4ea-7309-d2a3-7940-b14bc1836c31@de.bosch.com>
 <20170817072921.GB1423@katana>
 <fd4fb97d-9284-f2fa-5719-e28e6cc2fe20@de.bosch.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ehqe6k75so2vnpyt"
Content-Disposition: inline
In-Reply-To: <fd4fb97d-9284-f2fa-5719-e28e6cc2fe20@de.bosch.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ehqe6k75so2vnpyt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > What's the status of SDHI support in mainline and/or renesas-drivers
> > > (renesas-drivers-2017-08-16-v4.13-rc5)?
> >=20
> > I use it daily here, even with SDR104 enabled.
>=20
> On ES2.0? I wonder how if not even the pinmux is there ;)

Ah, ES2.0. That's the missing information. Yup, is on the todo-list. I
will try to test your patch on my Salvator-XS board today.

> 	mmc-hs400-1_8v;

We only have HS200 support upstream. Other than that, I don't see any
problems in the DTS snipplet.


--ehqe6k75so2vnpyt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlmWrLUACgkQFA3kzBSg
Kbas5RAAq1wFIAijpulVznIGiCPUJu2s2gk09JBqw0iL7UBL93c6NuCAAVaqB8EJ
dfCKi3yjWCNKGBG63zYWGGJcl6IB97DpYzaI2oQQqeLVrPAEccBeUVrKcikibeHb
cZijd+z4/py6YesxKPBCQXiuFy1TgLQvNQqFgV32k6Ff6TjlVwFigdKpl+cU5c/k
6oznIC5NOicRLuW5MuNFL/dDlTGdOdWnRvs13mfpwJWZxDhuXlqldkZP7JUdGxxY
SgGGbu/jNoQ2EJyRo/run2tKmlsd44DZouYSQxInc4xu7nCOlGptgX8IGNlVGORb
M8a1Fg4jsxX8q+GARcs+FcHyGl8Pmu2Xaum9DFfJgreL0BN52rfGvFIuKLezOjg8
BoXXrHpjxePaZZ3SyErhX+0C3loETLVP69YKAjmW0cztv80kGVVy+mFHM3q+gREv
/2HRnOp3WGMgwnLhIt2n/Gl7WPNRCW5Sw4nEQeZjee5BXe3GVC238DbABsoa18BD
y1f7W1tlM73EcCoF/qmrOH7isJx0Z4bbJE2FVqPB4oA7uhj1ESxDaSktcbxB2BwA
xQZuPOFBcNdjUiTU2AKhRGsYATIFcPxKFrg5jAXNvBT+4sRp3DZTftfQ0KBqF+Hc
+4+4qZHadYjGE0XxkEVugNUCovJyirKzKzuRqUq8oxtw8yoS74g=
=C++u
-----END PGP SIGNATURE-----

--ehqe6k75so2vnpyt--
