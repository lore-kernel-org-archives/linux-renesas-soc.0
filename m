Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:56434 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755998AbcFHIFU (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 8 Jun 2016 04:05:20 -0400
Date: Wed, 8 Jun 2016 10:05:16 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: r8a7790: lager: use demuxer for
 IIC3/I2C3
Message-ID: <20160608080516.GI1521@katana>
References: <1465370066-8450-1-git-send-email-horms+renesas@verge.net.au>
 <1465370066-8450-5-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uJWb33pM2TcUAXIl"
Content-Disposition: inline
In-Reply-To: <1465370066-8450-5-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--uJWb33pM2TcUAXIl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2016 at 04:14:26PM +0900, Simon Horman wrote:
> Create a separate bus for dla98063 PMIC and da9210 regulator
> related I2C slaves.
>=20
> Based on similar work for HDMI by Wolfram Sang.
>=20
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Maybe add a word that PFC doesn't allow I2C0/I2C3 to be muxed as GPIO?


--uJWb33pM2TcUAXIl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXV9G8AAoJEBQN5MwUoCm2qVsQAINq49JStJaHBxJeoE5/a/RU
D3D0oEkMzNKgbAm3UT6vCv11hJ4910XGnw3AUN+rtz9D9PpScaUaDUxoRUKFKQdJ
a0GrHMhGCSv/Q5EyPtCnXjU8mQpgxcjLytkIE09Ha3s4l3QnxSoJxn9+BQ9ndzyc
2eMiC5nQnkdhV6w9ydoaYiuUmX9HLhyt94ysJl4wGZUo29YQX33jgedHUX65ryHy
s9w/mm3i0DccQ91B0j4u+jZQH1z6GPL1fWiue1QFKT8D4ma5UCDHt3rn4X1AvCg+
KVkuULkza88DiHSB83yyDe6wKiKvPLu6FnRRMy1PxyYH17DV5UYhmz95pncjYhPJ
tLiYxpgPQcLElIAUQAb7WaxbAKIDVAX3QF2M2Jbj/Gdad1GcYcN3QTL51Njrl5Vz
/8/AAfSUkM4j3Tcf/tkK1g4+uDL09QCrwCkP/aYFs3FQAAy/8T87mHhzijgEI0d7
YgXNQtiSS3bT7SFBX+p7NoJfRh4QnfUiblVRFafqnDl+imm5pOuuYL3zVf7QIuGz
lSmk1i8r8mtsfCJuRK2e4yRhFOsmLUOI9I0lFzJJQYae5d++EfkjSPKG6kxKwNlx
YWKYryKkIS4Q9dFnJxj/jOj1wzB7eWTzsdWyR3/ZpTfC3D+MbMJOhmjc3DNMm6An
1N+p19Mm17lcOWT4hNQx
=IC2/
-----END PGP SIGNATURE-----

--uJWb33pM2TcUAXIl--
