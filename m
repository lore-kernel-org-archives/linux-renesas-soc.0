Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:59556 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726194AbeJTGVY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 20 Oct 2018 02:21:24 -0400
Date: Sat, 20 Oct 2018 00:13:26 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2 2/3] mmc: tmio: fix reset operation
Message-ID: <20181019221325.GC4548@kunai>
References: <20181016013832.2385-1-niklas.soderlund@ragnatech.se>
 <20181016013832.2385-3-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oTHb8nViIGeoXxdp"
Content-Disposition: inline
In-Reply-To: <20181016013832.2385-3-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--oTHb8nViIGeoXxdp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 16, 2018 at 03:38:31AM +0200, Niklas S=C3=B6derlund wrote:
> From: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>=20
> SD / MMC did not operate properly when suspend transition failed.
> Because the SCC was not reset at resume, issue of the command failed.
> Merge tmio_mmc_reset() into tmio_mmc_hw_reset() in order to add reset
> of SCC to tmio_mmc_host_runtime_resume().
>=20
> Based on work from Masaharu Hayakawa.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

This needs to be rebased on top of mmc/next because Yamada-san
introduced a new hook for reset. Hmm, I thought I mentioned that before
but can't recall where :(


--oTHb8nViIGeoXxdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvKVwEACgkQFA3kzBSg
KbZN+A/+OPQioRkRvcES9ZdtYfgTxB/jrg3L3ZiLBAhjMbAWpYCG798V6MWlZBYP
/0mIKQcQ7otkT4UKkRDvwGDy4nre4M2pY+i/ghCPx/IQf8/sY9Crifta9S4Y7+Nk
OrfSjHWUptPhO5rlxgwp76S5UcTF53OJi+xMPuT8Uoie9W+QIeC8CpNITqbn5N0a
SIZUdYU7Ym54Wio7tn30EtPX5gYR28HCYrfKLIMJ2T7OxpYM2WmzZX+NWxANfQpv
qjIWHfklGgLYzGwDPzc1Hxz9oHOxlyc9flVIhY9iPF0Gv1WcX3Igei/seBuiuktO
YBWWLSTqiWq4t7fvtJZJB/GuMZfbOUdXedBTOnOlqsqdAaOnKwquDAFamngOznfM
F28LyvNZtGSv3Qn7J+dwqCrX5Ezo34rl8+XmX4xTWHsACye4HXH4Kay8JGTSZxV7
bckXO5Ys12oRjkMv6Lc4gIH/2vpg1cJHzTAhgpJb0swJRgSlBQRXtivwMlj3smzw
TNj0Gw/y2t7xCciY1eg+0lAo553x/HwJr0aIWoGdxglDeYuZI0I36dF2QMWQPQ+f
8BinPwa4ck7c/YY/Ao7H676Jwk2CC5T8kwsu4COo6puQ3wUr6UNgaSKclKOwgYar
pjBcR6rIawzNbm5EVNQIFKvyZTWG0HbMNsQ6P1nb/v9CsDjgKa8=
=c8yK
-----END PGP SIGNATURE-----

--oTHb8nViIGeoXxdp--
