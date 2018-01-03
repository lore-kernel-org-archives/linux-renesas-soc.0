Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45706 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751653AbeACLRt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Jan 2018 06:17:49 -0500
Date: Wed, 3 Jan 2018 12:17:48 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3] arm64: dts: renesas: salvator-common: add GPIO
 extender
Message-ID: <20180103111747.zh7wn62k5anpj2zr@ninjato>
References: <20171222201146.8414-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdX7SO5rhfGOE0=HqV=5A6_vsJLgQc2Dxfnkw3uOjxYuOg@mail.gmail.com>
 <20180103111611.2ahrchxwc5ose3t7@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qt3h6knhwfsx5f3h"
Content-Disposition: inline
In-Reply-To: <20180103111611.2ahrchxwc5ose3t7@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--qt3h6knhwfsx5f3h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 03, 2018 at 12:16:11PM +0100, Wolfram Sang wrote:
>=20
> > > +       pca9654: gpio@20 {
> > > +               compatible =3D "onnn,pca9654";
> > > +               reg =3D <0x20>;
> > > +               gpio-controller;
> > > +               #gpio-cells =3D <2>;
> >=20
> > interrupts?
> >=20
> > You can test them using CP16/17 and gpio-keys.
>=20
> Too low priority. We can add it when needed.

Or when we are bored somewhen ;)


--qt3h6knhwfsx5f3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlpMu9sACgkQFA3kzBSg
KbYFQhAAtZFqeo1jRD1G12hBtrlW0fHuMrs17MSNIhlG1u44IFq7iqhrxXzuXX+j
IGqigJjhW0ivdjh1u8m4R9BM5vjEdhltHdW3zMwF/O+aqRKUbpc+Zj2COD+tYRUf
U0whrhSSfcfMd7FtOElTRKh/y4O/HdgzkWJNQoPBcYOA4sSKRQyxA9Fqu3XNEfCL
bHvXPXkmoxoywcBddo8bW/obB38Rbhu17kDB9SgvMHaE/VP6DdFPRVwMKM054bdV
/IiGPnL9T27dFFzS7h/tXV1x1eBfYEb5oFApIwKxsK1aqAI60s2KYpLiS+3Hwm8s
4p+d0uqjuojDPXctuaxt6fIV4RjBw/8lZS1GWKbO5ynj95npvk0HzNZI+tf1Epob
0RzSuG/Q317HGlzy7TpcJgxWwy27skAGMFUk+yqARVLS8rbTuWQaVVC2tRnJzdWp
9XURb+dxfXk1Q043WSA1tlHtDXzbw84jXwuoHHQSON376Iq41tCFF0AxemRBLXai
M0BME2pWqfzjZwVeZSjne6Iz7SI2a8GRwvePB6vY8/0XUdwUeb8M3LbmtcEgEpdt
r8MyYjwi7vH1bAUw4TtCYfxOFckQwXThYjLgSyYN7HHxn3Pm29gq7oWjjuefQS9E
/7QBmSJ9ghXh+LsyX02KmaJDTddUmLmdpagfzQBjsIEtCfVp3Sg=
=+wm2
-----END PGP SIGNATURE-----

--qt3h6knhwfsx5f3h--
