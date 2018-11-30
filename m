Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:57550 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726473AbeK3Wmy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Nov 2018 17:42:54 -0500
Date: Fri, 30 Nov 2018 12:33:53 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] mmc: tmio: fix reset operation
Message-ID: <20181130113353.3ljkc6sjvfdtkxyi@ninjato>
References: <20181126170247.4076-1-niklas.soderlund+renesas@ragnatech.se>
 <20181126170247.4076-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6iuffavcnk4vmiuu"
Content-Disposition: inline
In-Reply-To: <20181126170247.4076-3-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--6iuffavcnk4vmiuu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 26, 2018 at 06:02:46PM +0100, Niklas S=C3=B6derlund wrote:
> SD / MMC did not operate properly when suspend transition failed.
> Because the SCC was not reset at resume, issue of the command failed.
> Call the host specific reset function and reset the hardware in order to
> add reset of SCC. This change also fixes tuning on some stubborn cards
> on Gen2.
>=20
> Based on work from Masaharu Hayakawa.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Tested on M3-N and H3 ES2.0. eMMC cards were succesfully probed and
transfer speeds were satisfying.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--6iuffavcnk4vmiuu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlwBICEACgkQFA3kzBSg
KbaY9Q//UFnix0Z09O+jIle1JLZi6xGYNnegYBE3l2CHNgm51RNn+aU0lGzC+5rj
Xu0JLwP8EgWh8IL4ekJLV20ggBVbU+uqR+ZsfyQ4OGDOszBCMyM1876oP/jji8kT
EViR8/9TY5C0cIUSviXtpvNSxwfdL60ZBHNsbGAGY76mviwHfE+5u9WiERFi+dp/
MsEVF/DdbU3z+qmREHUt/Tz5wdW0VXNB7qNglD6nhCKaa6S7hCKEo/5vzROQ768z
pi9PR2c1dOL9h5gZoP4ZQFw0BS7JNzD68fCVYMNpJtFI+UdKS71V1sDX4ujNUzZv
lMHYVeHhn7A1ii8vtI5IvNFYM/8YfWz2YWJ3drgZ5t+XE3H76aEpt1h7TRYlPMjX
eVcgEMQEU6lFq35l8UFnD/RDa65hjbG7ew0fX2Ex9F3+DvIoPlSqttZNL+UL88Gs
vzjl76O+tMVujmXt9Lx+I3dxtaYF2MI5+tIN0XB7xlkRgLFLsBP7YzwkYh2nex8B
cbapZPmbwSADt4KuljFBwg/0qijwNWfZyklsCnvWyQYsSMqMk47pvthUzznKbrx4
8g6TdTGtz5LETrZSp46+CHGBGsPddRpRzVJyCWGmofT9vOWDwVON1uUYtmCFBWY4
HF0OJJlT18vqRQt6lxo8h68jXFpQrRllHik4toiwpNuOna41skU=
=WTSr
-----END PGP SIGNATURE-----

--6iuffavcnk4vmiuu--
