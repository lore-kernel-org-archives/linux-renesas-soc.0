Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:59654 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752642AbeF0IoY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Jun 2018 04:44:24 -0400
Date: Wed, 27 Jun 2018 10:44:21 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Subject: Re: [RFC PATCH 1/1] i2c: rcar: handle RXDMA HW bug on Gen3
Message-ID: <20180627084421.zrtpsms5eyftqcfb@ninjato>
References: <20180529105847.15663-1-wsa+renesas@sang-engineering.com>
 <20180529105847.15663-2-wsa+renesas@sang-engineering.com>
 <TY2PR01MB2297BC5F12034143657590A7D86C0@TY2PR01MB2297.jpnprd01.prod.outlook.com>
 <CAMuHMdXaspHUg3LF1Jckg5CWHZWRL6gKOeCv-LHk4uzsji2W1Q@mail.gmail.com>
 <OSBPR01MB2293BBBFEBF58E8D90F3B516D8630@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSBPR01MB229354C6675F1185BD182C54D8640@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <CAMuHMdV-vLn-C6HcZBLwJWbXq2S3e-iQdmQXCEXm23+cEvk8gw@mail.gmail.com>
 <20180626030510.gq3xyejsrc5gd5wj@ninjato>
 <TY2PR01MB22973680E5B69BAD232C234DD8490@TY2PR01MB2297.jpnprd01.prod.outlook.com>
 <CAMuHMdXfUjLPa9fGXAkBe6DjVx6jiuNiGN9m2v2bRQf2xurmxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="u6m6yqggxofsu6u3"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXfUjLPa9fGXAkBe6DjVx6jiuNiGN9m2v2bRQf2xurmxA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--u6m6yqggxofsu6u3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

thanks for the discussion on this topic!

> > The hardware team said:
> >  - In CPG point of view:
> >    - such polling doesn't need (because the reset pulse is generated co=
rrectly).
> >    - About the interval after deassert the reset, this is depend on eac=
h hardware module.
> >      (In other words, if each hardware module has a special handling ab=
out after the deassert interval,
> >       we should follow the special handling.)
> >  - The I2C controller needs an interval of reading SRCR at least (this =
is a special handling).
> >
> > So, I think adding this code is not good fit in CPG point of view.
>=20
> Calling reset_control_status() from i2c-rcar is fine for me.
>=20

Doesn't make this writing device drivers a bit harder, I wonder? If we
follow the above, we need to know per driver (like i2c-rcar.c) if
reset_control_reset() is enough or if we need to call
reset_control_status() additionally. For a driver author, it would be
much less error prone IMHO, if reset_control_reset() just does the right
thing. It has also the advantage that we can handle special handling on
different SoCs differently (if that is ever needed) because MSSR driver
is per SoC.

Where is this special handling documented BTW, I can't find it. The BSP
waits for maximum 1024ms which seems excessive to me.

> Note that reset controller support is optional, so we want to add
>=20
>         select RESET_CONTROLLER if ARCH_RENESAS && ARM64
>=20
> to the I2C_RCAR section drivers/i2c/busses/Kconfig. Else reset will fail
> silently.

Technically, it should also be "&& HAS_DMA". But this is maybe a tad too
defensive?

> This hardware bug is restricted to R-Car Gen3?

As already mentioned by Shimoda-san, only Gen3 has DMA support.

Kind regards,

   Wolfram


--u6m6yqggxofsu6u3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlszTlsACgkQFA3kzBSg
Kbb20hAAkRVSVE62QwawI0yuuM3mdtQalXM+0vrDX37zUTmQaA14GUZClv+zfunl
JMjYCARquof9/0YmG9fSG9ywD1nAGcTfheeNJuqAHNF+8QIG5zfKDE/NrDvieial
37ogiJAqrR8G0B5Pv0AY7pPFtxmIh9nOgI0dWEnqt/NjdD4ejM4g86SF5kkvF/2w
1xq3aXbVmCQhJWiE9Josm1qVxu/x3JU98nW1+I2SiGCgS3tPuLvNpPqF6ALjO+/c
wd+qIzE7fYG3POh3Ws6dTukx//iuHcJA9xCMrYnirQv4abI3Mcx8bqwGUcqbLH6S
mXBDChm32wVpPDxKGiG91fN8HNhyG6XwnWWESGEtokJrNhSfolFv0uq0RRu5cPz1
+4jl3LDVd2hPoWm285jF930wGxoaEekTw427LFAs5lsmB3k1Z2rJX3Zf1n48VF5u
gHFkPCu8dU4Faab9+KDVlugWT/Vq13NadL9VCu8mVDUxGsGhWzrGdghItplR/Blu
4oKSOysiaRDZdOPX8H/VNDmUuCUlX8x8fqPtLp4bOs705P11NJPu0EC3z+DnpAue
93kq6t9qhg/MMiNBJFLdsL/KuC9QhFTx/0IUM0qnLUOqD1Z9f0VXZ27lXUJOvFfE
O4P3D0+AgRsuPWZ4I4HXGTnE1UGuabgC+8UVDlJoi3trePCebZU=
=mbmh
-----END PGP SIGNATURE-----

--u6m6yqggxofsu6u3--
