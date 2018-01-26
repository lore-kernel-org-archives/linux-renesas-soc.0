Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50139 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752642AbeAZKIC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Jan 2018 05:08:02 -0500
Subject: Re: [PATCH 1/8] dt-bindings: can: rcar_can: document r8a774[35] can
 support
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <1510067449-17017-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1510067449-17017-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <SG2PR06MB0886FFF48DD9DBE7693EEDBDC0E20@SG2PR06MB0886.apcprd06.prod.outlook.com>
 <da4afc82-aeb6-05d9-4a41-b2627f736064@pengutronix.de>
Message-ID: <8b8be356-e725-0dfe-a81c-dd495d97af88@pengutronix.de>
Date: Fri, 26 Jan 2018 11:07:17 +0100
MIME-Version: 1.0
In-Reply-To: <da4afc82-aeb6-05d9-4a41-b2627f736064@pengutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="GH2yxKvaNZHfgciUvIYaiCKImHgjAlJjP"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GH2yxKvaNZHfgciUvIYaiCKImHgjAlJjP
Content-Type: multipart/mixed; boundary="y7NX3G3pfh4eygjeTGUUmebJhBiDYRWAg";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, Wolfgang Grandegger <wg@grandegger.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Message-ID: <8b8be356-e725-0dfe-a81c-dd495d97af88@pengutronix.de>
Subject: Re: [PATCH 1/8] dt-bindings: can: rcar_can: document r8a774[35] can
 support
References: <1510067449-17017-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1510067449-17017-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <SG2PR06MB0886FFF48DD9DBE7693EEDBDC0E20@SG2PR06MB0886.apcprd06.prod.outlook.com>
 <da4afc82-aeb6-05d9-4a41-b2627f736064@pengutronix.de>
In-Reply-To: <da4afc82-aeb6-05d9-4a41-b2627f736064@pengutronix.de>

--y7NX3G3pfh4eygjeTGUUmebJhBiDYRWAg
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

On 01/25/2018 09:53 AM, Marc Kleine-Budde wrote:
> On 01/24/2018 06:22 PM, Fabrizio Castro wrote:
>> thank you for Acking the patch, just wondering if this patch has any
>> chance to end up in v4.16?
>=20
> I can take this via the linux-can tree, if no one else takes it.

Done - included in the latest pull request.

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--y7NX3G3pfh4eygjeTGUUmebJhBiDYRWAg--

--GH2yxKvaNZHfgciUvIYaiCKImHgjAlJjP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEE4bay/IylYqM/npjQHv7KIOw4HPYFAlpq/dUACgkQHv7KIOw4
HPYKnQgAoOaCK8795WzFTTSwyvwVo3zvZ8fkrnVCpK26OC/HyJ3O9KHIYTdU3ZIO
l58Km/422bz82DOmvN695z8xj70N/kvyXjlyWL/QOHrD/9GQ2HozHuVSQhQbqpp+
S8F5c2Uibs0NplY4vRyvlubLtJo/i9pZqd+9RQ+b4Kr/AyCLVSDi5hIcuANPXY07
aFy96t2rU4zQrfVzoJveqpj3fQLr8PNoRMLjTQ5LQppJS/Nrt/kB/IUl0zgciZCc
lxgv3pOheerCFK/nB+4TnkkCPaxPjSlVJyRF4ACYmkEzEvsX57lNuG/4JCf0aGIU
9vDTu5yjxWAMnNOyhjoTXMWoj2k8+Q==
=mPm2
-----END PGP SIGNATURE-----

--GH2yxKvaNZHfgciUvIYaiCKImHgjAlJjP--
