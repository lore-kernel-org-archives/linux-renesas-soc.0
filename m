Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:40416 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725921AbeKSJce (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 04:32:34 -0500
Date: Mon, 19 Nov 2018 00:10:53 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77965: Add CAN FD controller
 node
Message-ID: <20181118231053.GC2553@kunai>
References: <20181118173327.4704-1-marek.vasut+renesas@gmail.com>
 <20181118173327.4704-2-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="adJ1OR3c6QgCpb/j"
Content-Disposition: inline
In-Reply-To: <20181118173327.4704-2-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--adJ1OR3c6QgCpb/j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 18, 2018 at 06:33:27PM +0100, Marek Vasut wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>=20
> This patch adds CAN FD controller nodes for the R8A77965 SoC.
>=20
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org

Why seperate patches for CAN and CANFD here while they are merged for
r8a77990 into one patch?


--adJ1OR3c6QgCpb/j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvx8X0ACgkQFA3kzBSg
Kba0axAAhw+zxouDzk/7UZWhVOLojAdmdZb+gWpuzgW6214/demff+75UaT6Js/d
4n/y0X6w4WcxX8sJtJ2o22Q7kHSfxlLyUbO7+ZID7xuuThTbxvwM1yjni5WHFmn9
jOW4KVPQcQWcklBGVAyI4DOD2t1EwQEZ2MkJQl8O/Mtf91Ez32zgXF1ST1VqXcmW
dKmcC16vaSK0iUiOQSvOMWI+azAd1CLJ9Ei3V9NxzIiOPXU4ed9hk7wqxZY0cyUj
MknxqBjoxyTXZg90JzB3aywGILXbk53yKrS2us8xTmnxTF/9j5bFZCmoSlCcIe9e
Bp7+eth3Yk2pKypCIaunvpiBL79rMJSso3p4r+zWIWyNFIyj9kfXamN/8BPCUiHN
5yhNSmCLsK1mPSmbfOpSo1JwC/fNjFLV3P5KE2TliI3S8rG16LMkwT7k9AREXvQi
sM1/DCCjjgWilaumwXdl1EgHnlfbVExlSxM6LWlBPnNfAR6WopGXvSgJDTmcoiI3
uSRzX74woJH+mpsD9D+YlvVX9/iArl676mRc2cIJo7G/fxzdtD7qWVJLPgr62WD8
KA8X4oBvoXT93paeV1f+RKcs3Vpyfm4euLd9NV6H3NPYLoqUILsE2UDhBHKHOeNP
sZao/u359+AYIvlQXA8buAY+RWgzmD7b8pZx3TQ35YexKRgDWuc=
=OYbO
-----END PGP SIGNATURE-----

--adJ1OR3c6QgCpb/j--
