Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45136 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728923AbeKWAqc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Nov 2018 19:46:32 -0500
Date: Thu, 22 Nov 2018 15:06:59 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Marek Vasut <marek.vasut@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] mmc: tmio: introduce mask for 'always 1' bits
Message-ID: <20181122140659.GB1070@kunai>
References: <20181119131357.28648-1-wsa+renesas@sang-engineering.com>
 <20181122140255.32z7xi5o5aba6u5n@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Content-Disposition: inline
In-Reply-To: <20181122140255.32z7xi5o5aba6u5n@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +#define TMIO_STAT_ALWAYS_SET_27	BIT(27) /* only known on R-Car 2+ so f=
ar */
>=20
> The _27 seems to be odd to include in the name, but I assume it
> was the least bad option you could come up with.

Yes :) I am open for better suggestions.


--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlv2uAMACgkQFA3kzBSg
KbaWQw//Ydr/wc1TmHsH4waMItl7yVw1V21VGBiSW/i9mxGBlaSvdq1Fn1ZaHaWW
03KDyO8CaQ71s+q/RnxP2YMunmAHfxKi46cCTfE7ppXtV5oLYVp15YyQqVxk41L5
NcEtRsHRoBEHoV8gQeZAgEBrzfvQSnyCRT6/sg1DIVOQyV78qRCGflopXqvZA9/e
b503XxLFvOjpiKnDgPSXPlg5/ARWE4XBtQaRoX+eFvoy1R4Tx4dgc7KEurNMFFIQ
rq+7qKtvVddA9VTwUokb1Wtm3gZ2eWZGKNSw/BAFFV9TsZV6sew7JpEEw6l2uzOh
KEuiBONqs9puz5dqRMY+ce8dn1GyK4pD7Y1hYweBc1rBU5n4ztIzZgyUqEfZWwRh
hIGd6P5uwHidm3OTCVwZU81va/oUYAiADkyHWMwjTcZnwLIN4GF3yiAzZ22beL99
pfO5COEg9f09k9ZJJgYlw3cy8J/Lu0ev4aH4Q7yb9PEi1j08NKKSdR8n48p4lQVj
XHTEgXk6IUtAk+ruVWTFea+1QoxVR263UN1jVGP5esAim0GwScaKZmxZ6Q5o935t
ua2RJLuq7ueC3Abdnk8+yFy5RwXNqXU37SHSwVnZBdoUfPZ5o14vkzwRaYhqzFu5
lcmEcbBEHYL5zxs1q3jN5P8CF/YUEFgUcWebyKa76saCVrQ7uLk=
=ahF+
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--
