Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:60280 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750909AbeEBFcW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 May 2018 01:32:22 -0400
Date: Wed, 2 May 2018 07:32:19 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFT 2/3] mmc: renesas_sdhi: Add r8a77965 support
Message-ID: <20180502053218.2idc2kfzfksuz74b@tetsubishi>
References: <1525031296-16512-1-git-send-email-ykaneko0929@gmail.com>
 <1525031296-16512-3-git-send-email-ykaneko0929@gmail.com>
 <20180501152915.66re3hotavdy2bi6@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4qxugvqhikvshzec"
Content-Disposition: inline
In-Reply-To: <20180501152915.66re3hotavdy2bi6@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--4qxugvqhikvshzec
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +	{ .compatible =3D "renesas,sdhi-r8a77965", .data =3D &of_rcar_gen3_co=
mpatible, },

Do we need this line...

> >  	{ .compatible =3D "renesas,rcar-gen3-sdhi", .data =3D &of_rcar_gen3_c=
ompatible, },

=2E.. with this generic fallback in place?

> > @@ -276,6 +277,7 @@ static void renesas_sdhi_internal_dmac_complete_tas=
klet_fn(unsigned long arg)
> >  	/* generic ones */
> >  	{ .soc_id =3D "r8a7795" },
> >  	{ .soc_id =3D "r8a7796" },
> > +	{ .soc_id =3D "r8a77965", .revision =3D "ES1.0" },
>=20
> I think we can drop .revision =3D "ES1.0"
>=20
> to be in keeping with 349936fcdaf8 ("mmc: renesas_sdhi_internal_dmac: use
> more generic whitelisting").

Ack.


--4qxugvqhikvshzec
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlrpTWEACgkQFA3kzBSg
KbYD5Q//fPuixEqTlobhya7oRuHVIHrrYLy+Rr9RlZoZYRemucR6Yre3zAMxKrDw
qTf1id53Sx5A+aFUwMdq/t8FuJNm5cmQ8nzhKo5sCTjBkzk+uaczgQ+2ICoTD/W/
hUA8jYscbsorsqvaahRRgmPHvkx4fQMXWK/Ls/8DXyzO7qSTv/rNIFk7RWJKt5cM
rYtiNoA56u5AVXUjjcBOOgg4DAzMJWONVQabWL50QPUHAMo2bXpohjtsK+vNxPZB
Yu0GChsjHF54CQFD6v0Nq9LIxbtwUSBgnQ+mbrI+QxcNL6EaKZHm1yVP18cbJAKh
WgEq+yHElY4GK2giWuRKJIML+eAt8JWmsgrXJ7hbajN9V2o6MSnWOpRrL+DZC+DQ
zGFi4j+6E5LbpBd9S6+SMoER70Um0rj65PdxdGs+6yt2vJqK5ZmC5cydXKZkAjM2
jUnTaNI4+iSbZiuGQeWtnD1spkZb2qSiOlRtyURExDMePwtMTcSDyCw9BtNGYJsV
MxZFqSD59lYKTapUxEQa0tWlVzzW5wHZbPg24H62Z0Tarw7Sy18cRHSQpN8d+vVk
0kV9E51Bznn1RDWvZ6j9ou58CQiJ+AuQh8nacTJXTZxYuduDzSxchoNrNPTrEjoL
/FNcygkQYnURbBaj13BRHB7ki+UzcSJZUEedn8O5O5UPdGqtjgU=
=i3vl
-----END PGP SIGNATURE-----

--4qxugvqhikvshzec--
