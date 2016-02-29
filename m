Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [PATCH 1/2] can: rcar_can: Add r8a7795 support
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
	wg@grandegger.com, horms@verge.net.au, magnus.damm@gmail.com,
	robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org
References: <1456737661-20538-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
 <1456737661-20538-2-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, chris.paterson2@renesas.com
From: Marc Kleine-Budde <mkl@pengutronix.de>
Message-ID: <56D411A5.9070706@pengutronix.de>
Date: Mon, 29 Feb 2016 10:38:45 +0100
MIME-Version: 1.0
In-Reply-To: <1456737661-20538-2-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="Qsc6qjR6hkmMe0dFLmbkfq7NGW9UKqASk"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Qsc6qjR6hkmMe0dFLmbkfq7NGW9UKqASk
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/29/2016 10:21 AM, Ramesh Shanmugasundaram wrote:
> Added r8a7795 SoC support.
>=20
> For smoother bit timing calculation, the rounded clock frequency is use=
d.

Why this? From my point of view this introduces a clock error.

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--Qsc6qjR6hkmMe0dFLmbkfq7NGW9UKqASk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBCgAGBQJW1BGlAAoJED07qiWsqSVqj9wIALV0Be3Dw2xV2MBDLliLjsEV
5d5vkR56on1+IqlyQsfIGgaffCoKOncnaZK0tlnR3r9RF9DmQUOlXEOkB9+VN9ss
SmmtpBsn2e6tRrmeYgWyllY+pv6qOiHWLuXWpfVXBnpNt+Pq7hrh7LbUO3U1Ypka
xZQ44xcq9HQgW8lcXIloOt+wSMl18ufL3h7ljnML8vEWKYJHKgEGgM+I3wrU3kMZ
G55PBXRafmHBv++8QjLEXF1cBTio2E7odkvoT9NdtkY86mi+8VNDu2I0cR7ompiJ
75/kfbcYF9RSu/irw29b5HHro7OleTdwfOcJ4uvL46FcDHi0xgg64JZALVFhVog=
=ookP
-----END PGP SIGNATURE-----

--Qsc6qjR6hkmMe0dFLmbkfq7NGW9UKqASk--
