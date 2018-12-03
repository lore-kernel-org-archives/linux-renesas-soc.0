Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:56228 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725918AbeLCOZ5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Dec 2018 09:25:57 -0500
Date: Mon, 3 Dec 2018 15:24:42 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Avri Altman <Avri.Altman@wdc.com>, Chris Ball <chris@printf.net>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH mmc-utils] fix GCC7 build by refactoring trimming routines
Message-ID: <20181203142442.cfxrx3aqj6qacnjp@ninjato>
References: <20181203131923.1487-1-wsa+renesas@sang-engineering.com>
 <SN6PR04MB4925AE1C9D8FB94687CE1E15FCAE0@SN6PR04MB4925.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cua5w4xjkyqcsy7r"
Content-Disposition: inline
In-Reply-To: <SN6PR04MB4925AE1C9D8FB94687CE1E15FCAE0@SN6PR04MB4925.namprd04.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--cua5w4xjkyqcsy7r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avri, hi Chris,

> > I got a compile error with GCC7. When trimming white spaces from strings
> > lsmmc uses strncpy with overlapping memory areas. This is not allowed.
> > In addition, the implementation was not efficient with calling strlen
> > and strncpy once per iteration. Refactor the code to be valid and more
> > effective.
> >=20
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >  lsmmc.c | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/lsmmc.c b/lsmmc.c
> > index c4faa00..9737b37 100644
> > --- a/lsmmc.c
> > +++ b/lsmmc.c
> > @@ -316,8 +316,9 @@ int parse_ids(struct config *config)
> >  /* MMC/SD file parsing functions */
> >  char *read_file(char *name)
> >  {
>=20
> See Uwe's note - https://www.spinics.net/lists/linux-mmc/msg51882.html

Thanks for the pointer. Chris, how do you feel with maintaining
mmc-utils? Would you maybe be willing to share maintenance with someone?

Happy hacking,

   Wolfram


--cua5w4xjkyqcsy7r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlwFPKYACgkQFA3kzBSg
KbZ+Xg//efD22smJO68rywWzfPUAtjGO2F/bqD6dw/dOg7Uz2G6v/ddTZghvufl8
iViOx817kr8ubFou7EvTRQcoexax+RWlHok8NDdfKD3G58i/V8BTA3anvWs/ukF+
Jepn597boJf83PUCmdCIoMW6oiuTSSJe3/7m8AzgHJbGPKVZH1xKUdZnai2207pt
vVvflL20HXFm+UgmH6Gn6b7BPdAVlIssELJjMQmBpjpHoz1g6EUGOA1x1mBH2tj1
oc13TN/PTqP63nwS7kE8nCU2p7JJxP9NqQdFjuJ1/J+QRvQmI3MGfdOD/7ezC+eY
a7zIZTXgSYDYc/qU0kdiHy4P5B3wzreqECEvrr4CWmqbuFwMDBneBAONnMMkD+0y
1mQ/1K4eCLiK1qWcuMKBqmf7xELVGG48sTpZ5pyzJuoAqTmhFLR+V7RR8AaBuHy1
NDXLO0qXB7FpbhusE71NEdXDcPXxljOzBBvxeTuNIiDzMHfQCZt0zbxX7LZb6LE1
B/gRSiuSjSGwFhUqVcch8unEqzBsu+2yz6F3yIk+c47nFKFWKO7uN6VVIX1QtLDp
HHNjUWMGBXmOI3tiYI1A+WSt2xHv6R2mV1CXhJOuhB/uvF6VQ96KXYezh4APDTO2
jbS3JsqMHLUvZNANSWaxBpbwe/PPb/gChzg1hWVWDAD4Hw3AMV8=
=0Imh
-----END PGP SIGNATURE-----

--cua5w4xjkyqcsy7r--
