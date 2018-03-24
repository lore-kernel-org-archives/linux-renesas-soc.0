Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:41108 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751894AbeCXNFi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 24 Mar 2018 09:05:38 -0400
Date: Sat, 24 Mar 2018 14:05:36 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: fix mask value of prohibited bit
Message-ID: <20180324130536.56kez4wh72snuzub@ninjato>
References: <20180320210414.6070-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="22btng45yxyxkfcy"
Content-Disposition: inline
In-Reply-To: <20180320210414.6070-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--22btng45yxyxkfcy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 20, 2018 at 10:04:14PM +0100, Wolfram Sang wrote:
> From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
>=20
> According to documentation, Bit 7 of ICMSR is unused and 0 should be
> written to it. Fix the mask accordingly.
>=20
> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> [wsa: edited commit message]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--22btng45yxyxkfcy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlq2TSAACgkQFA3kzBSg
KbZg0A//R9exMQ6gHSrTC+Q95MDG2wRYLuSacNMqW8pWl7EiWXWHPXLRiCP7eIfo
4O9NzQTemIB5EYt9YWjqvHOXHUW8KsiDgg8qQJ6JIcpHaG1v8NzOJIWolqx/vMVY
alPCCNPIp+OulUTOHIeQkynRUrPtFSD5JzKG9hxQdC5y0ZyJ6NBRXb8ir1ITkDzp
ibkA0HJareSXMx9TAbcOzYPE5DSccQbrRtpwWu1E1Ikh3HBcQBF9a1Ik2wdeVB2f
DpVYCkX5fhHW0mpuS9kKYHbv2FolUs3y8cJjJATJXofVGw3OY9FkeczWoPQwF6cM
6U/VxmkyX2ZNwWlhP3PX5L8uNuvRfbKcuP+IjRMFc86CCgc1LRB2xAEGOhinZsZq
deOIJ3JTFOkCE0MLGneNdh4r6n99VoGEy7SO+DYo2WCVY85ULAX9IEi+Fh3JxeVC
6jb2Dh8TEJa042TGRm+zT/SZB+HDDtOiZaMCBI5XyxFWnv0Duuv1w+q8S4Vp8Q2B
C2f2I/qlBb7KrtNUjSqIMBYg2z2JiHnk7PO8pKC2Kg4TK7Wd+ghx58+G59UcVd5b
iF+jGT/ohzLnC09wUs2KnXjZqUligZPbrrsovhnhZBgRLsPtIM4HWY562r91Qdwl
OafPOo1Ftz2yOs1zXqYY+/aQ28EJOsE0y6J1gCwaBTBJ7ArH9KU=
=GWwD
-----END PGP SIGNATURE-----

--22btng45yxyxkfcy--
