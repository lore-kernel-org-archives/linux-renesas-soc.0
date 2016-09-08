Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:50185 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1758446AbcIHUYc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Sep 2016 16:24:32 -0400
Date: Thu, 8 Sep 2016 22:24:28 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-i2c@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: shmobile: Use ARCH_SHMOBILE instead of SUPERH
Message-ID: <20160908202428.GC3166@katana>
References: <1472636113-26988-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="FsscpQKzF/jJk6ya"
Content-Disposition: inline
In-Reply-To: <1472636113-26988-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--FsscpQKzF/jJk6ya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 31, 2016 at 11:35:13AM +0200, Geert Uytterhoeven wrote:
> "i2c-sh_mobile" is used on sh7343, sh7366, sh7722, sh7723, and sh7724
> only. As all of the above select ARCH_SHMOBILE, restrict its driver
> dependencies from SUPERH to ARCH_SHMOBILE.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to for-next, thanks!


--FsscpQKzF/jJk6ya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0cj8AAoJEBQN5MwUoCm2zcsP/jbopxl7BWo7UsAaQi3zMjxz
SeKczNcBQVDiI+VTrMKXfl1grUvyxC7gkhGg4iAwZlPJFOltwDSDK4Otyupn7rau
Wd5gEHQNjHOvDsXTTlMtR3WeiiJOPKuQgTv2F95aRIkfCljf3EUFhPCZltmpAaf8
QUPcS/gR+AjMOedFDvVaZ6a79HuteWc643J+wXNRn/AWOrpGJ5o42o/q5xI79WG9
xaHrdv5DXpC/FO11Tx9k42Mi2C4T/AaWKsrixoBZAzxCn92+FD6xpbGd8raTyENA
MzgXLKq91GHuApIuGQHWIarI6tDwJ+gHVgfjFP5V4ySgzmBC/Iro+bzFUJtErRsL
g2dH/DZErXUlC+fcFxUqiZQckGABOK2o9ESX/YS6AZKI650rV3K9mLv/tBiJLr20
obJdHSKQ58kTyulUw70x9wGEhusR7q4mcWIpNaF+MOdJm0W/0ANWUt/PeVXz+Akd
D/FRLf8SSLISj2w96yeNSK8svVDS7qI9Qif1UsA6BZhYSc3zCeuWTuE9SOrlP80k
S1oEExi986bayDvhIj/y+6iS+Z4v62pxe+NVV22Bjpbh6CbNc8xrhdHuE/Kt+HtY
vdu/+MSyg+jqEDPk1BuA4ClsckJmflOCiwXpvq4PRYfP6qRSxzw38/EsS8rkjzeD
2Xxzv7lfQ/S+vQobWNwS
=QxHr
-----END PGP SIGNATURE-----

--FsscpQKzF/jJk6ya--
