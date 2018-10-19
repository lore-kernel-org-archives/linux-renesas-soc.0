Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:59618 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726194AbeJTG2l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 20 Oct 2018 02:28:41 -0400
Date: Sat, 20 Oct 2018 00:20:41 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2 1/3] mmc: tmio: enable module clock before resetting
 when resuming
Message-ID: <20181019222041.GD4548@kunai>
References: <20181016013832.2385-1-niklas.soderlund@ragnatech.se>
 <20181016013832.2385-2-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="n2Pv11Ogg/Ox8ay5"
Content-Disposition: inline
In-Reply-To: <20181016013832.2385-2-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--n2Pv11Ogg/Ox8ay5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 16, 2018 at 03:38:30AM +0200, Niklas S=C3=B6derlund wrote:
> From: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>=20
> On runtime power management resume, the host clock needs to be
> enabled before calling tmio_mmc_reset. If the mmc device has a power
> domain entry, the host clock is enabled via genpd_runtime_resume,
> running before tmio_mmc_host_runtime_resume. If the mmc device has no
> power domain entry, however, genpd_runtime_resume is not called. This
> patch changes tmio_mmc_host_runtime_resume to enable the host clock
> before calling tmio_mmc_reset.
>=20
> Based on work from Masaharu Hayakawa.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Basically a good change, but needs also to be rebased.


--n2Pv11Ogg/Ox8ay5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvKWLkACgkQFA3kzBSg
Kbbd/xAAnSDIPEkaoeifSWbKEeKEUvK7pPqkK3ryOWr7VqgYwOVK+7WPCQyPe3Yp
cCM0S42gu0Q2A5oDgVBZtkS+RyxEtYRpRNSitYK7RujN6+gmGUnwPsDcs9hxr9FK
dM4lpd0b0mtSEx9qA9Ovx6JHIe+ofY+rDNNHOpYRdkbu3iuQbym4NrSe2PCOC/Iy
nlvxsYpiImUunwtdeJUBFAFEXGxYk2E9YHvb5X/+HAksO3PefVeqAVq9fqjKmOTF
BmKhajJqizGzAfpzFdCwRDFRkX1/Kf3WDV6EbP7xt6hOpbzRwCxEUlE8A6zKkpmB
NvGI1HphnBvO7zQbvgvXeXy/T92FiPrYv0T0/3tXqF1GAj04vbQ6KiFT73GBxLWC
jlyssTFAA21XUvUFelBM1O3tZYtKUMRGTrgaM/5oTGHU3jH+qy+hL5640mMzkU4c
oneIlhR4bgiu1qqaMYbM26Si9u/Iwt9TIo/khRqTFQsL2tTVltxxq6WiYhyz4z5Z
VuUBNpb7WouhqFaxvF328obP8TOQFKTWe5iqoplAQP3tEyqQermKE7fvnUW8Gsgb
GUT320VgeiRi4/5ywrVTZAXZ3YZhswXcIWHVTtPy/2a3O5kPCi1FmT4PEsJ+c86r
Hxx1h3XpiGt2AWSZl0aXvNM9h885Ofj7oxNANpNiqRq8zTiaItE=
=SO/K
-----END PGP SIGNATURE-----

--n2Pv11Ogg/Ox8ay5--
