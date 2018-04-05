Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:40400 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751419AbeDEQUn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Apr 2018 12:20:43 -0400
Date: Thu, 5 Apr 2018 18:20:41 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [RFC PATCH] mmc: renesas_sdhi_internal_dmac: limit DMA RX for
 old SoCs
Message-ID: <20180405162041.7say6yrc4vyzvb72@ninjato>
References: <20180404164507.3394-1-wsa@the-dreams.de>
 <CAPDyKFpAfBELH1fxhPjYrOm0bUxAri1C6gQj9kxHiyS7aV9Uug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xpnxbcl6qtjoly7t"
Content-Disposition: inline
In-Reply-To: <CAPDyKFpAfBELH1fxhPjYrOm0bUxAri1C6gQj9kxHiyS7aV9Uug@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--xpnxbcl6qtjoly7t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Shimoda-san: what do you think of this approach? Please note that I did=
n't
> > remove the 'revision' from the whitelist yet. This will be done increme=
ntally.
> > I thought to first fix the data corruption issue.
>=20
> I assume this is material for stable as well, right?

Yes. But I'd like to get Shimoda-san's confirmation first.

> > +static unsigned long global_flags =3D 0;
>=20
> There's no need to initialize static variables to zero.

Yup, classic one :)

Thanks,

   Wolfram


--xpnxbcl6qtjoly7t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlrGTNUACgkQFA3kzBSg
KbYDlw//RVbgZPXH9R1XAvY5ekRBh1hMi7tEjjlYYk0cyjInvjcN/rU95fNWneAo
81YBjB18wTN276SPTaBcvBoLcKqxfclmi8W5tDcFQitRSWxgaY26qnHX1c8tRNLB
hywt4yVOiKBOMiKwOPycLr5i8lRIBYWmhws8HEXQy7URnqeCmqa61E9Lo8vQGDH+
CD2CunqcC3ow5PiS47JqBAaXhutj45icUfKKX4oN+rkC5ofcjjhoiyqUf0p5F8Ua
pKa0sLsLPTTIdswHIZniDdCs047cgZDVQtxYaGm3LRvP3rrnRyM3A+wKZ/6pnRTl
NThpxQczhmGFcO4Vh04ORt5VzxpJ+jbKX8K/1oexfzIiHXtc2ZBRO0Xd9NEK9YNY
z34fWmH2mv/OZYETV+qLZ6ZQ93cEnRlNucCmNayFQBa38v4YIliCUrBsRrjwE7WU
K4+G2A6y3Gl0JSYHHG3Dn/nynT2eZoZrOGdmCVOZ3jVuSwPVFSPferJtPxGAeeij
uFRPOMy6yZKADydLWZHWHMbg+7zVh+AJlPhe++sj65YCx4NuRpVtu8iB2NGzRUvL
hBoaJMep8hQwe5Zttt251t/5qX37E8DD83TNBrgJHIsxxf2TvUz+B5kuaQI8RJMt
R34Vt+riRZwcpXJWtFz8aS8p+jR6Rf9/f+6Uc8cvosMQ9Cqh04c=
=LyfH
-----END PGP SIGNATURE-----

--xpnxbcl6qtjoly7t--
