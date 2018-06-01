Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:47266 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750913AbeFAIHc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Jun 2018 04:07:32 -0400
Date: Fri, 1 Jun 2018 10:07:30 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH] mmc: renesas_sdhi: fix WP detection
Message-ID: <20180601080730.h3zjnnaov7ygpsue@ninjato>
References: <20180305204842.25391-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cysqc67v7jog72hl"
Content-Disposition: inline
In-Reply-To: <20180305204842.25391-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--cysqc67v7jog72hl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 05, 2018 at 09:48:42PM +0100, Wolfram Sang wrote:
> Commit "mmc: renesas_sdhi: use MMC_CAP2_NO_WRITE_PROTECT instead of
> TMIO own flag" activated MMC_CAP2_NO_WRITE_PROTECT for Renesas SDHI
> which incorrectly disabled WP altogether instead of only disabling the
> internal mechanism. Since the whole WP handling has been reworked, we
> can simply disable this capability to re-enable WP GPIOs.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Ulf, it seems this patch is also not proper yet, we still have
regressions. I am working on it right now and hope to have a fix ASAP. I
know it is super-last-minute, but I hope for an easy to parse two-liner
which we maybe can still have in 4.17.

Just so you know already...


--cysqc67v7jog72hl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsQ/r4ACgkQFA3kzBSg
KbYcdA//QOliNlBFJvDptbUazAd+q/7WsG+NE4p8+x62lo5co0gw7DxlWUdh9XvF
7PURnNv1b+Hqx0kSzQ8/SFmUcD440Sh+Ig/IMe/fe4+VON6ifP0TA+z/NbG58eLx
NxvXqjwnF8vPuK/vfSXjqRnHIaKDcZkaNUacFrviv+OElOx4ajM7oQ+uDOKA53WO
6SXtz5oVbmMWl6SvMrmLIBfg7afnWKei9yQ9pCijWRwYaGRCfyR849jMmVaWlsGT
mb3voa1CBirpmFdgoZBvT7tzHCfPYGIhzr5ox534fnKUbvDF1tY6LnIek/6XUh/m
5TB9zzEa0Su3e/DIbCtIVA5TMOOXXuN7t7FswclB6KQ4GPh6JY9sJDx9W6Smk7f4
eLRrjP80pvMndbg/iuQR0rGViwkzV4PaWJe6N9Jrz+b5HrimA07hPOW/27HbyD6m
gdp0pBmioBB9bwEb465hVwgw+S3OZPGBRfpKRiPzbJIEfiaQMoo/2wmhe5UusidK
63FF/iJVV5i2N659UNapFwjAXH7BLO/UViWJDSWxNdwtyAGctAhF9BG2951yh45U
oRmRVSzcehPiy53fbLzcu9Cst+CaBERlZ6X8hPAWzKndNnouoT8f/bF7b+Nl8+/r
SB1pgjzuhaoma28Z7mV7SP3I60HhE1c+YjfLgK4z6sOJ1J83ycY=
=sb0g
-----END PGP SIGNATURE-----

--cysqc67v7jog72hl--
