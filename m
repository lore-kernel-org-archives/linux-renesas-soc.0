Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:59810 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934087AbeF0JKa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Jun 2018 05:10:30 -0400
Date: Wed, 27 Jun 2018 11:10:28 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Subject: Re: [RFC PATCH 1/1] i2c: rcar: handle RXDMA HW bug on Gen3
Message-ID: <20180627091028.lh3gqiqgervnxzcf@ninjato>
References: <TY2PR01MB2297BC5F12034143657590A7D86C0@TY2PR01MB2297.jpnprd01.prod.outlook.com>
 <CAMuHMdXaspHUg3LF1Jckg5CWHZWRL6gKOeCv-LHk4uzsji2W1Q@mail.gmail.com>
 <OSBPR01MB2293BBBFEBF58E8D90F3B516D8630@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSBPR01MB229354C6675F1185BD182C54D8640@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <CAMuHMdV-vLn-C6HcZBLwJWbXq2S3e-iQdmQXCEXm23+cEvk8gw@mail.gmail.com>
 <20180626030510.gq3xyejsrc5gd5wj@ninjato>
 <TY2PR01MB22973680E5B69BAD232C234DD8490@TY2PR01MB2297.jpnprd01.prod.outlook.com>
 <CAMuHMdXfUjLPa9fGXAkBe6DjVx6jiuNiGN9m2v2bRQf2xurmxA@mail.gmail.com>
 <20180627084421.zrtpsms5eyftqcfb@ninjato>
 <CAMuHMdX6ON5o8TAap18BiKXdxMtTzpkJGU+Z1yAEhT587V05aA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wywkdvuwlakap5ou"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX6ON5o8TAap18BiKXdxMtTzpkJGU+Z1yAEhT587V05aA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--wywkdvuwlakap5ou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Doesn't make this writing device drivers a bit harder, I wonder? If we
> > follow the above, we need to know per driver (like i2c-rcar.c) if
> > reset_control_reset() is enough or if we need to call
> > reset_control_status() additionally. For a driver author, it would be
> > much less error prone IMHO, if reset_control_reset() just does the right
> > thing. It has also the advantage that we can handle special handling on
> > different SoCs differently (if that is ever needed) because MSSR driver
> > is per SoC.
>=20
> True.
>=20
> But this seems to be a bug in the R-Car Gen3 I2C controller implementatio=
n.

I see. If this is more of "a bug in the IP core", then I can live with
having the workaround in the I2C driver. With a comment explaining the
situation, of course.

If it was more like "intended" special handling needed for different IP
cores (not only I2C), then we should maybe reconsider.

> > > Note that reset controller support is optional, so we want to add
> > >
> > >         select RESET_CONTROLLER if ARCH_RENESAS && ARM64
> > >
> > > to the I2C_RCAR section drivers/i2c/busses/Kconfig. Else reset will f=
ail
> > > silently.
> >
> > Technically, it should also be "&& HAS_DMA". But this is maybe a tad too
> > defensive?
>=20
> s/HAS_DMA/RCAR_DMAC/ :-)

Yes, this is better.

Thanks!


--wywkdvuwlakap5ou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlszVIQACgkQFA3kzBSg
Kbbdpw/+Ogq3oi8rDkMQ0crNubj7+vcSuP6ewfi0GJGh0n0xTwO6oGWaQVoMiZj9
45Y36oLea0RvsHan9GCXQmtU0iUa462Loe1D+pym2jX0XJle123lpqIaJTetbegO
JmFrWBxdItlNg6kcq3xAWCqU0ZKo8AzsNtemBYutlYca2FryNafh/PhuP6zedQx3
qihIRmspFU/9+5sfDFiHc5ZUrNHlfTwmcM90TgjSl1SXdWTmBnQe+bjkKPGlmbp5
NLNYynUHPACSwWrmLswpRYqcLL0eIi73iiBjh9ELpATfdYkMcV0oYtK4pOxJKBB1
uJ061FY+5iM4SPYreBDSnE85rQDQxm8Y3yri/MsH1ZtSitMJVEs2dfFFF/Ct3bbm
9ctigNrmGeQMt7iA/JOKLWhut4pe0gF7WCbUhgKLkDdHQFWNGqwVG+NXdbR8Vi7C
B66OmpTs6iw9ZDM1zdn0akN0eNexG4u79++Cgo/DkcaRiK392i65tbxqi0NVQlWd
LmphsSImwRMNKJnxN5NF0weiSwIRAtNhbYXKqMQAaGwLKgz085WTQskMKj8ek9a2
mbyDtLGM2/owE7D5X48HpkP5dJ0hQF5QuUZN77NdP0lNRFpPUKkhggfSUjYAdJOO
Gi1OXzIIaKhir5FpKjmfdkjtskzq8fmQfsDKwBwzjjLCIehgQEA=
=b5sd
-----END PGP SIGNATURE-----

--wywkdvuwlakap5ou--
