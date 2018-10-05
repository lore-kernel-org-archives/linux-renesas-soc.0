Return-Path: <linux-i2c-owner@vger.kernel.org>
Date: Fri, 5 Oct 2018 18:27:28 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Eugeniu Rosca <erosca@de.adit-jv.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Subject: Re: [PATCH 1/2] i2c: rcar: refactor private flags
Message-ID: <20181005162728.ntzslfexkecbomkc@ninjato>
References: <20180808075928.31107-2-wsa+renesas@sang-engineering.com>
 <20181004144756.GB25176@vmlxhi-102.adit-jv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sud4l2b3ul2r4v5e"
Content-Disposition: inline
In-Reply-To: <20181004144756.GB25176@vmlxhi-102.adit-jv.com>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--sud4l2b3ul2r4v5e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> May I ask how exactly you spotted the "shift-31-problem" in
> drivers/i2c/busses/i2c-rcar.c:
>  - visual code review?
>  - static analysis, special compiler flags?

This one. I run a set of static code analyziers when applying patches.
One of them is 'cppcheck' which reported it.

> According to feedback from GCC community [2], with 'gcc -std=gnu89',
> shifting into (not past) the sign bit is "defined behavior" which is why
> UBSAN doesn't report this as an issue in Linux kernel. That makes me

I see. I guess it can be argued. Yet, BIT() solves other issues as well
('1' vs '1u'), so this was probably a reasonable move nonetheless, plus
we are super-super-sure about the shifting now.


--sud4l2b3ul2r4v5e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlu3kPAACgkQFA3kzBSg
KbZFehAAtZfIsj767taJlKoezNx/INHolhhvSYefED8TWeQNyS4rWTdGBZla+W1C
DPI6k7/ki91qQmUU2PsJXzW5uj35aHciQMWoUDc1nxMKtTbogKbw7jfpJyZXlcaI
y8WzY/ULD3FhnDsUANwIaaz1wYHDUBrgJ4k7Y9BGJ7sm3xUisPneWHXEUS3jaX1Z
g+x6uneEooVrD8VZdu9EntZVd4JGhSBWjAsSZUTOkgxcCsAWfEUXbXsOrNKj2Gcd
+MeJ4cBN4A1askHIWPRJOqJKPYiLTG7L4cGtDsxOsUv4xAsQTX3LLBWWbJW3JFmz
s4MRpQN1cEJiViavy4H6URrcC1PZHFTYlHIFGqgWJWuojtpzB9UY+wxLKFcQNxjt
r1wlJlfiCUPFmq4N0SL78vdUG3GLi1GHaDIncH+/E4SJpZesVgP5OsJcXYlhHW9m
IHl5wIUK9+zlb6XXUWj2LMni/2/l9KJQAg47+TTBteBCFS21mIcOHAhbga8mY5kJ
pQUoWBAe60EWXDb1DtXINhbVUf2+T0ElI69A+n/IVvdCr/i1fu0/hbOG05xF0JxI
RfQ/1InTB+LlGevnDtaNUOVyvrGOFrCfxvHGYlB1RAbMGSEOKQX1ZC+T7HHbXedr
04YUZouMhg2dLKRQ7V7NFjxJ/23soG8ZZSHhoT8FBfIFIg38cNs=
=GCQ6
-----END PGP SIGNATURE-----

--sud4l2b3ul2r4v5e--
