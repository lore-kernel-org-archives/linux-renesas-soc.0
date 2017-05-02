Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:59214 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750868AbdEBIWu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2017 04:22:50 -0400
Date: Tue, 2 May 2017 10:22:47 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH/RFT v3 renesas-devel] ARM: dts: silk: Enable UHS-I SDR-50
Message-ID: <20170502082247.GB2640@katana>
References: <20170426080024.8391-1-horms+renesas@verge.net.au>
 <20170426081334.11846-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Content-Disposition: inline
In-Reply-To: <20170426081334.11846-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> +	sdhi1_pins_uhs: sd1_uhs {
> +		groups =3D "sdhi1_data4", "sdhi1_ctrl";
> +		function =3D "sdhi1";
> +		power-source =3D <1800>;
>  	};
> =20
>  	qspi_pins: qspi {
> @@ -338,11 +345,13 @@
> =20
>  &sdhi1 {
>  	pinctrl-0 =3D <&sdhi1_pins>;
> -	pinctrl-names =3D "default";
> +	pinctrl-1 =3D <&sdhi0_pins_uhs>;

This must be sdhi1_pins_uhs.


--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlkIQdYACgkQFA3kzBSg
KbbtaRAArM/c1f8Qj4rL4ewNvATZkyEMvcKzCOwzSq7mIj6NmIuh04C8OWB38X+3
r+GGKlMvYTUjOh8lbFl1VNmMHsJExzTYV+OPw0Y2+ms8r+jx1C06tbBqlPPsf3ju
FrBjEyc+9NUDxnLPrvFvbcvH/LOQG8DMmoQ0nqqsbgRN7FpuDAs0is36LA3vkPqZ
fnVVUg5IanP3Wlc5JQIpF2QuGUg1baTkfy6nBplNq4karR9OBt4w7QhK9xJ6BbON
0W9W/OB4o2PyT10rtACrlSWeYGot8cF7xGobSuON3l5cCy8dN5mIq8FIjSosFL1C
ylX130R6Z95IQFAAzokQzmVEy+bImoVrQeVdiv1Tj6fONBzO3XfwOiRTqnLunytu
1Z95W77ugPOczbN1iLJL46hrA1pB4v1upLfz6ZCO3eHVO5h1DEpA1IYE0FZ68DJa
9V0kni5lK489i6zTm45ADwn2jYfs0GFFm8GhyO+p8PDnxohSTMQZ43wgOhr0x3sb
FEAsqcIN7pqlszOpY7KPv9IANAzY7dC/cLCJtU5eJypKw4Ueq6/Uofnmmu7u5P9s
QnC6MBYhZ/ss/nIo0LN5hKhL8DyimV0HdosV7qlh7+PHs5L0ZVLNw6AIQVT1hUKx
LUB4wV03eN7nIj/4rtp9eAo+9gnuVIBTuBvSJ4LxmlJJJWPKvoc=
=pL8N
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--
