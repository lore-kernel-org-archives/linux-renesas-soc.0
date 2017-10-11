Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:34555 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751996AbdJKMNZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Oct 2017 08:13:25 -0400
Date: Wed, 11 Oct 2017 14:13:24 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] pinctrl: sh-pfc: r8a7795: fix trivial typo in
 comment
Message-ID: <20171011121324.l42huohthvonceco@ninjato>
References: <20171009083725.6474-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVEiCvkd25yx2V8Pud+x7F4hP+2EUEVqvZLdFkcvSKPHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3srp7xlsa4dzyqcu"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVEiCvkd25yx2V8Pud+x7F4hP+2EUEVqvZLdFkcvSKPHg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--3srp7xlsa4dzyqcu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > - * R8A7795 has 8 banks with 32 PGIOS in each =3D> 256 GPIOs.
> > + * R8A7795 has 8 banks with 32 GPIOs IN EACH =3D> 256 GPIOs.
>=20
> I don't think the capitalization of "in each" had to be changed?
> (overzealous use of vim ~?)

Huh, how did this slip through? Sorry, Geert, and thanks for updating
it.

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in sh-pfc-for-v4.15 with the above fixed, and once more
> after filtering through s/r8a7795/r8a7795-es1/g.

Good. I got the idea of checking es1 yesterday on the train, too, but
didn't come around to do it yet.

Thanks,

   Wolfram


--3srp7xlsa4dzyqcu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlneCt8ACgkQFA3kzBSg
KbZ37A/9FCMsNGzKXtKIcPKkBtrvwkH0Js2T4K7hzgVIryc+d/ugFlBiASybnBp0
VuQVvGrUJYRF71qjvoqRMCiJCBWlD7lrUzOzZ2I/bB7PRaZv8ZmPIo72FEUi384U
2CySlB5dWxXSwqwnwTkBi6E4RQ0JdD3d1UOgDEdvrW2vS4VjrMSdJyOWZuVxTQUz
/ezlFdLbJFXYZ7lZRFSc4/58/4tPH4YBagJ6ZJgRrOfET6Zm6MV/5ER0Ckg6KnkV
dLEYAhTj3DLB0KrPeZ+S7dESW/KE7ASglrcoWR0ZCyJKDtKgHS7HW5EDrvnof5kF
qfbfrOO4lHHlpp/ggig+n8YfOWRlCeA3ydx5zAYcOvyBXIzACskNsICd15Pr14aR
TkwJZ95ZwBBj7ybb8VF0MGm0m0AdMhFl3T47LkF0mzDxblh9CMqbdKZqoXOflBEC
huYL/2TIInJ1zGJKa+WclWhfAaW+UH6msNJh2vU5pcZAO3+RyJh8PmjAKWHJMDYH
mXfgTVT/ybCkjHN4m7j1sgbRT7lHqG8GTU/Aop3X+72abjqkvEBNG+KbRcP+apIT
PM8ZtvLDKvVkSy8LV9MEIvn5kNNoHGcUT/1au41Z/gig4OdCTWlxrQqeVyvJwvg9
8VQ3jTYwvHZ9Na/bFkQusMzUln4X6Ph19LzxZXOY/6UcSG/QeGc=
=9o7G
-----END PGP SIGNATURE-----

--3srp7xlsa4dzyqcu--
