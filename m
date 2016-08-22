Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 22 Aug 2016 16:57:56 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Grant Likely <grant.likely@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH] Documentation: devicetree: changesets do locking on
 their own meanwhile
Message-ID: <20160822145755.GA29072@katana>
References: <20160822144259.3767-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
In-Reply-To: <20160822144259.3767-1-wsa+renesas@sang-engineering.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2016 at 04:42:58PM +0200, Wolfram Sang wrote:
> Since commit 183223770ae862 ("drivers/of: Export OF changeset functions"),
> the mentioned functions do all necessary locking.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Fixes: 201c910bd6898d ("of: Transactional DT support.")

Ooops, that should have been:

Fixes: 183223770ae862 ("drivers/of: Export OF changeset functions")

Sorry!


--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXuxLzAAoJEBQN5MwUoCm2blkP/0hbOovIlPkh/Fwj1VDtnFt3
T4WL8pcaI/acgChICL1+07BiuF08K0D/pePhL0td8pM4vvLyBUitslski2AkRv2H
//Hk98vZQqHPEYg3Tz5eMc+6tYoX897vQcT1hUxMTduALJMSxM63tvue4h4MFPFE
SXlW14+K38b/Zr/SnTUkHp7+zUP7RxFFbyG9HNZqwdw+4Iz/5VEQ/rnj+uN4V6To
bl3RNu0VO0dbB8IYTkDt8iJK70gN+5+f0yRL7lKYMcXE7QVTLMb5YasvhVO4GI2/
LaMPtI5QCNLi9OEExzY97V63K5pQqOojc3lgHYKyqgOyLDuOYjUVIVQIJ4X6aiRT
cN5x8HlMT9OAI98u+350WCvAqtt7ESlzcGXLuxyLSMo7ijh4I4olG5hkIz+X0S0o
XiIdsJhnoG3Fb4BA2zDx4TVcRCnXz1gq/pmEIhAKerUVDpv5jr4JUbqGAKw3uh+2
ui8nD401iF1lLo2p67ahtneSxW4f+y8wx0XSSvwaZRJnvBJfCco1GUibkaqo2Fpg
3DNaQf7/wcumxXwz7U6gccB40YOtsTp1Ve8rDjStqDFtY8ziHo2XZGoFpix/aHtX
O3tMSkwJ0i+jwkBIN/Yi+Z/oiOAMmYf5SEHLWAQ4VOVnUHi8F2XPLsAlY7McKtcf
rbTJkYlbvuqBBDU9eLnx
=d4nE
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
