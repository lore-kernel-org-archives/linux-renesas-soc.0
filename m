Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58756 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751192AbeEVMcz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 May 2018 08:32:55 -0400
Date: Tue, 22 May 2018 14:32:53 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/9] ARM: shmobile: defconfig: Enable MTD command line
 partition parsing
Message-ID: <20180522123253.gvxinjmam5hwse5c@ninjato>
References: <20180522120257.13232-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4bbgvzjmey25ks6c"
Content-Disposition: inline
In-Reply-To: <20180522120257.13232-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--4bbgvzjmey25ks6c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 22, 2018 at 02:02:49PM +0200, Marek Vasut wrote:
> In preparation for removing MTD partitioning from the DTs and moving
> it over to kernel command line partition parsing, enable the support
> for kernel command line MTD partition parsing.
>=20
> The argument for not having MTD partitions in the DT is the same as
> for not having hard drive partitions in DT, neither describes the
> hardware itself, so it shouldn't be in the DT. Furthermore, kernel
> command line MTD partition passing allows greater flexibility in
> case someone decided to repartition the flash, which is well in the
> realm of possibility with these systems.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Makes a lot of sense to me.

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--4bbgvzjmey25ks6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsEDfEACgkQFA3kzBSg
KbY+dg/9HMlpFXhuk4Qd5jIwAs2znBC3GnO+RH10krylfgWdqaa4uzDt5ibzRDCs
UBroGdOxPMforBaSy0pCa2fvKFXDnYDWqFqe+fHkcfcGPeMUg6CF4XT+eLFONSvl
jPBJJrrtkfTcd6baKe2sc0QGEooHrZU3v6uptcU0R9hGoe4Q4G9+41vnOdZNgDgA
l+TQawaGB7tq5gs80YUns56qlRLmrlOEr7JHexin3j7eAL5PAGEMWjRkCxXK7dvQ
Pcpil67/Isc6P8VPBJsM/NDmTWqTh3NybQm9fYKkCQl3vlQDd9sMaWcsI2/28ZS6
xo+sW214unS4pK+wvzD7G0hcWWs81lkCa63tMK80CH1EHDhWF1u0eKXtKQ6smi9T
zukkf2nTHoFAjTHEuadI6bZpCp95JAf8hVaF5dnnModsB9hV7TprfnfWzcIOqQGk
fbaKR8C0nWUMYkjXBfPelmLCL/CM8Hrp+o05W0uHKc6aeAo7EpVJP7/oidqnXwdP
aaOhoTteFgLFXolUEikZwSqrasQl1nSf3qIiaPIJ0+e48MghFh/+V7JGE3ej/J/K
BB71aLOPdqCcL+q3+DEKyQYUj7FPYyEBiXTJ9kUQTBTL/hT1EZ3N/0z39Xz6cyau
3S3x642M/MvozeVYkmNhMjr4sF6ZM9qPmDmQk+l/JUi1lmVz/Rw=
=24iJ
-----END PGP SIGNATURE-----

--4bbgvzjmey25ks6c--
