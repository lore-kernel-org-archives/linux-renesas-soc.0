Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58478 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726287AbeK0X2d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Nov 2018 18:28:33 -0500
Date: Tue, 27 Nov 2018 13:30:45 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: sh_mobile: document support for r8a77990 (R-Car
 E3)
Message-ID: <20181127123045.GM1107@kunai>
References: <20181121120928.25179-1-horms+renesas@verge.net.au>
 <20181121120928.25179-2-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="C01fF7hLGvN0zd9s"
Content-Disposition: inline
In-Reply-To: <20181121120928.25179-2-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--C01fF7hLGvN0zd9s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 21, 2018 at 01:09:27PM +0100, Simon Horman wrote:
> Document support for the IIC code for the r8a77990 (R-Car E3).
>=20
> It is not considered compatible with existing fallback bindings
> due to the documented absence of automatic transmission registers.
>=20
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Applied to for-next, thanks!


--C01fF7hLGvN0zd9s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlv9OPUACgkQFA3kzBSg
KbYT0xAAqfW6HYsASmlZXgALuVtxHZoU/uQM/as+qSzsva79QrNiJ8yFvXIM2e6Q
SiITSGTf9T0mdx4lfYvGJJ+5yFNtdAsonk++UqTbNiJijcvePFCat7sBFl7lzqOW
g0hL03cuctC0ahR68aD9/G0cXMfVELKWozcuH/795xox8eiYCG/CosbxbQsPoh7Y
G1gmxL2k6ZJt8nVIL+lEN7sEWXo4EXBTISiX8GgIbfg/3DJ11rgKfPjt+qTe2W/y
nGWdHM/wTWbx3ZG+tAnCr5ME4Vhk4S3pG7vL80qEzI2JKlE08o9FP/HsIfa+qcc1
HbRovSlUamkKR/ZFJ9Swg4tPrsq2TZHA63J9a6IcJ9I5zZW2Zq/itDI94b45Pdbn
ImBrNWnPFvJ8d9G649mqbYyjWUmoyYC83g2y3QBLtzc7b+6v+UWC43DBHNrFBqM6
+ibfPM/3ObxyxdLWcA/3GAtzFHooTSwjYTTLbrfVy2SY5pkatGsYCvMVLl9t8j4b
NXHlWtdvff18yPuWeOAvklhVkgyx6Mh3Cq+KkpGrETkqb9TnqsU1cAiUaQtxSY/f
4/N3dXkf7/Nt76lVTQNs1saj7sVSNdin18laouZxzxdUgJOF5FlV+UsI08twNcmU
hJGqSQaClLeTbrMgs8t88zQFAPSBwEQ8qQOmet2Ywm6rIE2x6Ng=
=Ads7
-----END PGP SIGNATURE-----

--C01fF7hLGvN0zd9s--
