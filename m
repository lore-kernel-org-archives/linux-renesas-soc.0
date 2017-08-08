Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:34486 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752142AbdHHLuI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Aug 2017 07:50:08 -0400
Date: Tue, 8 Aug 2017 13:50:06 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Chris Paterson <chris.paterson2@renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH  1/2] dt-bindings: i2c: Document r8a7743/5 support
Message-ID: <20170808115006.GC1674@katana>
References: <1502191231-8682-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="V88s5gaDVPzZ0KCq"
Content-Disposition: inline
In-Reply-To: <1502191231-8682-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 08, 2017 at 12:20:31PM +0100, Biju Das wrote:
> Document i2c Device Tree support for RZ/G1[ME]
> (also known as r8aA774[35]) SoCs. They are compatible with
> R-Car Gen2 SoC family.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Looks good to me, yet I'd like an ack from Simon who is currently
working on the generic fallback compatibles.

> ---
>  Documentation/devicetree/bindings/i2c/i2c-rcar.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-rcar.txt b/Documen=
tation/devicetree/bindings/i2c/i2c-rcar.txt
> index 2b8bd33..cad39ae 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
> @@ -2,6 +2,8 @@ I2C for R-Car platforms
> =20
>  Required properties:
>  - compatible:
> +	"renesas,i2c-r8a7743" if the device is a part of a R8A7743 SoC.
> +	"renesas,i2c-r8a7745" if the device is a part of a R8A7745 SoC.
>  	"renesas,i2c-r8a7778" if the device is a part of a R8A7778 SoC.
>  	"renesas,i2c-r8a7779" if the device is a part of a R8A7779 SoC.
>  	"renesas,i2c-r8a7790" if the device is a part of a R8A7790 SoC.
> @@ -12,7 +14,8 @@ Required properties:
>  	"renesas,i2c-r8a7795" if the device is a part of a R8A7795 SoC.
>  	"renesas,i2c-r8a7796" if the device is a part of a R8A7796 SoC.
>  	"renesas,rcar-gen1-i2c" for a generic R-Car Gen1 compatible device.
> -	"renesas,rcar-gen2-i2c" for a generic R-Car Gen2 compatible device.
> +	"renesas,rcar-gen2-i2c" for a generic R-Car Gen2 or RZ/G1 compatible
> +				device.
>  	"renesas,rcar-gen3-i2c" for a generic R-Car Gen3 compatible device.
>  	"renesas,i2c-rcar" (deprecated)
> =20
> --=20
> 1.9.1
>=20

--V88s5gaDVPzZ0KCq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlmJpW4ACgkQFA3kzBSg
KbZj7A//UhqZXNEcCAeQgrztrtSx5oOOtGbWw3mBgQtKrpbeYV7gyCxXVutESTG1
55Lp5923e+mjtGQ2HoMQYC++BGsilwIQnPVnmCxryVo0wq6/RozygXtrnSBzeSV+
HrpBazS5mvemi9gEb4CBgpihO3cTKGqWHWh2/n1eAcHiFNj3+FKLAvJDi1pyvY0L
3Cid/n+mOmwWhDdXVTm0Ca6p6TnXMx/dXRqqmsRQWNPwq33cTHi+/qgj/jcwFeWc
IpxsLOROaI/fl+VM6jwtdUhny8bG6ooVd1E5UHGRRBdwm3sdGceo0AI/bfHxa5UM
voY0TOkv/9Egpq4vXiBDHAxBB+rHJxL4jpFO0qe4ji+lESi3JIky5Lo8Lw15gO88
SUVBpMGsTHBg2ztlpfVc7yYieaF1trMbJgIIUd0mLBHb+sUNezfCZiOIRkoQhMOO
cPrXF7kW7HRGxVebIUsslvOupZDBUyDNWcZhd79uzZ2iDLakigUiTS7l8P1FeEps
Zeu0mikURbf7lKuzx7LdcEu+JwG/9JUpwFowftIQ5Yu3Sn3LYeLtGdKC8oiZ+FCF
McP4soo/6UGyTz7oZbEx/VML0XPWIAvEmtS0w6HDYypxhBDE2v4PeKJEsv9Wvucr
f+S6AjREq7cjjQ86PLZznOaIHTnRJxVcJ7ymWZRJEv//1znr1Ms=
=m1iM
-----END PGP SIGNATURE-----

--V88s5gaDVPzZ0KCq--
