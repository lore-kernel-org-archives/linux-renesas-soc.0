Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58814 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751192AbeEVMec (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 May 2018 08:34:32 -0400
Date: Tue, 22 May 2018 14:34:30 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/9] ARM: dts: stout: Drop MTD partitioning from DT
Message-ID: <20180522123430.ogiv2dxpv2jp3ejw@ninjato>
References: <20180522120257.13232-1-marek.vasut+renesas@gmail.com>
 <20180522120257.13232-3-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3sgurtknfbbrgete"
Content-Disposition: inline
In-Reply-To: <20180522120257.13232-3-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--3sgurtknfbbrgete
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 22, 2018 at 02:02:51PM +0200, Marek Vasut wrote:
> Drop the MTD partitioning from DT, since it does not describe HW
> and to give way to a more flexible kernel command line partition
> passing.
>=20
> To retain the original partitioning, assure you have enabled
> CONFIG_MTD_CMDLINE_PARTS in your kernel config and add the
> following to your kernel command line:
>=20
>   mtdparts=3Dspi0.0:512k@0(loader),256k(uboot),256k(uboot-env),-(flash)
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: linux-renesas-soc@vger.kernel.org

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--3sgurtknfbbrgete
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsEDlYACgkQFA3kzBSg
Kba8ZQ//fDUU5LDSpFQCBnOt2i7VHs307yUt5g2FigoIRfAtEsIbz4jlUQZPZ867
wuE4i8yo5luGXqYfL3Ao7sWV96DnXxeUqx8GSxwuxL0XPHMxLYmhPpX5A4N+iM3Q
x+fvvEwDUEZdx1Hv/stJBl1IpCHSCYiIOnZaCq4ozTZZYTzGA4/KGkMjPaPka3Mi
HuItURZXeXJ/Uaa8MRVSKRawWYaPZZ4GpFjfj9K5YRg15O1aGKvkUaFN+IU7yKyM
/XfeD76b02lPppMEeSNlLK7wiyalskzwVcDx8efByLduEHRgUkzw0tm/OCOKpP2l
62uBgKDMlO0Sr7TQi3Ng+E7rcYM1OMdcZn5HqPCF2RwfT8l6+i1kRdmZvM/cllVg
YTwCG/WGq9b7emy0c/j9AFo9vF/vo2kJAy0qnRIG/JsB8ZkYN6PDOn5PPTHO+aBY
rQRnr85FNDcO6tlJKz1uvOn09Spj+7E1+Hlm99yZ+3DlBaW9kcHaOYx6DsC0oLoa
AE+mAmOxUhpV7dHRyOxmUBMzeaE9uTziQWhPBklOCty1nDls7boSukCKNoNF4bKE
AnySNAO2p5nR3UH6Xl4FIy71QAAzRPMATE7z3dE0jBtvjEh2l6OcH0lKpimzb4d6
8NYRoISOHYMmYu/j5jfUtRltMgM9SdarVLQlD0MTGy467c5W0dM=
=hTyY
-----END PGP SIGNATURE-----

--3sgurtknfbbrgete--
