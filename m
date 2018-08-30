Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:56164 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbeHaBVH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 21:21:07 -0400
Date: Thu, 30 Aug 2018 23:16:58 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jun Gao <jun.gao@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH 0/3] i2c: refactor releasing a DMA safe buffer
Message-ID: <20180830211658.nd6odru6annqhuhx@ninjato>
References: <20180824145246.19987-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="t7ejg72nrtxzx6hd"
Content-Disposition: inline
In-Reply-To: <20180824145246.19987-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--t7ejg72nrtxzx6hd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 24, 2018 at 04:52:43PM +0200, Wolfram Sang wrote:
> Jun Gao correctly identified a problem when freeing a DMA safe buffer [1]=
, many
> thanks for that! However, I'd like to not introduce yet another function.=
 So, I
> thought about changing the existing API to support the case of freeing a =
buffer
> in case no sync back to the message is needed. Here is what I came up wit=
h and
> I like the new way better.
>=20
> Once this is set in place, the only existing user so far, has been fixed.=
 It
> was leaking the bounce buffer on error cases before. Tested on a Renesas =
Lager
> board (R-Car H2).
>=20
> Please let me know your thoughts. Jun Gao, does it work for you as well?
>=20
> If all goes well, I would like to apply it for -rc2. But I am still open =
for
> comments, of course.
>=20
> Thanks and happy hacking,
>=20
>    Wolfram

Applied all to for-current.


--t7ejg72nrtxzx6hd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAluIXsoACgkQFA3kzBSg
Kbaw8g/+OdtNH4askib2l2JaWrWW9K2PJnyWJ1muOGtDyGLI7UCwLZwNexFV81b7
J4gAmC8bQXTbMDsH4Kk0lYI0exyOfbsENX9Z2yyEMB03eqHzEeroWmnu0v8ywRFb
nOQRw6Xsons95FNl/BV5zZuOqNQB6zpgUg0099u3qoshE/Xn9MPfazwXBcv1IYSF
S5M6SxaKBHeRWsaQ4/KiidUhRpO3kHvwUmtRisZnfFT23etPZM9H5UYK+yGcmACG
yNqgIMKsJOCt1hx05SGKXrGY/HX1KtlZThsoF6hK/E52GTXB1HVawCOvhjvF5ddr
cmcpOaPVuSb+pFLPxpaDTvQUzFjrExhL3HBlcpAKUIAxPNsnoG0iFHSHwdAq+XDB
0jkL71u38j3lIs0tQz7mbU/xcGBFaz1GyqlPw0lXVb2zVQmdubvA5Ur+IkowzOXG
aG52OJCLqfRaAlG7SRVrSVL+UuGh84iLCJkX8l36nY7+f7cL2iVqz8cT52tmwAOq
VUq9gwgrNU5fn36IWL40LpdZ1NWmzeNsdZITxhclEOVvtwonalorW6BETSbrnXSx
teHyD5Hl6+0q3toZ96WBMRiMlPQXoGSqsTGe8hILPTjBa1nRYRiubD0jozyQbEA1
s0dlolUzgKXcN1DiTqrAsLzJxQwi4OB5TAllVUoCtD3Gf0IZA+g=
=2bTi
-----END PGP SIGNATURE-----

--t7ejg72nrtxzx6hd--
