Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45691 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751150AbeACLQN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Jan 2018 06:16:13 -0500
Date: Wed, 3 Jan 2018 12:16:11 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3] arm64: dts: renesas: salvator-common: add GPIO
 extender
Message-ID: <20180103111611.2ahrchxwc5ose3t7@ninjato>
References: <20171222201146.8414-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdX7SO5rhfGOE0=HqV=5A6_vsJLgQc2Dxfnkw3uOjxYuOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="borfd3wgta2rlacf"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX7SO5rhfGOE0=HqV=5A6_vsJLgQc2Dxfnkw3uOjxYuOg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--borfd3wgta2rlacf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +       pca9654: gpio@20 {
> > +               compatible =3D "onnn,pca9654";
> > +               reg =3D <0x20>;
> > +               gpio-controller;
> > +               #gpio-cells =3D <2>;
>=20
> interrupts?
>=20
> You can test them using CP16/17 and gpio-keys.

Too low priority. We can add it when needed.


--borfd3wgta2rlacf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlpMu3UACgkQFA3kzBSg
KbYvNw/9G8N8tdux6m9u3LKCp/+5CNIOf7okwdQUk7CRbTLB30M8Ef7OubSPhlNi
2WwB0wPA9Cp4lbCRUvRrzLtRKij9BKQeGrYmjrCXUt92JggaUr+HwRrnUH/ktbGZ
Mr9WBWHA4R+JifH2E4Y3kFAqqDfDRaMu5skaTorDp5ruF+bX2pC5vlGWN+wdXOyi
6D6EwqKoQowZSd74IjuRkirahPkTf5K7u0otaSVMIHKvGbrVdlvS1E1bX2RFXiqI
MaTe51Mmeqs6uqcQ8dEHlELy20pCDIYO9RPoAzVllryPDbTRCgNwoekr7ZpUgN6V
O+4GcT4sfgocdhzkJ87PZkRuo8VPkMHjUpRF7cxgeO+qiQ+ngrk6qZsE63K9fWiv
rJ46iAO0gEjPlMhy2ok/FOnX4SGYdkQdJ0BZgTEeEulp5k2IQEPrjUWK4R0R263d
qBQ89RendeREM1BPFCHrzWLAI4OSgcKv1Qrt4x+uewVPSHyh6Ag9zkWElNCdNqwu
3pfASPZT0dzBhPtplJYAzH6CCWgKC0ZBWM4AWmgclWeZe6XLa2l4nn6An8QNj7GT
nq8GdyxpRX+4USGht3pHx9tBdDSCc0sk+QdC/a6V6qKkkWl4zxd/VarWz/p2YOTn
IG0kiNFEcApoAHY3JJx+JPXXsHho3Sju+EHnIus7JUNIm5jw84w=
=OWEZ
-----END PGP SIGNATURE-----

--borfd3wgta2rlacf--
