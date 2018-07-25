Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:37996 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729187AbeGYUYG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jul 2018 16:24:06 -0400
Date: Wed, 25 Jul 2018 21:11:03 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Tejun Heo <tj@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] ata: sata_rcar: Add rudimentary Runtime PM support
Message-ID: <20180725191103.sjuvwzxzr2qfgtra@ninjato>
References: <20180720122739.30056-1-geert+renesas@glider.be>
 <20180720122739.30056-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="razmq7c6n2ektpql"
Content-Disposition: inline
In-Reply-To: <20180720122739.30056-3-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--razmq7c6n2ektpql
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 20, 2018 at 02:27:39PM +0200, Geert Uytterhoeven wrote:
> Replace the explicit clock handling to enable/disable the SATA module by
> calls to Runtime PM.
>=20
> This makes the driver independent of actual SoC clock/power hierarchies,
> and is needed to support virtualization, where the guest is not in full
> control of power management.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

For the record, works fine with the newly added SATA support for M3-N:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--razmq7c6n2ektpql
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltYy0cACgkQFA3kzBSg
KbaY0A//X3KJZAyDpd0hZz2iQPLCT+164/VG6c7rcQoiQqitvEy4zygB1LfE3qNl
wea9xJ+DUFFbIc2Xq8S96PC1FM+8saXu5B3MkL46CItIjG5cwVbK8lwZfmBJ3RLt
lu8i6pfVe811T6XEaUh7WNEO0RKI4F/w+qeb88H7S1IPLXRfAdNti/kqjtUvL815
cIi5kOt94hVQor1y9GIDLwXLPHwzN+UP9aCIF6wigGhGJmXQW5qjFIPWdFiH7oQA
fNy4p3p9cG4zpdbV5y/jUdyWgVC0ZhDaBm49RaAKIZCPPVf17Nklky3g+sS1jy50
wjVJbMOC8bMP/Ru8QCm4XmAMsrRTzkJ3hVy9M7iDhW24HgtN8QlmLy5NsEjFTxGU
9sNw1alm6wLcFRWgdg993L8nAHUdMokmj5tC5olP/j1l3gU2A4SDeDOD/P8bEDnr
JESC09Tj70dOMvBBpIVn2eqFt8ahee90i8/7bVt/winOgXTOnoOjADqJjlSPQg/R
Hsc+2geQ4vOz7JU2zkPk3TVmHf487LcPsyasEoUZB8dwdOs0KrCDYjkDnpZOPmgY
FDCxSoBG8a9fjCgwxKuY6xeuvRFOe+98Lf1edTEiC5RnOUQyYpVhfTbsmg0KAMk+
HeH6Q2TjooC8Gp9+B6NAxRixC5Jp72VU1jcUi4JFAFE6JNk8LHI=
=qZEq
-----END PGP SIGNATURE-----

--razmq7c6n2ektpql--
