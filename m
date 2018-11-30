Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:57746 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726473AbeK3W4N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Nov 2018 17:56:13 -0500
Date: Fri, 30 Nov 2018 12:47:11 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: renesas: rcar-gen3: add HS400 quirk for SD
 clock
Message-ID: <20181130114711.xa6g5w52lbpvuzru@ninjato>
References: <20181129003949.19984-1-niklas.soderlund+renesas@ragnatech.se>
 <20181129003949.19984-3-niklas.soderlund+renesas@ragnatech.se>
 <20181129165429.GA1660@kunai>
 <20181129171801.GD26216@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ikvnyph263i7asc6"
Content-Disposition: inline
In-Reply-To: <20181129171801.GD26216@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ikvnyph263i7asc6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

> That should have been rate :-) To elaborate a bit more:
>=20
> The patch is different from v1 as a different approach to solve the=20
> issue have been found. Instead of only ignoring the first row of the=20
> list of possible settings when selecting which divider to use also=20
> ignore it when examining which state the hardware is in. That is the=20
> driver is no longer aware the first row exists with this patch.
>=20
> This was in v1 not possible as the first row might be a state the=20
> bootloader left the hardware in and then the clock failed to register as=
=20
> it would need to update its own state to match the hardware.
>=20
> As the driver needed to know about the state the hardware was in when=20
> probing but not use it when selecting a divider the more complex v1 was=
=20
> needed. When selecting a divider we wish for it to select the second=20
> option for the divider value '4' when running on a SoC which needs the=20
> quirk.
>=20
> With v2 which depends on [1] this is not needed as the clock driver now=
=20
> sets a know state when registering the clock so this patch can be made=20
> much simpler by simply 'removing' the first row from all operations.

Thanks for the elaboration. I still think the above is the way to go and
I still wonder a little why it was implemented differently beforehand.

> > Hmm, why didn't you add it to the series then?
>=20
> Since it is unrelated to this series I thought it best to post it as a=20
> separate patch as I think it has value to create a known starting state=
=20
> disregarding where this series ends up :-)

Yes, can be argued.

Thanks,

   Wolfram

--ikvnyph263i7asc6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlwBIz8ACgkQFA3kzBSg
KbZ2chAAppe5gjnHNHTlMOz948qnZTWKUFxPiSck4ByI2ncQubvyPieEyhqheQNQ
f4K59CbnEIybdyVKBltiCWXmj32mABr+i3zlg95MhzHJqVq1mk5XudFTvC1LC4c2
zKvzHJtPZMx7xlWUyZt2rXTz933CS9DpK1l2s0lZqfdVF2L4jr83/sOd79LRHq1s
oy4vdTmy/WmBzBjPSoch70yeZkLlzczkLRb7/ww2NboTs67F8yANFqT5br0xUkXs
CY5RTFADPI+T07cGVCHEgoo1Sj7mvMdZIjuCaqyUaCman0p96gKfbcQ7pGpOHuJt
SASga23/qb2ub5F6Ydw2JOd3ujdLRuE1zhamIiDurkymR0oFjK8z6yhIl46K49AT
Fd5l62fwNuyJ3RMA0HxKiW1tuMy0XKXtI6J51Tp8UE89gOw/ispJECIlgQLfOfO1
BRjRW0P/eIu3LP4oI/uv5uZu1ohbVn+YE76n/d5AWFUFRdysEoYZO73EA14yaezd
0oYR/DBRSOa/dmNST4AWAxPOwRmwD3SS2u3wEdCU6TbLxOlD+8k3Fp/09umQcgNO
y9v+ftKcyPow/QIktbd53N6y7va3yNUk7E5ulMqfV+FpxDFIaMMiA2wO8pKzMQQI
XtRXaBimY0dZtSn4T+ND5HSv/uPh9vl1SOI6wCiU5CZ3Gpz9RvY=
=WDlb
-----END PGP SIGNATURE-----

--ikvnyph263i7asc6--
