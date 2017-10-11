Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:33755 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751030AbdJKHk4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Oct 2017 03:40:56 -0400
Date: Wed, 11 Oct 2017 09:40:54 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC] mmc: tmio: fix tuning for stubborn cards
Message-ID: <20171011074054.3re2w5e2rcgfh2pt@ninjato>
References: <20171011000814.21055-1-niklas.soderlund+renesas@ragnatech.se>
 <20171011073648.GF9661@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4tgmmbazzsiv3lw6"
Content-Disposition: inline
In-Reply-To: <20171011073648.GF9661@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--4tgmmbazzsiv3lw6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2017 at 09:36:48AM +0200, Simon Horman wrote:
> On Wed, Oct 11, 2017 at 02:08:14AM +0200, Niklas S=C3=B6derlund wrote:
> > The commit 43b0b361b0170030 ("mmc: tmio: always get number of taps")
> > changed the behavior of the tuning. Before the commit the SCC was only
> > enabled for the first tuning attempt (host->init_tuning(host)), if that
> > failed the hardware where reset and tuning retried. In the second
> > attempt the SCC where never configured and tuning would succeed for some
> > stubborn cards. This patch restore this behavior which allows a troubled
> > card I have to be used.
>=20
> Hi Wolfram,
>=20
> Is tuning retried if the card is changed, f.e. ejected and a different ca=
rd
> inserted?

I haven't tried this patch yet. I work on finalizing the I2C DMA helper
patches currently. Let's hope this goes smooth, so I can check Niklas'
findings soon.


--4tgmmbazzsiv3lw6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlndywIACgkQFA3kzBSg
KbZuHw/+OKjeS7W2+i59N+tWXBoQ/YRYVOPwKa8nNinQ8JKqy8LY0lWRUPpybHzf
qIDGdhdBSbdXMPPORv+hVXu/semGoId3DsUXCx9XklBv7agLd2V0gYPlVyxnL+4d
oZyb3pfi4ilhTdD6TGE2V+9TRfC7xM76b6vku9Q9Fc10pEVIMf1HIk3EFVbFAdkG
ewtqYCYUE3IfuIam7GLHotfRC6mYs9hoDb7SkmYXhXksxqmqjt0b0cpryEF+91ta
iYqRUDZIXlO0p3hS80vdIVovEgV58EQW7MKshPxS/BoAgZQvPCqsGYNnH6tgTE55
Mx53mhnh1GNqHZswg5XD8KiBKEXseLh0N/6wzM/JAGZU0e/n67xDCuFINC+JvS66
Y3eFsIXeF23bPDHVwX9hRbaY+svWwwgUQKd7VXQL+96r0U/1ubHzoCpwBelU6+4G
ZPLCdc8VBHazRMykCWIlGxEmYZPDa2fpiAv19Smdw//pNcf35mI+gxLHMbGtHQlp
aNW1Y9lG9jyyxN/l50edhKRWbPdJakojTEJyrFHjngrs3ev+06drEZ+lJuNPlgNd
sp8i+fmadlRkKczxdeh05fTfx325yBY/EI5nMHeEMqL9BdFdH8MnN3Jal2+5Gl7X
J8xEiYJtk3zy9le3taBmrz+HHfOEh2231eDpLTNRazm3molU0EA=
=6a3B
-----END PGP SIGNATURE-----

--4tgmmbazzsiv3lw6--
