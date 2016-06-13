Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:55529 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1424049AbcFMOdJ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 13 Jun 2016 10:33:09 -0400
Date: Mon, 13 Jun 2016 16:33:04 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 2/4] ARM: dts: r8a7790: lager: use demuxer for
 IIC1/I2C1
Message-ID: <20160613143304.GC1603@katana>
References: <1465370066-8450-1-git-send-email-horms+renesas@verge.net.au>
 <1465370066-8450-3-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Content-Disposition: inline
In-Reply-To: <1465370066-8450-3-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--lMM8JwqTlfDpEaS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2016 at 04:14:24PM +0900, Simon Horman wrote:
> Make it possible to select which I2C1 IP core you want to run on the
> EXIO-A connector.
>=20
> This is based on reference work for the I2C0 core of the lager by Wolfram=
 Sang.
>=20
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Given the PFC problem gets solved, why can't you switch to GP1_16 and
GP1_17 for those?


--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXXsQgAAoJEBQN5MwUoCm2yvkQAIwbuyH7Ry0K8PnNVMHSjrrG
OSoxvRJFBTHW+UON8qZ2r8IjU72D/wrbRgMLZv9FM1RTEQ1AsMuqhWPrll0PaXZz
T6RTz7p/Llimxyf44sZJhNGVZcERzxMnBuKcIv8VIkByrQncENuOlwmp4zNMYkTj
/y91XTJULcfCDRtTA/z6o+hf73mfJyidDsJUtbuUnoKM/AF0g/m4j1Rp99MZEd6q
ZU+Yoxkt9MC0ptT7K6bxnSF6aXIbYHQa7nM5SLZ6AAFKTdUs3f29aDtSEjbGKF+D
c00ICozaq/iqN/P5cCUIDSo689URnNRalt3ESzIc1og/griosIzXPIB0sWDv50Fs
IUlRtNdzOS02R4T90LoAMTo1no+GVXral2I+/CFmECmjbEBahxbhFZZOLnrop3HB
YwGlMVz3EK2kgmexknCPZzcOzrDvCR9WUdR0ZZRxBodS62ivZtMPmZubViuvj724
o8HrIrWCeoZufycRQHmLnVYXQac4IW51FcFiRxk1/YpZ2h35ZJ1HAsx5gm8e32Hy
KwBNO3b6y/zV5C/m00F68gT7zVIfzIGUZFmaTX1gq/Uxw7cBRdnnLoCp0Q9auz2r
HVZo6OCZM6MfZZOnjvfgaFnV/Bz0cnbAeoDa1xZjcTwo6XfAirYkrqLOV4AR1vf0
u1mLUkIwSKleZmPk0WSg
=vo2g
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--
