Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38432 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725935AbeKBEFj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 00:05:39 -0400
Date: Thu, 1 Nov 2018 20:01:20 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v3 1/3] mmc: tmio: enable module clock before resetting
 when resuming
Message-ID: <20181101190120.GD2433@kunai>
References: <20181031230554.1660-1-niklas.soderlund@ragnatech.se>
 <20181031230554.1660-2-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sXc4Kmr5FA7axrvy"
Content-Disposition: inline
In-Reply-To: <20181031230554.1660-2-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 01, 2018 at 12:05:52AM +0100, Niklas S=C3=B6derlund wrote:
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

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--sXc4Kmr5FA7axrvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvbTYAACgkQFA3kzBSg
KbbS5A/+KaJmjIdYBt3q+RJPZf2SnMW05SVqFjOBlsSVWvbmcW64PqFmRC5rpkGC
At3iD6HBv8fRarQBFeEuplWZITs6ysUN4cycfouL1amWBueRnXU8q/mfs5pBnT23
0jK2/xml6XjP4S7LsHAso0sQqdEL1JL0B19t6794cJ4xinLrI3B//aEZVkhBBi7B
4IbSsfk1hl4xix2nByiWctpgFPwUgwt+LIEYwie7Z7xyG5iR/dNc18ZLAQbAzvEE
rOYnU36IScEcjrUZ8u9FtaxaPfg6fprBqy4Kg7oqKXsL1t7K9iTsCbManav0ae57
xT/AZESRxGRzNh/NTfmrCc51jcGCQLgx/yVbUWIka08TpCgqfM6byJLqleT+Kqw3
fZyNPsCoRloOVTeOnOKlGkD+xjJSXMdfk+kcyjJMu2+L4vJ563zeibOs4TKS6Qs4
vw9beOxSSPAYZw3ndWYI1Enzq4SQPxp7tl/0vDhJycWBUE3zTSwCd2aNrPzNRw6o
zU22RCzfj2DL+cj5QlvKBLUjprIQJTFzAhiqyltWE7e1eqjxydjpne5hQCpcFHH6
Lbt2VaT2fVL6JAz7AdWyVo8Wfm2QemxPP4DifMyX5o9kI46LPKDtBKjSskRjULB1
dgnDs2Gt9LdYi8KevuBoEQRQmgnjYYzwkEsedny7G8wUvdDeNyk=
=Wz+s
-----END PGP SIGNATURE-----

--sXc4Kmr5FA7axrvy--
