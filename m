Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:40332 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726890AbeKSJYx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 04:24:53 -0500
Date: Mon, 19 Nov 2018 00:03:13 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Add and enable
 CAN,FD device nodes
Message-ID: <20181118230313.GB2553@kunai>
References: <20181118173424.4807-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Content-Disposition: inline
In-Reply-To: <20181118173424.4807-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 18, 2018 at 06:34:24PM +0100, Marek Vasut wrote:
> This patch adds CAN0,1 and CANFD device nodes for the r8a77990 SoC
> and enables CANFD connected to CN10 on the E3 Ebisu board using the
> R8A77990 SoC.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org

Same here, what was tested?


--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvx77AACgkQFA3kzBSg
KbaXihAAo1cAg2Wtw9zh6dbR+jo/gpfqoyMCcSIZFUTNJvKPumJWavYvZSaGZN1F
UlLPpdsrctRHC8kR8V4X1PjAQmdFikkJPoII5tma5hILM+NbjL3uM2ECUbcF/Ug6
wwDTpaUisk470L/JiQUL//qEbArV1lGiz/25CynrlnkavLrBGjTfU3rJJRveECeC
xWQwVEVZljFX3NKg++k0MbrITQ+tJZ0AjhXiEJ0+8sMHGd/qDL96DGYK1L+rlX2G
jCZa8QZuM5RAKo6UK+IZ7/kvEd+KurW1d93/SqW4f6LigMeToUixsSp1n5if9Lty
TezpGJrOVDp+4ch5Emch3yGfHr+P/Q6HkYpoRQbU7moOd3f3cv2Jmfg2BWkBuVf1
lO+3cQ5iHePjHlxsQqVv7h5mFw1ARiuuh1B5ob8rf+4Hqb37ObvDB+WFLAxdcLKe
8gecd+3rdIFzRIj5FdIPmRX+0TqFbQLh4vU+S4mMIhRfmZU7mRGckm7CwPo5RYQj
xygDCJNacBw+3yY5TsNoE5vqN3c9EYApSGMtpF2PAyXySqE5QD5JBPF6YJtiF53Y
yxwhjU2lQeZxekPeVpX6i0cV0K2VfPAw02AiJltaRvI+0LgkDRiH7ojNKLPwkQ/7
6f6WWNMqXgAtzcfedA/uwgSGt0yoxUm84U+oOcv8f8LaY7366Yw=
=LBB0
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--
