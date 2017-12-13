Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:50127 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752811AbdLMQwX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 11:52:23 -0500
Date: Wed, 13 Dec 2017 17:52:21 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: wsa+renesas@sang-engineering.com, ulf.hansson@linaro.org,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        stable@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: Add MODULE_LICENSE
Message-ID: <20171213165221.zu6o676d4lsjvwh5@ninjato>
References: <1513132380-7421-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qvrjf257zbsnyamo"
Content-Disposition: inline
In-Reply-To: <1513132380-7421-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--qvrjf257zbsnyamo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2017 at 11:33:00AM +0900, Yoshihiro Shimoda wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
>=20
> The following error occurs when loading renesas_sdhi_core.c module,
> so add MODULE_LICENSE("GPL v2").
>=20
>  renesas_sdhi_core: module license 'unspecified' taints kernel.
>=20
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> Fixes: 9d08428afb72 ("mmc: renesas-sdhi: make renesas_sdhi_sys_dmac main =
module file")
> Cc: <stable@vger.kernel.org> # v4.13+
> [Shimoda: Added Fixes tag and Cc to the stable ML]
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--qvrjf257zbsnyamo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAloxWsIACgkQFA3kzBSg
KbYbjw/+MzXbIoebzd9TGz1s37K5twXXS9Tga+kvrIPts0GBJ0tm1+QG4nifZ4Eg
jP/auYH61vkjKCWPmHOVWvBPbGxBXqObgguxV6qDN6WL4kaXy1L0lH0EOi/8LEEY
n5a3qB4EC6OeQApX+URhFT7FQqNBWNY245ew0b3BtMw38rZhVRjljJDkpsQ4DhfO
gluGYUYNkKw93tjTKRSaBJyAIKMhKTDr32Q6rNCVVj84p+ajYQPw8fBU/ndWfses
MtNBNN3kb/dKiAPpvuYiXbTPMPhzL5UJZzBR/XJnsaL/gZFIz06+pixuLNwYO1Z9
gUDjP1pH2iSdmF/7bxn7OErATHvX6zj5MsklysKFRSwhcptd5Hms2PffoT0ZTHzv
Ehw7RMHR+ilCudEdAr+GtUZ+idnqdeFTUD8yYOAqL1g5abSCr92qrztJRHKeer7q
w0anUUe9OX4pNCFrvQGZhxR9sdfbfOA6JJovVUuViaS6e+TUpIeFM481qcLU9xXv
XaDmPZpjkgv6YTX8AcOQvC1rpupTwJu41HdtmTqNJYewOjUzEWxlOJYZKycclHhx
4t1nS+aFW7Y2sCUZLdwJwjF7y2cxwi3NID5TyZcFLVsZiiZpRfu0zMxU4vLsOP8+
V3TTQXWJZXd5hO29JnI4wFYU0Iwtir91G8QqCYJ/aeowFLLOiA4=
=o3yS
-----END PGP SIGNATURE-----

--qvrjf257zbsnyamo--
