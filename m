Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:53268 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394867AbeKWX7t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 18:59:49 -0500
Date: Fri, 23 Nov 2018 14:15:38 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Marek Vasut <marek.vasut@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] mmc: tmio: introduce mask for 'always 1' bits
Message-ID: <20181123131538.GA1018@kunai>
References: <20181119131357.28648-1-wsa+renesas@sang-engineering.com>
 <20181122140255.32z7xi5o5aba6u5n@verge.net.au>
 <20181122140659.GB1070@kunai>
 <20181123125731.ysjtgl65uunelpul@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline
In-Reply-To: <20181123125731.ysjtgl65uunelpul@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > > +#define TMIO_STAT_ALWAYS_SET_27	BIT(27) /* only known on R-Car 2+ =
so far */
> > >=20
> > > The _27 seems to be odd to include in the name, but I assume it
> > > was the least bad option you could come up with.
> >=20
> > Yes :) I am open for better suggestions.
>=20
> Simply dropping '_27' would be an improvement in my opinion.

And if we get a second one later? Or make it a mask then?


--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlv3/XYACgkQFA3kzBSg
KbYeCw//aobiAQnM3i2wEefzJtvLBySkx7hp6zq517HPyddgy/c5vpLYczuNqqZu
Aydwu6FR543HyM+hc5S4aS1cawZmFc2r2o9usdU3c5AClrbzaVsXhIpWEpL3qvkb
SjhPuQG9kK456xvzgIInJBns6/y2zpNAMMlJ1wWp5K+uROubJlHrXS6QBnhQhyeo
1cYRkKl310cBRE6v4CqHX99kRauKH0jGvUSBmxUBgJwQpx8gKkcQ3GvCvMO4uB1A
aof2D55dNJ/bUXRfaICYKkYNMc1LmzwoAFwJVSMdR70lZZZCxKteIpqsbWhT/C+Z
udZ48Mgk97I0Z9zedUZnuUNhOq+7fctrHuER1+upldei05WkOB7Vc+dDYKZC8Ubi
3kCEPww9e3ufAWrg/JPXa/o3ve4xvhHNTwXhiOf9me4EpDt/tlJlyC8L5P3SuwXJ
huo/ktAE5FxDPExnbdeela7E2A6cv1ixXGbAW2PT0VKG5jQM4m6+qkKm6vNOLYQO
YbGMKwDZsRIoEPBVB8MqrIU4aT5fsAPkTZ2705L4mVtn6dktkuKIicdJ/URYxf1H
A9/rVRvY6D1ef7StVkiF2XzznLLaGbFcgnyQiYGuf6uPcGfUOLATtFUx0ktfAs0D
dCz5KvcAifjduNB4sHUNwLkSFWKrkHkFVaHM+q/w+ZoGKkKNbCg=
=lyjR
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
