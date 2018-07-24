Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:55070 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388487AbeGXJpD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 05:45:03 -0400
Date: Tue, 24 Jul 2018 10:39:39 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH] mmc: renesas_sdhi: Add r8a77990 support
Message-ID: <20180724083939.emxh26j7vumuc4du@ninjato>
References: <20180721111449.10103-1-wsa+renesas@sang-engineering.com>
 <20180723161719.zlalebcsp6uph3dp@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gdicf346niubedeh"
Content-Disposition: inline
In-Reply-To: <20180723161719.zlalebcsp6uph3dp@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--gdicf346niubedeh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> 8 tap support is included in the following patch which was accepted
> for inclusion in upstream (search for 4TAP):
>=20
> 26eb2607fa28 ("mmc: renesas_sdhi: add eMMC HS400 mode support")

Wow, sorry, I missed that :( I thought there were only 8 TAP preparations
in there. Cool, will have a look...


--gdicf346niubedeh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltW5csACgkQFA3kzBSg
KbYCUg//XeOWR/rZ99Llj1WLuXSi9MJwiUFuCT/Y5evRlqrAlFEZAlkeTsrNnqBd
dp+NUOb7bhtSqBjnlrTn3HffBV1/UIyF4yHrdkId35l2lNpWXS7lYqYWm6PyhVPE
l8R2CD7h1BNH4EbfOQxKKe4NyimC5d4VHWn9NtCJj14gV/GA3+jCf33rRvFndvpJ
BFTZtiSgP+ZBRbIHiRw6V/HPunTtJI6BcenQS4MGpj8gAeiiXaRCQvyIZIiyVrrn
VgdV4giM/xhzcq+npsGq13iZuA5zwRwnm4f6QHkJJvzrAXnJy3g7yyYac8L1lw3F
KMRQuIlYmbxmN/4XK71HGa22LYCWzNCqv71niCR+I8SVMlpbm1lCRmVTwGJEUzKV
hp+SC3g4rX4Ap0Xv3EcJUkg5d5G13utEI1v0oBVnVKqnoG6SD3kQ3sB6Be9KBwtJ
cj/EL7kyLmCkA0B/jkdpsJ9Ny2PtxozDuRlyTZXjurn6ANWS/s5a1x7DaB+K++Jm
ILO0xrBo0beveCl/6jXSwJVfxmMoaJg6Y9ozcLxyKhLHn/7o+83ycrxVcQo5U9SD
t+aUIvC30MuUFq0MrIJukEU93RMh2ltJMk7QjoP09gDpY4NnJtkHWGQ1xt+u53PC
uW5Hs3fYOthDJuztQPj3RT3iuH76H6tWKRFOIhc8oktk9LunQQA=
=7gGU
-----END PGP SIGNATURE-----

--gdicf346niubedeh--
