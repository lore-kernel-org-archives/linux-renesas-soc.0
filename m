Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58306 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726852AbeIPULV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Sep 2018 16:11:21 -0400
Date: Sun, 16 Sep 2018 16:48:07 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH 1/3] mmc: tmio: Add initial setting of interrupt mask
 register
Message-ID: <20180916144807.GB1083@kunai>
References: <20180606232252.31583-1-niklas.soderlund+renesas@ragnatech.se>
 <20180606232252.31583-2-niklas.soderlund+renesas@ragnatech.se>
 <20180609181552.ks4awvnin4khowb4@ninjato>
 <20180627061411.GQ5237@bigcity.dyn.berto.se>
 <20180627072702.ayayizxgghvoogdf@katana>
 <20180628003507.GR5237@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline
In-Reply-To: <20180628003507.GR5237@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > > So, we should at least protect this with TMIO_MMC_MIN_RCAR2, I'd th=
ink.
> > > > Maybe we should even move it to renesas_sdhi_core.c, but I am not t=
oo
> > > > sure about that.
> >=20
> > ... this.
> >=20
>=20
> I will look into this and send a new version :-)

Did you send V2 of this? I can't find it.


--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAluebSMACgkQFA3kzBSg
Kbaa5RAAjr+oHBJ4Q7Dhq6dAW4jGeYxov+LoOfAdlDvCEY1fUv7PcCztNUz7uRPz
7YMv5DqWU5JZbhhtWPStsGIZ11Gi8gdbVVmW+bqWE4A1JevjH5w/wDme11sC3knI
RPLJtv+zRGgqng8CzdyNVlBkvUjyZWJqPpLtuM+z7D8BHc+Sbyn8lqYNeG7b7dn0
NnY2qe8ePXnXO2xy9zQsTr5yqoQWmYb6xRgSaaVhCBPcgSkyWYiqmbwBOYPpbnaq
Ef1DugJO2QamFUxTDo6YkpXHmOOphdBmGVInNFUPoidgUJ5xY0YYtzNpI6eo/9Nt
wI8ZH5kvlFRRFQf7mO86gXAyM4g14is16aDp6fjpwdzER8OnW5vIKqGBgS+5Zu5C
8B3o17s8XlJ7n10+B0wfIxLas2oUxbaClS/26E5tJkTmIpdJ+pvSb//WytOBkV4V
deJxxa0sz1CErU+WXxZjPtXEyzQA/xshX7lwEJxwVjoMoNmbX+9fY2qrENDNR2xp
Pag27416I9SnmEXLYPbSCxzGGO2ywhtgA0arc+QLhWld3aqppoHR9Qf4Fo2puMJ9
xWG2qrBXJKOimrQzLGNforWoFoPMGNLAMmzoWlxC79fhJS35mltL1ppUneB3v0Qo
W86Ps0rLtl/jRSkM6yTZ4D4WUhED7QS/U2KGg8GqBH8iH0eq7tk=
=yOsD
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--
