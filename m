Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:39260 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934041AbeF1Hdo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Jun 2018 03:33:44 -0400
Date: Thu, 28 Jun 2018 09:33:42 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Subject: Re: [RFC PATCH 1/1] i2c: rcar: handle RXDMA HW bug on Gen3
Message-ID: <20180628073342.uktw7gpftgi2uczj@ninjato>
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
        protocol="application/pgp-signature"; boundary="wik2t2wjvqt2tugt"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXfUjLPa9fGXAkBe6DjVx6jiuNiGN9m2v2bRQf2xurmxA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--wik2t2wjvqt2tugt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Note that reset controller support is optional, so we want to add
>=20
>         select RESET_CONTROLLER if ARCH_RENESAS && ARM64
>=20
> to the I2C_RCAR section drivers/i2c/busses/Kconfig. Else reset will fail
> silently.

Actually, no. I use a non-optional reset_controller_get[1], so I will get
an ERR_PTR when !RESET_CONTROLLER. And I check for this ERR_PTR. So, it
will work with !RESET_CONTROLLER, just without RXDMA always then. That
worked fine with the old patch, need to test my new version now.

[1] In fact, this function is deprecated and I replaced it with the now
more explicit reset_control_get_exclusive(). Plus devm_*, of course.


--wik2t2wjvqt2tugt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAls0j1YACgkQFA3kzBSg
KbZNeg//QR6VmDi0eluMmcAIXHBAmchndS8NXUvKACTQGvQGfXidG2k1UhBbO4or
DiGN5fyUE0DtcLbvYbMKJho/TlIO7b/g8K/+AOxAZSgas5ps4ETbDcfk+taCECP7
Vj1rXtZtIZ9B8fUF5VIaMJ7iTWUH5EGRaeM6jOQ2OfUQPjglrLvpKXZI9gUibJ6l
pHHSRKv9Lf8Eloa9uYpZ+vPFtvCqFDokvQL2YhOkXh13j9NR6q9lIWi9vY83sfWG
Co+FQbdwgQTuw6o3LqhsLOr8964VUHOPj1g79R7Nw4Kyfz2OWdEntpQaClbNT4BZ
YRH3KJKer1s4ATeTiWzWDKQoaeknIosyqUcxOjl3Smd5Wl1NLQIHqJs/ndZCRwxe
1nn987dWk+DOJvJCt3Z57JtDSCDNHdCmwPZNPhBRMie5fLLpS3oG+KKABP4aoCuI
lp5PyRJMXTVf89Z6OVsucvU2xtCO3kJT8w8tVlezS/RMWVszJ4qcTBPQeGODNrnE
ki3SP8AfLtVikYXtIy5MLt46rUmOVjsQJi81zwdyFRfS1sonUjvqg5s7R3Xo6UNY
HakZb+E4Y4/xvuSX2rzsg5VfJER3HzAYhlFcANgbha5jDbzXFh4l6LvzjHSuUDAb
f2JmJZ5+m9MagJVijNvnpXPVMszT62HnSNUgf+fq+6tApgkp61o=
=JrGq
-----END PGP SIGNATURE-----

--wik2t2wjvqt2tugt--
