Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:52800 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727988AbeH3N7O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 09:59:14 -0400
Date: Thu, 30 Aug 2018 11:57:52 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v4 2/3] mmc: renesas_sdhi: skip SCC error check when
 retuning
Message-ID: <20180830095752.l3bgsm2ou4lio22c@ninjato>
References: <20180829233207.30646-1-niklas.soderlund+renesas@ragnatech.se>
 <20180829233207.30646-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4ql2bt7yaemlwaqk"
Content-Disposition: inline
In-Reply-To: <20180829233207.30646-3-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--4ql2bt7yaemlwaqk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 30, 2018 at 01:32:06AM +0200, Niklas S=C3=B6derlund wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
>=20
> Checking for SCC error during retuning is unnecessary.
>=20
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> [Niklas: fix small style issue]
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--4ql2bt7yaemlwaqk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAluHv6AACgkQFA3kzBSg
KbaTpQ//d8ajOWOFjNBaNQOkfiBiL12iSbS9z5FsvjtOHvjjdoFP6oY5ASztvzD7
CP150uWm6H17cqJX+NBNyLWFdyFBNWX6CaGVB4Fiu6Bdz5hHWeopfsI09tzocJxP
4Qv4ZQNG/r0YfFSIOZ2sUlR9JzeCW4vZOPJ53K03+GPUNbBqV5H5Z1C5rfJhmTCv
vVGJ36yhQZX0OTPrqLM5Cq10DwRd/xQEbfIwxyBQP3AjTnbnBjpoxopM5cvRgpOq
l/qVOxPv8LjisLr4Cz0wtH43NxCIynKHmZ+rPxYKxVyUJDcNKXBacNMGnQaQ2Hme
oACjvxjDO7JQyVV2z/QVQhNecZCW/t3NUN7JA67fmkbfN12j1fbgWlPZLNRQRJKf
QrTVPqr7NEBOnmtdxcsAv52/JWu9J/8yZOVpof3GBvFBGmExgJH2+/YXF/hDADMB
9kVd2+hwRTULKyyqb5tmNyjrz2S6bUV3DcmImnC4DmXrg/GIcaKUzmrLPcLYeptn
7lzcBSCgNB77MDVpUZVpN96oIbYLkzfE6nGu8kkW0uwVfA5lrqiDdSpi/2E6XGqU
fYcwPyN0EQ3ceOuRlkpdyFV7v/tvIGYCJ1pFESujsdgWV2U7yJgq3l+JPVt3pih2
IxoM8HzVmEmbGeBW39z31qlfKzIb+DPDxKHTXX4wXFH/GN1lDho=
=lC2U
-----END PGP SIGNATURE-----

--4ql2bt7yaemlwaqk--
