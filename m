Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [PATCH] can: rcar_canfd: Add Renesas R-Car CAN FD driver
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
	wg@grandegger.com, robh+dt@kernel.org, pawel.moll@arm.com,
	mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
	galak@codeaurora.org, corbet@lwn.net
References: <1456824849-7987-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-can@vger.kernel.org, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, geert+renesas@glider.be,
	chris.paterson2@renesas.com
From: Marc Kleine-Budde <mkl@pengutronix.de>
Message-ID: <56D5FE8E.1090400@pengutronix.de>
Date: Tue, 1 Mar 2016 21:41:50 +0100
MIME-Version: 1.0
In-Reply-To: <1456824849-7987-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="GIqJh2blIPdeEokw6tb033F13etDSiOQu"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GIqJh2blIPdeEokw6tb033F13etDSiOQu
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/01/2016 10:34 AM, Ramesh Shanmugasundaram wrote:
> This patch adds support for the CAN FD controller found in Renesas R-Ca=
r
> SoCs. The controller operates in CAN FD mode by default. Two test modes=

> are available and can be enabled by the "rcar_canfd.testmode" module
> parameter. Refer to Documentation/kernel-parameters.txt.

Is the channel loopback mode configurable per channel? If so, please
remove the module parameter and make use of CAN_CTRLMODE_LOOPBACK to
configure it.

> CAN FD mode supports both Classical CAN & CAN FD frame formats. The
> controller supports ISO 11898-1:2015 CAN FD format only.
>=20
> This controller supports two channels and the driver can enable either
> or both of the channels.
>=20
> Driver uses Rx FIFOs (one per channel) for reception & Common FIFOs (on=
e
> per channel) for transmission. Rx filter rules are configured to the
> minimum (one per channel) and it accepts Standard, Extended, Data &
> Remote Frame combinations.

I see no locking for the tx-path.

> Note: There are few documentation errors in R-Car Gen3 Hardware User
> Manual v0.5E with respect to CAN FD controller. They are listed below:
>=20
> 1. CAN FD interrupt numbers 29 & 30 are listed as per channel
> interrupts. However, they are common to both channels (i.e.) they are
> global and channel interrupts respectively.
>=20
> 2. CANFD clock is derived from PLL1. This is not documented.
>=20
> 3. CANFD clock is further divided by (1/2) within the CAN FD controller=
=2E
> This is not documented.
>=20
> 4. The minimum value of NTSEG1 in RSCFDnCFDCmNCFG register is 2 Tq. It
> is mentioned 4 Tq in the manual.
>=20
> 5. The maximum number of message RAM area the controller can use is 358=
4
> bytes. It is mentioned 10752 bytes in the manual.
>=20
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.rene=
sas.com>

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--GIqJh2blIPdeEokw6tb033F13etDSiOQu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBCgAGBQJW1f6OAAoJED07qiWsqSVqAjwH/i4mLL4qeMBR+hklz62SmJj7
rmoMLZu9dWIqaP4/Wo6mWi/Hh8/gosJtVhktdIi7lp704CfEGPp4M2ItsEhSjz6U
OgrJSd9lYEzuYg3bNvLGga6dv6rtc7ZGCcgml01NQ1g8E3URRHIfYAK+ieF/hE0Y
CH/AfInQyTNlcDdlAhz7YQ7H8C1wm0AVkSf0LyTFol59E9cyY33pYtQeJJI5rTIT
jws+F4rkG5BEZ04YGFQ6uAH4Cy/wbDkuUuoDut2dTlmSRHNPSjDMNV0wQ9cxtnPh
bMMHwGDEXR5AHXMqcSKqANTVjINEBFst6Wa6kQs8jhz5zESLn786J1XJPQlA4uA=
=ycxc
-----END PGP SIGNATURE-----

--GIqJh2blIPdeEokw6tb033F13etDSiOQu--
