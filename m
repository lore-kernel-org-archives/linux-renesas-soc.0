Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:47546 "EHLO pokefinder.org"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753170AbdBJPiL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2017 10:38:11 -0500
Date: Fri, 10 Feb 2017 16:38:04 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <Chris.Brandt@renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] ARM: shmobile: r7s72100: add restart handler
Message-ID: <20170210153804.mvn4qqkyjv6i367p@ninjato>
References: <20170209191259.29774-1-chris.brandt@renesas.com>
 <CAMuHMdVhbpfsLEn3Ke5f93AhaOnS4TSJC+QpY8xdtT1MNejVJA@mail.gmail.com>
 <SG2PR06MB11657431F033ABBDE1D750F38A440@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdXp-V393uR_-vhDSZyiXTD-+WxeNuchAK89YNKz+yPWdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6febk4xnrwdc3vss"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXp-V393uR_-vhDSZyiXTD-+WxeNuchAK89YNKz+yPWdg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--6febk4xnrwdc3vss
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > #1 and #3 look like they are the same thing (except #3 is enabled on po=
wer
> > on reset). The renesas_wdt.c uses the register names from #1.
> > Is the idea that you only use #3 to make sure your systems boots and ge=
t into
> > Linux, then from there you use #1 and stop #3 (hence no driver is neede=
d)?
>=20
> Isn't the SRWDT restricted to secure mode?

Yes.


--6febk4xnrwdc3vss
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlid3lsACgkQFA3kzBSg
KbZ5AQ/+N6uLxmrS9jZYF/Yvip/os7usJFYLWiBI7RynkeTbs1+ksoUfpkyaAdbg
ou9JwFJqkOb496hobe4aeRQJsq5/zH68RvN4dGclGrfbvOGt2QiEASm0u9KoePUB
VZ+dOi5WjQLAaHKS8gOieqiEnyLVVUgY6EFtTcZH/1ru1RcY4m+7wvJABWsgU/5p
DR/tOb/Lfddj2PoBltAwmjll36RCot/PR/UQjqWwp+2H968zZG3AKMqXY6VgaO3z
x1GoDtUJEnkjDi4+xr2qdPQC6RuQqeBRX/i5Y9vTvuREAwcaXHxtph7tX3YPt6rV
kBWzHQSPZtijoEC2lGUemWmpYjh3iw1cuJ2wJ2KkdIbwmqDf3jDT798SD8y+nqmm
Og+hPE4fwabTKqwbbb16I0U6D4TF5Q3twxOOBShRr8nROxYIU2gsmQcsQeoxB838
1GtnQShKfDm2cu+AbR8q5OdtuSP9G4Zw3XogQXhhJv86uf/obZYJqMXd4aAPKDxT
v4syVdsb/FHeZ3cKeV/iwIr7qDle9eh4UT22Ia3q6U62d2F8zfJjykTMwD3O4FGs
YAdnvuyym9kJFl5PGOE9OziuHDy2CndooGGbNqie/8xuGCiaHKzvDVoKPNVmhlkW
pGlQAFBxkr/pyqPOeNDZa8Om/YierVRSN/seer9gcvrNArX1cJI=
=sHh0
-----END PGP SIGNATURE-----

--6febk4xnrwdc3vss--
