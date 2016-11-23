Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:60003 "EHLO
        metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S938658AbcKWOcG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Nov 2016 09:32:06 -0500
Subject: Re: [PATCH 0/3] arm64: dts: r8a7796: Add CAN/CAN FD support
To: Simon Horman <horms@verge.net.au>
References: <1479903243-1860-1-git-send-email-chris.paterson2@renesas.com>
 <f358442c-8373-328c-1270-709498c133f5@pengutronix.de>
 <20161123142938.GF9057@verge.net.au>
Cc: Chris Paterson <chris.paterson2@renesas.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org
From: Marc Kleine-Budde <mkl@pengutronix.de>
Message-ID: <5a04de78-1181-8198-0bd5-edd435a83289@pengutronix.de>
Date: Wed, 23 Nov 2016 15:31:43 +0100
MIME-Version: 1.0
In-Reply-To: <20161123142938.GF9057@verge.net.au>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="EbF0lrbds0EoArl4hxKMsACVFMBk3V6On"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EbF0lrbds0EoArl4hxKMsACVFMBk3V6On
Content-Type: multipart/mixed; boundary="UC0bpUBoLGnuhRmglfEnqrS9ks89F1S7X";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Simon Horman <horms@verge.net.au>
Cc: Chris Paterson <chris.paterson2@renesas.com>,
 Wolfgang Grandegger <wg@grandegger.com>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org
Message-ID: <5a04de78-1181-8198-0bd5-edd435a83289@pengutronix.de>
Subject: Re: [PATCH 0/3] arm64: dts: r8a7796: Add CAN/CAN FD support
References: <1479903243-1860-1-git-send-email-chris.paterson2@renesas.com>
 <f358442c-8373-328c-1270-709498c133f5@pengutronix.de>
 <20161123142938.GF9057@verge.net.au>
In-Reply-To: <20161123142938.GF9057@verge.net.au>

--UC0bpUBoLGnuhRmglfEnqrS9ks89F1S7X
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/23/2016 03:29 PM, Simon Horman wrote:
> On Wed, Nov 23, 2016 at 02:18:13PM +0100, Marc Kleine-Budde wrote:
>> On 11/23/2016 01:14 PM, Chris Paterson wrote:
>>> This patch series adds CAN and CAN FD support to the r8a7796.
>>>
>>> Based on renesas-devel-20161122-v4.9-rc6.
>>>
>>> Chris Paterson (3):
>>>   arm64: dts: r8a7796: Add CAN external clock support
>>>   arm64: dts: r8a7796: Add CAN support
>>>   arm64: dts: r8a7796: Add CAN FD support
>>>
>>>  .../devicetree/bindings/net/can/rcar_can.txt       | 12 +++--
>>>  .../devicetree/bindings/net/can/rcar_canfd.txt     | 12 +++--
>>>  arch/arm64/boot/dts/renesas/r8a7796.dtsi           | 61 ++++++++++++=
++++++++++
>>>  3 files changed, 75 insertions(+), 10 deletions(-)
>>
>> For all three:
>>
>> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>
>>
>> Who takes this series?
>=20
> I would like to see these patches split up so that the
> .../devicetree/bindings/ portions can go through you whole
> the arch/arm64/boot/dts/renesas/ portions go thorugh my renesas tree.

Ok

> Regarding the arch/arm64/boot/dts/renesas/ portion, I would like
> some consideration given to what effect enabling memory above 4Gb
> (64bit addressing) would have.

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--UC0bpUBoLGnuhRmglfEnqrS9ks89F1S7X--

--EbF0lrbds0EoArl4hxKMsACVFMBk3V6On
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEES2FAuYbJvAGobdVQPTuqJaypJWoFAlg1qE8ACgkQPTuqJayp
JWq3cwf/fI9p5wSj0o4SRxQQmjVSyMHVnxAEBiQ3EJFaBgpa5A+JbOfZQ9Yo71C+
eDVru2/SuJBkOyjaywMUyp6lOgL684qTponx76mtVIr6nNwiRPYGNDi7vs+Xda7a
KsYIyHGuX60Swf0ksSYndZbo2k0KaRRBa+Yf+s1lYn4QI3/vycaL8544jbfGuIvE
RLqbHsqbcOywT7gfQV2ygmRQYia7hBvhIv069UryhxlhtuqEugFUD6a62tflQh90
+Xb1giL6TMaNGO87bN0Uyf/EgJTFTdyD5VLqfsgvRIYUid798JLWUIrcR9bU5enc
S6Dej2ejfIvfJjsjH8hrXub7O/vu+w==
=04rC
-----END PGP SIGNATURE-----

--EbF0lrbds0EoArl4hxKMsACVFMBk3V6On--
