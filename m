Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:44554 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727728AbeKSVS0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 16:18:26 -0500
Date: Mon, 19 Nov 2018 11:55:08 +0100
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
Message-ID: <20181119105508.GC932@kunai>
References: <20181118173424.4807-1-marek.vasut+renesas@gmail.com>
 <20181118230313.GB2553@kunai>
 <63e27a31-d599-4672-87b9-48b0f542313d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rQ2U398070+RC21q"
Content-Disposition: inline
In-Reply-To: <63e27a31-d599-4672-87b9-48b0f542313d@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--rQ2U398070+RC21q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Same here, what was tested?
>=20
> I connected the CN10 to Peak CANFD, brought both interfaces up at
> 125kBd/250kBd for FD
> $ ip link set canX up type can bitrate 125000 dbitrate 250000 fd on
>=20
> And ran on either side:
> $ cangen -m canX
> and
> $ candump -t d -dex canX
> This should give a good mix of CAN messages.

Perfect, thanks!


--rQ2U398070+RC21q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvylowACgkQFA3kzBSg
KbbOCw/5Aci9Eca2FgVDCAhBYBFYYmMvATDf1/2t+CTBrY4UaqOA7PW5CH2hhzHK
ayqzP5WkKahb4ZGJRvZMWuRx1Dew+g1Hk4+r9v7lnwpmE8/G/+h9eaekGIrB7xd5
DAvXgrGqEkX/NE9lFWkU4BtihbRF/deuk3i8YFTJK03QLRwSdJjoCh/vY2NeAvH8
M6Uw/skuVAlSnopmRw1oAykg+ftYcYtxM3Fc51II99QeotQ7nFD/KrGx66wy/NcK
dNmkgMZf1BSqt2oBPlHlUJorIO7Ksiw3tlBwG1Pv4yPXz7JCwAejl1GJeGEjAvW7
HA2ACNC7Ttf+k/2Y+QxoLbYkGybHsR2NtkZqIhgjYZqvohRp/ARfBCjxFj8Aawyh
TptawEwYWaMag6BX/vi3na7xf/JsbvemmR8kkO9vCzMKGfGzckI5JCP+UZvg2/sN
7TdhT5SaMGvruha13FK+cFfO0aQXHRqzo8JGHQCjXRV/17eWN+E3scVUUAhbZQnX
/1crOPvTozw4N8tkyP+FB1TBF1rWwrGya72JxVc/eTOkdT84NdzJbH5cOpMWMrL7
LvhPbWR4drPElYdWwEk5fEb2XLYoqOwXgaOLLV3bY2mnKTQM24m8L35yM8+Q/D9H
kSH48fYB8fGxrRF6SR1KzllI7YTOiQyqMfGUu+2FLezHHutbBfs=
=c0SH
-----END PGP SIGNATURE-----

--rQ2U398070+RC21q--
