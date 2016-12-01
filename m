Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:47673 "EHLO
        metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753640AbcLANYp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Dec 2016 08:24:45 -0500
Subject: Re: [PATCH] can: rcar_canfd: Correct order of interrupt specifiers
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
        Chris Paterson <chris.paterson2@renesas.com>
References: <1479908686-14028-1-git-send-email-geert+renesas@glider.be>
Cc: linux-can@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Marc Kleine-Budde <mkl@pengutronix.de>
Message-ID: <81027038-8cf6-716b-c0a8-dc2343b93d70@pengutronix.de>
Date: Thu, 1 Dec 2016 14:24:33 +0100
MIME-Version: 1.0
In-Reply-To: <1479908686-14028-1-git-send-email-geert+renesas@glider.be>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="ILdBRDmh1GxT8KQ9N1ABKJ2M7ANNK1dVn"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ILdBRDmh1GxT8KQ9N1ABKJ2M7ANNK1dVn
Content-Type: multipart/mixed; boundary="jIfpoabaDQFDq77gFrl9p8TCsUqDHRbVP";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
 Chris Paterson <chris.paterson2@renesas.com>
Cc: linux-can@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Message-ID: <81027038-8cf6-716b-c0a8-dc2343b93d70@pengutronix.de>
Subject: Re: [PATCH] can: rcar_canfd: Correct order of interrupt specifiers
References: <1479908686-14028-1-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1479908686-14028-1-git-send-email-geert+renesas@glider.be>

--jIfpoabaDQFDq77gFrl9p8TCsUqDHRbVP
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/23/2016 02:44 PM, Geert Uytterhoeven wrote:
> According to both DTS (example and actual files), and Linux driver code=
,
> the first interrupt specifier should be the Channel interrupt, while th=
e
> second interrupt specifier should be the Global interrupt.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Added to can-next.

Thanks,
Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--jIfpoabaDQFDq77gFrl9p8TCsUqDHRbVP--

--ILdBRDmh1GxT8KQ9N1ABKJ2M7ANNK1dVn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEES2FAuYbJvAGobdVQPTuqJaypJWoFAlhAJJEACgkQPTuqJayp
JWrYhAf8DV4nJQ7xTYC23sjccBNoEXGkESvlq6ZQw4/CT2bvPKFGniwL2ezkY1TK
cwnK6IKavZtN0IgZS61e5ktX+ORniSP9Hq1h1swlnqlNb5BgmQc059v/rNPkzCdh
YClEScIHtVoC399/cAa1xX51GGAlt7sm5Z4UoRBj7/iruBzYFKIjGZ2OfMXmhoTE
kFS+uGfsPseqIwaQ1+fPyflAcYm+ahJlhh4c5Gpni5HLcSM5ZmLtXEQskmvuEi2D
rRQs5vMUOrZLHv74gcqOAYhsBrGvv+6P56rmW1ui9wbDeO4GqQ04Vi78VjilD6ov
svniJeMlNCQWoLYPl67fbgBexpOftQ==
=iPGA
-----END PGP SIGNATURE-----

--ILdBRDmh1GxT8KQ9N1ABKJ2M7ANNK1dVn--
