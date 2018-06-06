Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:54444 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751409AbeFFNlo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 09:41:44 -0400
Date: Wed, 6 Jun 2018 15:41:39 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH v2] arm64: dts: salvator-x(s): Update I2C ch4 clock to
 400kHz
Message-ID: <20180606134138.2b7x5odnc6iwrk3o@ninjato>
References: <20180528192947.2808-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVXrFvg9JqAp9C8pzcYZVMraeRUehgW5G0YszEjwoHb4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="y3ppirffuue63etm"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVXrFvg9JqAp9C8pzcYZVMraeRUehgW5G0YszEjwoHb4Q@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--y3ppirffuue63etm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >  arch/arm64/boot/dts/renesas/salvator-x.dtsi  | 2 ++
> >  arch/arm64/boot/dts/renesas/salvator-xs.dtsi | 2 ++
>=20
> Any reason this cannot be added to salvator-common.dtsi instead?

It could be. For clarity, I wanted to place this attribute to the
highest level and not somewhere inbetween.


--y3ppirffuue63etm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsX5I4ACgkQFA3kzBSg
Kba4ng//VTekOl3foGvIqRxYfVsGWaWu6jhfYAntN/KcEjZ5oqbxT6N33aaYuM5u
Ki7SeqWJDsqQhq//aDNDJJAWrkn3SRLp6Xl1zaWkpVQXSgEZAJFjzeIN0zWzG0WN
krtBtIWxXWAoOCgYd9DV/17lx5HTmrgOTP5OD90JyQC3m/LKxQFImll+6atWB+Wm
Q2qQMCRNcR7vGtEFrmAUtnO50r8BGldVujF41dDXPwqYF7tvTQOrdHWQC9kmGReG
IpziunYuIXb6hwdy+lQsqdv2LdaLtv3UZ8QwqtUaOsyaPLajQ1JZ6HhHnfl5/XrS
NiOjH5aQ9w6J2rAQ+W4BsSg456VwcSkDjxzQTc4i0rS9vAiBZ7rRT16poFvqFxHM
Niq+JC2DWpgpUWOyuQnRI9petIFo026K9ElyW+fjMcye0YMHTFN2cGMiwoqQcJSf
S4KWx4EctOM2lh75axl17Yo7n1JJPovUoyZ7PwQiq5qOm8i5qWTqyAdHcKptGILP
U7IupHqt4uaysWl/rdJ0+GELUkkU8ywb6NvIbriE7w1lpxvPBk1TVKpsO4bQd8TP
huADrIY3RnHtcwawOGMwKAodvjbfpshF6crvLB1MEBSndI03oMlQ7I7zL7orN0b0
MZdLZ7d89ia7NgId+S33CmOAkC/EyBQsWIvEHceirKNJg27l6qE=
=5yIV
-----END PGP SIGNATURE-----

--y3ppirffuue63etm--
