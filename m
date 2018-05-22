Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58868 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751236AbeEVMev (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 May 2018 08:34:51 -0400
Date: Tue, 22 May 2018 14:34:50 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 8/9] ARM: dts: alt: Drop MTD partitioning from DT
Message-ID: <20180522123450.7elahuoh6rfvbpth@ninjato>
References: <20180522120257.13232-1-marek.vasut+renesas@gmail.com>
 <20180522120257.13232-8-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lxjcjcjrzgpsvbru"
Content-Disposition: inline
In-Reply-To: <20180522120257.13232-8-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--lxjcjcjrzgpsvbru
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 22, 2018 at 02:02:56PM +0200, Marek Vasut wrote:
> Drop the MTD partitioning from DT, since it does not describe HW
> and to give way to a more flexible kernel command line partition
> passing.
>=20
> To retain the original partitioning, assure you have enabled
> CONFIG_MTD_CMDLINE_PARTS in your kernel config and add the
> following to your kernel command line:
>=20
>   mtdparts=3Dspi0.0:256k@0(loader),256k(system),-(user)
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: linux-renesas-soc@vger.kernel.org

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--lxjcjcjrzgpsvbru
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsEDmkACgkQFA3kzBSg
KbYkQg//bHdUNi/xEYKyYxou4GyXPcq6447E2O4ghx46PQlPPJkZhMPUVQ6a/L0z
RNcA9BNPA/KpoGSxwbKQ7yehIy4CHo6pluSGQWa+HJemuq4acAKHDvh9aBzmTwLQ
uitK7Ye9p+GQFhCkYYKhSRx64mrD043UjyocjCmV2+2pG+EhQKE7eIM/ZUWvrBDp
qfpWufinhQIaScjbz/z7xY3AM5LII6QfVamIC5aY0CNX1iiadFSzx38jSC/WY30d
16P8zXQp4t5OlD6p1xPxfxR/NOFZ3VFCbeDRFodrsOJvaQXxAH/xGT3hs6Tphsij
8Pkrr+4XRTliToK4VbspcnNGicDEHBjO9NQcbiHlKk2ChokwpaI78JMBOUYk9+y3
xx3gjnY4uSJC46+EjruULzVlT/86gZXqLS1Xdl7t9KngkCKkId7ppsNGqR5UT+y5
6UQPbAQrB+gPu4+qP+aMre+mJSQPlisctJKmklTn01VQMmgQFYoIM5SUGsnVUxtu
TZd3tMTU0OeayC1ZVOfyx6GQ8zmaFCPJSDsDKaBnAyc9MDARKIb7dDmw9KsPZhHc
bOXN6u5/QV+4tAfqC5T0u1Gq+CYhlzlT/itFb3jLyudTu1v3sIuC9B4nejI+TtRS
t2lQ1O3eu/uorv6IM5aaBd/Uvjj2MbWWOFccXVKWwecsaXtF0AU=
=k+cQ
-----END PGP SIGNATURE-----

--lxjcjcjrzgpsvbru--
