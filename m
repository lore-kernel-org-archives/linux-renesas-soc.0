Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:47560 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751298AbeF0H1E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Jun 2018 03:27:04 -0400
Date: Wed, 27 Jun 2018 09:27:02 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH 1/3] mmc: tmio: Add initial setting of interrupt mask
 register
Message-ID: <20180627072702.ayayizxgghvoogdf@katana>
References: <20180606232252.31583-1-niklas.soderlund+renesas@ragnatech.se>
 <20180606232252.31583-2-niklas.soderlund+renesas@ragnatech.se>
 <20180609181552.ks4awvnin4khowb4@ninjato>
 <20180627061411.GQ5237@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vjnytfsozobmiyff"
Content-Disposition: inline
In-Reply-To: <20180627061411.GQ5237@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--vjnytfsozobmiyff
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > +#define TMIO_MASK_INIT          0x8b7f031d /* H/W initial value */
> >=20
> > known on R-Car 2+ only!
>=20
> No it's also know on Gen3 :-)

Sure, 2+ means "R-Car 2 and later". Like with GPL2+. Sorry if this was
not clear. And it is still my main argument to do...

> > So, we should at least protect this with TMIO_MMC_MIN_RCAR2, I'd think.
> > Maybe we should even move it to renesas_sdhi_core.c, but I am not too
> > sure about that.

=2E.. this.


--vjnytfsozobmiyff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlszPEYACgkQFA3kzBSg
KbZhLg//Wgpnl15K+5r4HhEnk8Fm8RJ5mFXJ22L50BjgxpyyL4ny2EBRu+QTAowu
UO10qzu+/SprgBMJ2QTs0g8FXF133Q6+JWtn0Y76Ym6uF/Zvql+l0vKpOjuXAR6x
xQQ5ynFiAlOw3FUhrQwdsOk+FLt26qsGfMLjqFELRPwyr8uGXV2y79UYPr5puogT
wqQr0PHxAG4SpSHHL9WLVrv8rE6VN1L4T4qY8jAAnpVoyb37mFu4i2jD/7o8PBkG
BxccMVuU1Uto9YJ3N+kjfaqdkY1xyZoS5SHXMXQF0OPO4WMh8oD9tb9YQ/HSzU2C
qTIazRU90tCGSkwkmgGswRzEO9/kduXfrP6sTaqFNT62c8VoFJW4wkaGB7Yl8qcy
PMqB6N54kPi+Y3It+rcA1b/YRJQxicy290iOTBPHUGlFanVhj5+mMe/AgS8GUlPg
WqtDbkT5tuufNHhF2v5sTneZeQCy2/rvD9s4Cn86+QVKRWLd0s9D5tPIeovzqoN5
YmaFZt0h7ysPFxnlyJ4MQmMv0B6THXNt3ajG4VMQ0sGA7voWq/bUrfPWhH16q/TQ
EJXmKE5gSQVPCavBT9yiQLYWvWbQKTiiucwP3s+WfMw8d41McE0eMsuhApL35il+
ouU20hYPF+HjZjX7tdf0dyqDlinRGCU7F1GxQe+PlHHmtYfroQs=
=jxud
-----END PGP SIGNATURE-----

--vjnytfsozobmiyff--
