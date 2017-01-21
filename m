Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:55602 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750717AbdAUJgl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Jan 2017 04:36:41 -0500
Date: Sat, 21 Jan 2017 10:36:36 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 2/3] mmc: sh_mobile_sdhi: explain clock bindings
Message-ID: <20170121093636.GA1440@katana>
References: <20170121030604.7672-1-chris.brandt@renesas.com>
 <20170121030604.7672-3-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline
In-Reply-To: <20170121030604.7672-3-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 20, 2017 at 10:06:03PM -0500, Chris Brandt wrote:
> In the case of a single clock source, you don't need names. However,
> if the controller has 2 clock sources, you need to name them correctly
> so the driver can find the 2nd one. The 2nd clock is for the internal
> card detect logic.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYgyukAAoJEBQN5MwUoCm2gRMP/0n57BNBr7W0V5XfUD70pb1u
KYPoZx5kRl3M0BdF89oxO3p3UON4KKYfKTBwqX2S3V2B6Rkb+wQimn8VFxv2WAfD
8kBb2COhdY/sjTgZ/BxT1fSWGLquG3L3xtS4sXz2lNTfPPp8I3fc73Im/FOvQtKN
msjH5P43oVTOpcGMWCDZYmV7TF2ZJxaOq9WKbcL7Y4x4FsE6E0Id9+HrGon3j2zR
BV4d1bKvznnfw6OZzZObaMMeGkXpFPeQHcnd9Tmwtc5RJ6Nbsnmb2P8qr0QoPoZM
ldrmafbvUYNhsSGB2AxvbjA4+N96avZbe/Xx2ZVDapicAkId0N0RrS8Czkd2jwKp
qbKoLa7Ce3nXi/qdwDaqGelkD56YKqvDgNIDGgNQjiyz6pE0XeW4ynzqjYL24X1e
noG3x/HUNtjmmmRbY7e9jBxzUrjCCQAwFyEsKckxdcQsmu8bEI5aAhzd7PvFZyMF
ezLOXfsOPFEljcN6wXOHrkXgW+LS6avZp2IY06zfLsH6NNpEeFqPkMzLwHishn/9
zjwJVPPYukTfmq3PLHdaQfVVYtI8+cNEj8zfcnpsqdchcrpwUKHWzkAE07GXNy8l
L7qjwewmVB6jpVNxAWwgD8lApsVJAQJjWETPbTo3nkrkA49gV2qo3kLIYodcRst1
QdwqkiyNoRrGwuR1hYLk
=3biQ
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
