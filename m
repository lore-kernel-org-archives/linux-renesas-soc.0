Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58490 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726287AbeK0X2j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Nov 2018 18:28:39 -0500
Date: Tue, 27 Nov 2018 13:30:51 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: sh_mobile: add support for r8a77990 (R-Car E3)
Message-ID: <20181127123051.GN1107@kunai>
References: <20181121120928.25179-1-horms+renesas@verge.net.au>
 <20181121120928.25179-3-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6yHiY5vv/BiPjcMt"
Content-Disposition: inline
In-Reply-To: <20181121120928.25179-3-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--6yHiY5vv/BiPjcMt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 21, 2018 at 01:09:28PM +0100, Simon Horman wrote:
> Add support for the IIC code for the r8a77990 (R-Car E3).
>=20
> It is not considered compatible with existing fallback bindings
> due to the documented absence of automatic transmission registers.
>=20
> These registers are currently not used by the driver and
> thus the provides the same behaviour for "renesas,iic-r8a77990" and
> "renesas,rcar-gen3-iic". The point of declaring incompatibility is
> to allow for automatic transmission register support to be added to
> "renesas,iic-r8a77990" and "renesas,rcar-gen3-iic" in future.
>=20
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Applied to for-next, thanks!


--6yHiY5vv/BiPjcMt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlv9OPoACgkQFA3kzBSg
KbY/7xAAjI8EvFDaLVB88GNo9jssh0/SiW40Q6U2OC32xEQqXoGhETXWqntjLPFZ
ZW84C7AAg5MjAs/1u2sd2NeHI5Y9GaSqEoLtUQyACxGCfdqkv9v6gg8zcEXq1gFN
6zkYkccWAgBwzTGVXII/gDW0RAEbmtK+sMvkZSrJ5U6N0adhZQTaIQubTXJOWmlP
DWYZQW08pidezwlFxLISwW8lO9FTfDtRDEb9kfuQaZiFjdqzsEGeYOlBIzSIydOI
p35GJ0W0Ki51Tif8CoyLrvMqc36NZVi/jnFXLASHRxVFg+tLYip8CEWORbMFcva1
8S5rBKZreGSAqTRg2/plX7mnbKGfyjHxm6nw9BNJ6+V8xowJIly7Nb8WgETBKMsH
XceSSB58aOqIXJb78PEfTx8IsVsjWlOsBNc1FZCCckKqbA/Dm/mBBkn08LduoHjh
/5syVWp7PagxiBQPhpYBIOjXEXb8srRFTnpIVU0usdHO4Z8HadAAVztl+U1zgUSG
3Xi8NiERpyTNe//FmGBPOS8vUh3j+UFXE0CtZgsroHPOE6tVaRcMpoRBR3UTkMsj
RdcaHx18k+mmHXEQiDQcqvuJxx0a40zdYRryUmpQHhnWozTHmJiNHWQRfDegiFaF
Q431DxN/DDsPWF4JY5O8RJqwyyZ2J/UziE4lxx50O61WYFSkyJs=
=oBU2
-----END PGP SIGNATURE-----

--6yHiY5vv/BiPjcMt--
