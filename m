Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:55557 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752062AbeD3IRi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Apr 2018 04:17:38 -0400
Subject: Re: [PATCH] DT: net: can: rcar_canfd: document R8A77970 bindings
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Wolfgang Grandegger <wg@grandegger.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
References: <7a3d170f-1d3a-a807-9256-15fe1a78ca4e@cogentembedded.com>
 <TY2PR01MB1962E2336D20499CF27134EBC38D0@TY2PR01MB1962.jpnprd01.prod.outlook.com>
From: Marc Kleine-Budde <mkl@pengutronix.de>
Message-ID: <bea94b38-0dba-33c6-46af-9d42ebff3b29@pengutronix.de>
Date: Mon, 30 Apr 2018 10:16:58 +0200
MIME-Version: 1.0
In-Reply-To: <TY2PR01MB1962E2336D20499CF27134EBC38D0@TY2PR01MB1962.jpnprd01.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="wa2jzPKmo6SKRBgH8Gbw3kwCSyxSUY90y"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wa2jzPKmo6SKRBgH8Gbw3kwCSyxSUY90y
Content-Type: multipart/mixed; boundary="tZL5NCDBARHzfiwcm4mxT6EYyUjN1DMNP";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Wolfgang Grandegger <wg@grandegger.com>,
 Mark Rutland <mark.rutland@arm.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Message-ID: <bea94b38-0dba-33c6-46af-9d42ebff3b29@pengutronix.de>
Subject: Re: [PATCH] DT: net: can: rcar_canfd: document R8A77970 bindings
References: <7a3d170f-1d3a-a807-9256-15fe1a78ca4e@cogentembedded.com>
 <TY2PR01MB1962E2336D20499CF27134EBC38D0@TY2PR01MB1962.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB1962E2336D20499CF27134EBC38D0@TY2PR01MB1962.jpnprd01.prod.outlook.com>

--tZL5NCDBARHzfiwcm4mxT6EYyUjN1DMNP
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

On 04/27/2018 01:33 PM, Ramesh Shanmugasundaram wrote:
> Hello Sergei,
>=20
> Thanks for your patch.
>=20
>> Subject: [PATCH] DT: net: can: rcar_canfd: document R8A77970 bindings
>>
>> Document the R-Car V3M (R8A77970) SoC support in the R-Car CAN-FD
>> bindings.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>=20
> Reviewed-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesa=
s.com>

Applied to linux-can.

tnx,
Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--tZL5NCDBARHzfiwcm4mxT6EYyUjN1DMNP--

--wa2jzPKmo6SKRBgH8Gbw3kwCSyxSUY90y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEENrCndlB/VnAEWuH5k9IU1zQoZfEFAlrm0PoACgkQk9IU1zQo
ZfHzbQgAoKEsQJvBYjjsNX87jY6XnSg1jnYJQo7/pSa1kE1JpoXgYCvKBW7aQjVZ
cbNLifFwIG32hg3DBkCCN1RakFZSZ8jmo52iHW4cw2L+FzheVDmWZsxuBnPr2CrL
YMAHbDsaruaZmQ4oN+CoftZqfo+NrwZyCi9mGDPc77KEsEQvmqm+Qy/yn6oI/Vjd
QSPZacE52ZuquiFnPcz7rXbKe/h+eOzNZBbq552AfzfxVCgpwiHVndM5FS9E9cjC
9e7it4K8SJI3go/t44+qFrVtZ0C6JZUmB4WhLJbw0aJmXF9klAOomFKZCkfQ6yMZ
fbCMYeXVvY01rKYmArF+QMAe2P9WjQ==
=ef5E
-----END PGP SIGNATURE-----

--wa2jzPKmo6SKRBgH8Gbw3kwCSyxSUY90y--
