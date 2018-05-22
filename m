Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58886 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751192AbeEVMez (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 May 2018 08:34:55 -0400
Date: Tue, 22 May 2018 14:34:53 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 9/9] ARM: dts: silk: Drop MTD partitioning from DT
Message-ID: <20180522123453.64rhv55bbxflvkej@ninjato>
References: <20180522120257.13232-1-marek.vasut+renesas@gmail.com>
 <20180522120257.13232-9-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="h54fmdfvmo7isdy7"
Content-Disposition: inline
In-Reply-To: <20180522120257.13232-9-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--h54fmdfvmo7isdy7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 22, 2018 at 02:02:57PM +0200, Marek Vasut wrote:
> Drop the MTD partitioning from DT, since it does not describe HW
> and to give way to a more flexible kernel command line partition
> passing.
>=20
> To retain the original partitioning, assure you have enabled
> CONFIG_MTD_CMDLINE_PARTS in your kernel config and add the
> following to your kernel command line:
>=20
>   mtdparts=3Dspi0.0:256k@0(loader),4096k(user),-(flash)
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: linux-renesas-soc@vger.kernel.org

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--h54fmdfvmo7isdy7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsEDm0ACgkQFA3kzBSg
KbZ1KQ//T+QAr6VfAf2xgzGareBz8/d3B5isa3KrZoZLAokYVH119k5hdSbE88Nv
uEtlvQydY8jmIrAt8d/Jj8a0wXnRIPOKrFbyiD68TMvHhOkqguC/Plkx8Y4YU2Gv
H3UWB+oMSN/SNVTiUDuez+Nzkkt0lyH/RE0n29BRdPtSmJBAVNaZJvB96kooluYL
XtK079tElkUvWL2CSse3ZijYi0wO9LWJ+4HsrL3nbHK7H5bBGqwKJy5w49ORg8/P
SQsR3HpaiznqkH5I/JkMv6VSfVQLbWZyyDn8BRvUEtcmhDA0o0ZrEvRYWtEhzW4K
YTAaGuFKiWhyZEgvsjJ10Xu86COVes1agluOjOWfWXhW/hPkybvWrujHe0ueKCTj
ACO9ECMqqMHjDlQoXROMVne5MNypgW2CMR1CAfMXH0tOJIvvYD/D9j5em9AH+MnI
WPzSEPE2ye+gey2oUkV8CIya/9l20dQ/k0kO92XEeFg+/z0Y0W81BFyyVRZfBJOK
7N4Okz1BjuNs4Ek2JMk5ZJ78R15d4iiBZ67xFaO3fO++sSVJdmvPQti9vEGnSoG8
88Q0Gek5e9gbUwEPT491hznf389nJdlRhC2AmI1/XjulsvHaw42eR6jN0qTbiQEw
yVwiC6NjQG/HfjpxAmFRWJ31sR3cPFE2w96zqxtXZ/SzlZYisgw=
=bxIk
-----END PGP SIGNATURE-----

--h54fmdfvmo7isdy7--
