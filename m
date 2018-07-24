Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:56154 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388196AbeGXMZf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 08:25:35 -0400
Date: Tue, 24 Jul 2018 13:19:34 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v3 1/4] mmc: tmio: Fix tuning flow
Message-ID: <20180724111934.x4ni4nzrkfpyopoi@ninjato>
References: <20180717145216.16840-1-niklas.soderlund+renesas@ragnatech.se>
 <20180717145216.16840-2-niklas.soderlund+renesas@ragnatech.se>
 <20180724104254.oaggeurkkvnumbch@ninjato>
 <20180724105738.vl6zjipv4sqwlryr@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vdvuzmnrbuw3flcm"
Content-Disposition: inline
In-Reply-To: <20180724105738.vl6zjipv4sqwlryr@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--vdvuzmnrbuw3flcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > Simon, did I get it correctly, it worked without this patch for you?
>=20
> I think so but I would have to re-test for sure as at some
> point I had a variant of this patch in my patch stack.

Not needed IMO. We had this case already that some memories work without
this patch and some don't.


--vdvuzmnrbuw3flcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltXC0YACgkQFA3kzBSg
KbaRIw//Wsb1G0Wiel0HYSSxZcRFxxhl7ubv5PKwJEkMCLiXTVkGtv6YZfK2/6aY
OnHA8mRTge1oAfNI9y2I5aqllYzw3qztjjZ0wimvny/VJ+imMXTnP5aJTZ/c4Nap
42cG2iMDGlEdf2IhBzEaEUmn80Ci110JcAv4TY7qBXCy2hjcq2P4JXn+PSAldj+Q
G6rvFCZXlb7PgqXCPM/E/Q+pSpqsJ7wHejsKxeiWFt6DXLKXIlZxTKztW8VNJNod
zxaBdyF1rwTmhTOIKW8Tsn7S+iEokSMEXaFwDqHO3RysFhtP4ExWuSLj8ZXcfVKw
pJ/xPxiTbK1+99+eXef59ywMy9MtQyMM2UxBgo2Q3rP7wWpA63PsIuXhQSzZjc3D
z+0TxoJa2wS1q5bHVFTihgTtoXTelE70GLqOAbKtYlQf87JY7b9Iw9LK6wSquLGG
d8yfcD+s2ExWRCvG8JHxwbmHTGVTRab9818vF/WLy4zxguHbEn7t7l8vIg+g5Q3K
uxop2IGE1voJQBd+CU4TyqYqjJbC8WLfUDW1C4aguJs9+47kV2B98vPsZYauxYzg
2sIM0g5kQ/ZUdK0wagDynF0r2sfhcSJgWqv3WS8uoAjW8wFaFtds5NpRMdoceu5k
jWieOsH+dJPxhx/bsxXyIls0+XBXvYXaCJTDIVzIfxUznopDI5w=
=DYNT
-----END PGP SIGNATURE-----

--vdvuzmnrbuw3flcm--
