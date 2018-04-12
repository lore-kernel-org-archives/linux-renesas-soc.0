Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:56754 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750763AbeDLLVo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Apr 2018 07:21:44 -0400
Date: Thu, 12 Apr 2018 13:21:42 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Nguyen Viet Dung <dung.nguyen.aj@renesas.com>
Subject: Re: [PATCH 1/5] mmc: renesas_sdhi_internal_dmac: limit DMA RX for
 old SoCs
Message-ID: <20180412112142.mnxzv2hsggwbuta5@katana>
References: <20180410093831.1759-1-wsa+renesas@sang-engineering.com>
 <20180410093831.1759-2-wsa+renesas@sang-engineering.com>
 <20180411071416.ohzwyhifviuoq7wo@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bkwqhgui24a5si53"
Content-Disposition: inline
In-Reply-To: <20180411071416.ohzwyhifviuoq7wo@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--bkwqhgui24a5si53
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +static unsigned long global_flags;
>=20
> Is the restriction on concurrent DMA RX streams global or per-device?

? Each device has only one DMA RX channel. Hey Simon, you upstreamed
this driver :) Or did I get the question wrong?

> > +	if (dir =3D=3D DMA_FROM_DEVICE)
> > +		clear_bit(SDHI_INTERNAL_DMAC_RX_IN_USE, &global_flags);
> > +
>=20
> Is clear_bit() expensive? If so it might be worth avoiding on SoCs that
> don't have the restriction covered by this patch.

It's an atoimc bitop, so maybe has a memory barrier. Hmm, the above
version is better on the cache lines, though, if you don't have the
restriction.

Will think about it and make sure both clear_bit() are in sync.


--bkwqhgui24a5si53
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlrPQUYACgkQFA3kzBSg
KbYOxRAAgTY2n+2t8dJJmqBGbNe4kAzaqwgSHZhJmsin7sY5vKAEJid/T2gEgEB+
1gRAYlWo6pqCIYeYsMujCntiqzZm13GE9NkVC7boZtad1nOt2yQNB22/AHcBaF8U
Zamx55QpVBDN6Be4An8hHZXiXEf816SPkhZPswrPURe0LagQ+k9QfJYO1+24/W3Y
CvjJyjOyZrgzmLL1VcZaVQdNu8MP6t3FiaaiSoQKhVIj6fp+ZivoyQULLiKHXYxR
9cAjb0PzUTQmPpQQqIoRfVv84WyRg0yaF534Q3l3TZwI1/PkoZIngYgKfwe6cFJ7
CG+Bv9C87rEaZ+twxDHJCmcZHoxryhGxu5wNZbPysXdfna+1O6OpkRGLdnnyIykn
cxavygCfqZ/WdnA4mhBkC8kOMgb2SJ6JtCuoaftK/ku4q7gPfCuZmhWpc8OTIlCK
4Zc35FXSCS2FzEk8+MDYtojyMHKdniS9ZtB54RIwKBchargCZ4xxmJWeOdG22WAH
tkHKCLnf+S30y5CZW5QBHFHJkHhGYojAFa1bngjc/i6MiivrZ4OsRpwMtuKmwEVm
C8tYAnjNpvtfK7oOYVTljkq1x0v+X7lBzWC/x91lsHTrLC6hWqysUE638etUSb2T
3Yh7bFx3lJIxSDoG8/Yl35S6o6oNnOb+ajxKqi+JkeaVTekT2h0=
=a+9+
-----END PGP SIGNATURE-----

--bkwqhgui24a5si53--
