Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:49398 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726976AbeKFUke (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 15:40:34 -0500
Date: Tue, 6 Nov 2018 12:15:50 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a77990: Add voltage switch
 operations for SDHI
Message-ID: <20181106111550.zakxqk2rkcmmqtnc@ninjato>
References: <20181105214012.11626-1-marek.vasut+renesas@gmail.com>
 <20181105214012.11626-2-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dlxtuqs3z5ebrdu3"
Content-Disposition: inline
In-Reply-To: <20181105214012.11626-2-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--dlxtuqs3z5ebrdu3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 05, 2018 at 10:40:12PM +0100, Marek Vasut wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>=20
> This patch supports the {get,set}_io_voltage operations of SDHI.
>=20
> This operates the IOCTRL30 register on the R8A77990 SoC and makes
> 1.8V/3.3V signal voltage switch possible.
>=20
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: linux-renesas-soc@vger.kernel.org

Looks good from a high-level point of view. Didn't check the actual
values. I trust Shimoda-san and Geert for that:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--dlxtuqs3z5ebrdu3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvhd+YACgkQFA3kzBSg
KbbULQ/+MFtW0+NKhIVsN5z4Md0iXkkhBFk55TLCA3MjEbWp2t2ANO8o3q2CIfVk
IbRCmoIyBxtiITiHITcXA08ReyD1nMdiRJQ0mv2zkPpCu1p658Pe7wnwSNSDMA2Z
od2AdWMa5jH5psT1/JPdv1SweeA4GpbOjBwO2MuYYhxiwC/f4TQIoV6PO80AKmbN
yWhxEw8juc/MMObRIjYIAWaj8apSsfQGaTLb3MQbsYUdKK9r8bMB/+FlZGUZ/ebP
2xK2CMsiZBEbGhwpnftZz0q7N6HgwAr87eG1IbLYelDev2XV4JcpFhU1WZrHL9Wl
45bpNMI+T7CHP2zeZrONpmLPao/v4ohzbQZEQSgKH0dtKhAM4EoqH8jv8cJYn9s9
/7K+ezbWYtvuLFujIItllALD3kV8RqeVFD/m1ymI56QMK231RV/SMKINaExx3tD8
JlTKrA7rO4kyLo1yPcDTJino7o8xptRVln0eSo2VgESUppj9T76tR0GODp0t2q92
80oT9a0zt+7HdEKiWfTc8ld6EiZ6+su/dgYD1BBGZz0PjO2jdvJe9i5G9VTDSWtL
RE9BsUJMlkPIpitdpJ8/fwkvVN/Nmf/DKm8rzEQp+Js2L+YiARSSikQgHLoqZtg5
gbaWqSbIUKJN1u6Rx2tQ4fyAIUDXrHx3ZYBaUQAdx6oxnZ4HEgc=
=ZizX
-----END PGP SIGNATURE-----

--dlxtuqs3z5ebrdu3--
