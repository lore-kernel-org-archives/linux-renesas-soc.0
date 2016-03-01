Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: r8a7795: Add CAN support
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
	wg@grandegger.com, horms@verge.net.au, magnus.damm@gmail.com,
	robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org
References: <1456755759-51288-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	chris.paterson2@renesas.com
From: Marc Kleine-Budde <mkl@pengutronix.de>
Message-ID: <56D54EFA.6020105@pengutronix.de>
Date: Tue, 1 Mar 2016 09:12:42 +0100
MIME-Version: 1.0
In-Reply-To: <1456755759-51288-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="DOQWuwIh0k0v96ThfUQwlcUoabwTsKnCv"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DOQWuwIh0k0v96ThfUQwlcUoabwTsKnCv
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/29/2016 03:22 PM, Ramesh Shanmugasundaram wrote:
> Adds CAN controller nodes for r8a7795.
>=20
> Note: CAN channel register base address mentioned in R-Car Gen3 Hardwar=
e
> User Manual v0.5E is incorrect. The corrected base addresses are:
>=20
> CAN Channel 0 - 0xe6c30000
> CAN Channel 1 - 0xe6c38000
>=20
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.rene=
sas.com>
> ---
> Hi All,
>=20
>    This patch is based on linux-next (tag:next-20160225) with following=
 patch
>    applied on top

Who should take this patch?

Marc
--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--DOQWuwIh0k0v96ThfUQwlcUoabwTsKnCv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBCgAGBQJW1U76AAoJED07qiWsqSVqZjsIAJZ5yDVFXnOTWA35uVymCA1V
1/i1TYpVusL7sU4tKtjuLQPRmisHl2laa8YIOyjZlyl4nnkb4cCN1bHeTRmpAgYf
BHQgv6uy4z18OBaphEf2+TK5gIfMaubeCBlSnyZqMnD/0DKnnjl4k3QircIN9Ql4
f2rPr7IlGZk1EujHutyLkAKp5SPJammRLVYTqaIC4hG7CU8JGs9OkZoJfGC+Iuse
GOezap083EsMymmKTs/InmHft4JIoyCbPYdzAaRIYcUHEan9JmkPOKZlbnRkmbR9
TSEPNeqgqJA0It5njzSM0Lizoavw5ASWscODW8lPXZlc04Ltc0smR9JZqATlt6Q=
=NQGV
-----END PGP SIGNATURE-----

--DOQWuwIh0k0v96ThfUQwlcUoabwTsKnCv--
