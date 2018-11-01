Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38458 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725722AbeKBEGw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 00:06:52 -0400
Date: Thu, 1 Nov 2018 20:02:31 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v3 2/3] mmc: tmio: fix reset operation
Message-ID: <20181101190230.GE2433@kunai>
References: <20181031230554.1660-1-niklas.soderlund@ragnatech.se>
 <20181031230554.1660-3-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7CZp05NP8/gJM8Cl"
Content-Disposition: inline
In-Reply-To: <20181031230554.1660-3-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--7CZp05NP8/gJM8Cl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 01, 2018 at 12:05:53AM +0100, Niklas S=C3=B6derlund wrote:
> From: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>=20
> SD / MMC did not operate properly when suspend transition failed.
> Because the SCC was not reset at resume, issue of the command failed.
> Call the host specific reset function and reset the hardware in order to
> add reset of SCC. This change also fixes tuning on some stubborn cards
> on Gen2.
>=20
> Based on work from Masaharu Hayakawa.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
>=20

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--7CZp05NP8/gJM8Cl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvbTcYACgkQFA3kzBSg
Kbbifw//WfIKHdvPju/nQu5Yb6O8Ctmh6FwMpYXbO/iZv2N4uE0cCCHIS3yi0SHR
S+/QQpNBlJstMf9tPS81xZkzIHkd7JiRdFVouzRMIhdJe5stVVQ2dfG1v4SoKbbi
bJY9d61kl1Fsq5meF2fBx7QxoyvAwPACunTzIi33JnOvw6rXBbimflRUsp9uwWpL
eveR4NomXg6MOKdZ7/lYyzzrgIzhHDTizfBlUrqNkCGHGTMFIl/5fLnBh2OPvznJ
GVgTzh+AqanzgpyiDuSvdvrtDyyc2DpLERpGBcunuyIaUhZHvKOPSa6VFHWIbpHw
1olN7ezb1zuIY+V6oxzjAZoBPQXr2srgCDiDOkBHZ1J6rreK8br/H8sqYZeGRAeR
/tbblzarU/ktwbwZ/5NMGy3JCF8wFNba09OJcAU2d0WGfDN6wW+vOe1HhEZluXCA
o+ycwDJBaxsRUbQgsA5ODX70AKW4ui+J+6UU5caXkCNngzK4KvqZ/kE+NIPZsrnf
HdRfYnYSdG6xlOORM+J4WW4yb/4HEAuUHXfiwEqp3lYORpm0TXu/+uI3m+GCQtr4
PQamcd8auA5yiX+GSnhPA8VSQuS8N4kXjVOlkgMCmWFY93kBL0EfTyZBjLbbdWMf
6fbrq7BeZC53GlDGUC/4IdwP/lYWP6r2A9uKGG6s7E1EBxcgbGA=
=9r5X
-----END PGP SIGNATURE-----

--7CZp05NP8/gJM8Cl--
